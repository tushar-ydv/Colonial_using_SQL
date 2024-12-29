/*Tushar Yadav - Data Mananagement Homework 2*/
/*Colonial Database*/

#Q1. List the trip name of each trip that has the season Late Spring.
SELECT
	TripName,Season 
FROM
	Trip 
WHERE
	Season = 'Late Spring';

#Q2. List the trip name of each trip that is in the state of Vermont (VT) or that has a maximum group size greater than 10.
SELECT
	TripName, State, MaxGrpSize 
FROM
	Trip 
WHERE
	State = 'VT' OR MaxGrpSize > 10;

#Q3. List the trip name of each trip that has the season Early Fall or Late Fall.
SELECT
	TripName,Season 
FROM
	Trip 
WHERE
	Season = 'Early Fall' OR Season = 'Late Fall';

#Q4. How many trips are in the states of Vermont (VT) or Connecticut (CT)?
SELECT
	COUNT(*)  
FROM
	Trip 
WHERE
	State IN ( 'VT', 'CT' );
    
#Q5. List the name of each trip that does not start in New Hampshire (NH).
SELECT
	TripName, StartLocation 
FROM
	Trip 
WHERE
	state  <> 'NH';
    
#Q6. List the name and start location for each trip that has the type Biking.
SELECT
	TripName, StartLocation, Type 
FROM
	Trip 
WHERE
	Type = 'Biking';

#Q7. List the name of each trip that has the type Hiking and that has a distance of greater than six miles. Sort the results by the name of the trip.
SELECT
	TripName, Type 
FROM
	Trip 
WHERE
	Type = 'Hiking' AND Distance > 6 
ORDER BY
	TripName;

#Q8. List the name of each trip that has the type Paddling or that is located in Vermont (VT).
SELECT 
	TripName, Type, State
FROM 
	Trip
WHERE 
	Type = 'Paddling' OR State = 'VT';

#Q9. How many trips have a type of Hiking or Biking?
SELECT
	COUNT(*)
FROM
	Trip 
WHERE
	Type IN ( 'Hiking', 'Biking' );
	
#Q10. List the trip name and state for each trip that occurs during the Summer season. Sort the results by trip name within state.
SELECT
	TripName, State 
FROM
	Trip 
WHERE
	Season = 'Summer' 
ORDER BY
	State, TripName;

#Q11. List the trip name of each trip that has Miles Abrams as a guide.
SELECT
	t.TripName 
FROM
	Trip t
	JOIN TripGuides tg ON t.TripID = tg.TripID
	JOIN Guide g ON tg.GuideNum = g.GuideNum 
WHERE
	g.FirstName = 'Miles' AND g.LastName = 'Abrams';

#Q12. List the trip name of each trip that has the type Biking and that has Rita Boyers as a guide.
SELECT
	t.TripName, t.Type, g.LastName, g.FirstName 
FROM
	Trip t
	JOIN TripGuides tg ON t.TripID = tg.TripID
	JOIN Guide g ON tg.GuideNum = g.GuideNum 
WHERE
	t.Type = 'Biking' AND g.FirstName = 'Rita' AND g.LastName = 'Boyers';

#Q13. For each reservation that has a trip date of July 23, 2018, list the customer’s last name, the trip name, and the start location.
SELECT
	c.LastName, t.TripName, t.StartLocation 
FROM
	Trip t
	JOIN Reservation r ON t.TripID = r.TripID
	JOIN Customer c ON c.CustomerNum = r.CustomerNum 
WHERE
	r.TripDate = '2018-07-23';
	
#Q14. How many reservations have a trip price that is greater than $50.00 but less than $100.00?
SELECT
	COUNT(*) 
FROM
	Trip t
	JOIN Reservation r ON t.TripID = r.TripID 
WHERE
	r.TripPrice > 50 AND r.TripPrice < 100;
	
#Q15. For each reservation with a trip price of greater than $100.00, list the customer’s last name, the trip name, and the trip type.
SELECT
	c.LastName, t.TripName, t.Type 
FROM
	Trip t
	JOIN Reservation r ON t.TripID = r.TripID
	JOIN Customer c ON c.CustomerNum = r.CustomerNum 
WHERE
	r.TripPrice > 100;

#Q16. List the last name of each customer who has a reservation for a trip in Maine (ME).
SELECT
	c.LastName 
FROM
	Trip t
	JOIN Reservation r ON t.TripID = r.TripID
	JOIN Customer c ON c.CustomerNum = r.CustomerNum 
WHERE
	t.State = 'ME';

#Q17. How many trips originate in each state? Order the results by the state.
SELECT DISTINCT
	(COUNT( StartLocation )),State 
FROM
	Trip 
GROUP BY
	State 
ORDER BY
	State;
	
#Q18. List the reservation ID, customer last name, and the trip name for all reservations where the number of persons included in the reservation is greater than four.
SELECT
	r.ReservationID, c.LastName, t.TripName 
FROM
	Trip t
	JOIN Reservation r ON t.TripID = r.TripID
	JOIN Customer c ON r.CustomerNum = c.CustomerNum 
