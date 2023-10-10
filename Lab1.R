#Read Batting csv into dataset "Lab1"
Lab1=read.csv('Lab1_MLB_Batting_2021.csv')
#Assign Lab1 dataset to a plot
plot1=ggplot(Lab1)
#Create a graph of the univariate distribution of slugging percentage
plot1+geom_histogram(aes(x=SluggingPer), binwidth=.01, col='peachpuff3',fill='black') + labs(title='Frequency of Slugging Percentages', x='Slugging Percentage (%)', y='Frequency') + theme_classic()
#Appropriate statistics
fivenum(Lab1$SluggingPer)
#How many players in each position are there in this dataset
table(Lab1$Position)
#Who is the only pitcher?
Lab1$Name[Lab1$Position=='Pitcher']
#What team did he play for?
Lab1$Team[Lab1$Position=='Pitcher']
#Is slugging percentage related to the number of times a player struck-out?
#Create a plot that demonstrates this relationship
plot2=ggplot(Lab1)
plot2+geom_point(aes(x=SluggingPer, y=StrikeOuts))+ labs(title='Slugging Percentage of a Player Based on Number of Strike Outs', x='Slugging Percentage', y='Frequency of Strike Outs') + geom_point(aes(x=SluggingPer, y=StrikeOuts), pch=20) + theme_classic()+ylim(c(0,250))
#Show the appropriate statistics to demonstrate this relationship
cor(Lab1$SluggingPer,Lab1$StrikeOuts)
#Create a new variable that groups each player based on whether he is a “power hitter” or not (At least 20 homeruns)
Lab1$PowerHitter=Lab1$HomeRuns>=20
#How many players in the dataset are powerhitters?
#Create a table that dispays total number of powerhiter players under "True"
table(Lab1$PowerHitter)
#Create a graph that displays the relationship between strike-outs and slugging percentage split by the two “power hitter” groups
plot3=ggplot(Lab1)
plot3+geom_point(aes(x=SluggingPer, y=StrikeOuts, col=PowerHitter))+ labs(title='Slugging Percentage of a Player Based on Number of Strike Outs', x='Slugging Percentage', y='Frequency of Strike Outs') + theme_classic()+ylim(c(0,250)) + scale_colour_brewer(type='qual',palette=3)
# Describe the relationship between strike-outs and slugging for Power Hitters
cor(Lab1$SluggingPer[Lab1$PowerHitter=='TRUE'], Lab1$StrikeOuts[Lab1$PowerHitter=='TRUE'])
# For Non-Power Hitters
cor(Lab1$SluggingPer[Lab1$PowerHitter=='FALSE'], Lab1$StrikeOuts[Lab1$PowerHitter=='FALSE'])