WHERE
	r.NumPersons > 4;
	
#Q19. List the trip name, the guide’s first name, and the guide’s last name for all trips that originate in New Hampshire (NH). Sort the results by guide’s last name within trip name.
SELECT
	t.TripName, g.FirstName AS guide_first_name, g.LastName AS guide_last_name
FROM
	Trip t
	JOIN TripGuides tp ON t.TripID = tp.TripID
	JOIN Guide g ON g.GuideNum = tp.GuideNum 
WHERE
	t.State = 'NH' 
ORDER BY
	t.TripName, g.LastName;

#Q20. List the reservation ID, customer number, customer last name, and customer first name for all trips that occur in July 2018.
SELECT
	r.ReservationID, c.Phone, c.LastName, c.FirstName 
FROM
	Reservation r
	JOIN Customer c ON r.CustomerNum = c.CustomerNum 
WHERE
	r.TripDate LIKE '2018-07-%';

#Q21. Colonial Adventure Tours calculates the total price of a trip by adding the trip price plus other fees and multiplying the result by the number of persons included in the reservation. List the reservation ID, trip name, customer’s last name, customer’s first name, and total cost for all reservations where the number of persons is greater than four. Use the column name TotalCost for the calculated field.
SELECT
	r.ReservationID, t.TripName, c.LastName AS customer_l_n,c.FirstName AS customer_f_n, ( r.TripPrice + r.OtherFees )* r.NumPersons AS TotalCost 
FROM
	Trip t
	JOIN Reservation r ON t.TripID = r.TripID
	JOIN Customer c ON c.CustomerNum = r.CustomerNum 
WHERE
	r.NumPersons > 4;
	
#Q22. List all customers whose first name starts with L or S. Sort the results by FirstName.
SELECT
	CustomerNum, FirstName, LastName
FROM
	Customer 
WHERE
	FirstName LIKE 'L%' 
	OR FirstName LIKE 'S%' 
ORDER BY
	FirstName;

#Q23. List all the trip names whose prices are between $30 and $50.
SELECT DISTINCT
	t.TripName 
FROM
	Trip t
	JOIN Reservation r ON t.TripID = r.TripID 
WHERE
	r.TripPrice BETWEEN 30 AND 50;

#Q24. Write a query to determine how many trips have prices between $30 and $50. (Please note that this question is different from number 23 above.)
SELECT 
	COUNT(DISTINCT t.TripName)
FROM
	Trip t
	JOIN Reservation r ON t.TripID = r.TripID 
WHERE
	r.TripPrice BETWEEN 30 AND 50;

#Q25. Display the trip ID, trip name, and reservation ID for all trips that do not yet have the reservations.
SELECT
	t.TripID, t.TripName, r.ReservationID 
FROM
	Trip t
	LEFT JOIN Reservation r ON t.TripID = r.TripID 
WHERE
	r.ReservationID IS NULL;

#Q26. List the trip information for each pair of trips that have the same start location.
SELECT
	t1.TripID AS TripID1, t1.TripName AS TripName1, t2.TripID AS TripID2, t2.TripName AS TripName2, t1.StartLocation 
FROM
	trip t1
	JOIN trip t2 ON t1.StartLocation = t2.StartLocation AND t1.TripID > t2.TripID 
ORDER BY
	t1.StartLocation;
	
#Q27. List information for each customer that either lives in the state of New Jersey (NJ), or that currently has a reservation, or both.
SELECT 
	DISTINCT c.CustomerNum, c.FirstName, c.LastName, c.State, r.ReservationID
FROM 
	colonial.customer c 
LEFT JOIN 
	colonial.reservation r ON c.CustomerNum = r.CustomerNum
WHERE 
	c.state = 'NJ' OR r.ReservationID IS NOT NULL;

#Q28. Display all guides who are not currently assigned to any trips.
SELECT
	g.* 
FROM
	Guide g
	LEFT JOIN TripGuides tg ON g.GuideNum = tg.GuideNum 
WHERE
	tg.TripID IS NULL;

#Q29. Display the guide information for each pair of guides that come from the same state.
SELECT
	g1.GuideNum AS GuideNum1,g1.FirstName AS FirstName1,g1.LastName AS LastName1,g2.GuideNum AS GuideNum2,g2.FirstName AS FirstName2,g2.LastName AS LastName2,g1.State 
FROM
	guide g1
	JOIN guide g2 ON g1.State = g2.State AND g1.GuideNum < g2.GuideNum 
ORDER BY
	g1.State, g1.LastName,g2.LastName;
    
#Q30. Display the guide information for each pair of guides that come from the same city.
SELECT
	g1.GuideNum AS GuideNum1, g1.FirstName AS FirstName1, g1.LastName AS LastName1, g2.GuideNum AS GuideNum2, g2.FirstName AS FirstName2, g2.LastName AS LastName2, g1.City 
FROM
	guide g1
	JOIN guide g2 ON g1.City = g2.City AND g1.GuideNum < g2.GuideNum 
ORDER BY
	g1.City, g1.LastName, g2.LastName;
