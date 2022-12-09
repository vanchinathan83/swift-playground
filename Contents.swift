import UIKit

var greeting = "Hello, playground"
var x = 10
let y = 20
var z = x + y
print(z)
print(greeting.uppercased())

print(greeting.count)

// String interpolation
var name = "Apple"

var percentage = 12

var result = "\(name) has \(percentage)% vitamin A"
print(result)
let celcius = 40.0
var fahrenheit = ((celcius * 9)/5) + 32
print("\(celcius)° degree celcius is \(fahrenheit)° in fahrenheit")



// complex data
var scores = Array<Int>()
scores.append(100)
scores.append(22)
scores.append(49)
print(scores.count)
scores.append(78)
print(scores[1])
scores.remove(at: 1)
print(scores)
scores.removeAll()
print(scores)

var companies = Array<String>()
companies.append("Apple")
companies.append("Amazon")
companies.append("Google")
companies.append("Facebook")
companies.append("Netflix")
companies.sorted()
print(companies)
print(companies.reversed())
print(companies.contains("PayPal"))

// Dictionaries
var employees = [
    "Vanchi" : [
        "job" : "Senior Software Engineering Manager",
        "location" : "Austin"
    ],
    "Tim Ferris" : [
        "job" : "Motivational Speaker",
        "location" : "New York"
    ]
]

print(employees["Hudson", default: [:]])

//Sets

var people = Set(["Ram", "Sita", "Lakshman", "Jesus", "Ram"])
print(people) // The ordering is not the same as in the array

var morePeople = Set<String>()
morePeople.insert("Apple")
morePeople.insert("Amazon")
morePeople.insert("Zillow")
morePeople.insert("PayPal")
print(morePeople)
print(morePeople.sorted())


enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
var dayOfTheWeek = Weekday.friday
dayOfTheWeek = .friday
// Swift is statically typed based on the initialization or declaration
var noInit: String

if dayOfTheWeek == .monday {
    print("Ah! It's MONDAY!!")
}

var username = "Vanchi"
if username.isEmpty || username == "Anonymous" {
    print("Please sign in!")
} else {
    print("Welcome \(username)")
}


switch dayOfTheWeek {
case .monday:
    print("It's Monday")
case .tuesday:
    print("It's barely Tuesday")
default:
    print("I dont know what day it is!! ")
}

var age = 7
var canVote = age >= 18 ? true : false
print(canVote)

// loops
let platforms = ["iOS", "Mac", "Android", "Windows"]

for os in platforms {
    print(os)
}


// Inclusive range
func printTables(number: Int, end: Int){
    for i in 1...end {
        print("\(number) x \(i) = \(number * i)")
    }
}

for _ in 0..<5 {
    print("Yuvan")
}

for i in 1...20 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
    }else if i.isMultiple(of: 3){
        print("Fizz")
    }else if i.isMultiple(of: 5) {
        print("Buzz")
    }else {
        print(i)
    }
}

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
print("Roll of dice yielded \(rollDice())")
printTables(number: 5, end: 10)

// Return multiple values from functions - TUPLES
func getUser() -> (firstName: String, lastName: String) {
    ("Vanchinathan", "Ayipalayam")
}
let user = getUser()
// can use _ to ignore a paramter in the tuple.
let(firstName, lastName) = getUser() // another way of receiving the tuples
print("User first name: \(user.firstName) and last name is : \(user.lastName)")

// function parameter names
// Internal and external names for parameters can be same or different
// use _ if you do not care what the external name is gonna be
// default values for function parameters

func rollDice(sides: Int, count: Int = 5) -> [Int] {
    var rolls = [Int]()
    for _ in 1...count {
        var roll = Int.random(in: 1...sides)
        rolls.append(roll)
        
    }
    return rolls
}

print(rollDice(sides: 6, count: 5))

// Handling Errors

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.isEmpty || password.count < 8 {
        throw PasswordError.short
    }
    
    if password == "12345678" || password == "password" {
        throw PasswordError.obvious
    }
    
   
    if password.count == 8{
        return "OK"
    } else if password.count > 10 {
        return "Excellent"
    } else{
        return "Good"
    }
}
do {
    try checkPassword("123")
} catch PasswordError.short{
    print("Password was short")
} catch PasswordError.obvious {
    print("Password is obvious")
} catch {
    print("There was an error")
}


// Closures - Passing functions around
func greetUser(user: String) {
    print("Welcome \(user)")
}

let greetCopy: (String) -> Void = greetUser

greetCopy("Taylor")

let sayHello =  { (name: String) -> String in
    return "Hi \(name)"
}

print(sayHello("Vanchi"))

var team = ["Karen", "Messi", "Ronaldo", "Kalande", "Tesa"]

func captainFirst(name1: String, name2: String) -> Bool {
    if name1 == "Messi" {
        return true
    } else if name2 == "Messi" {
        return false
    }else {
        return name1 < name2
    }
}

print(team.sorted(by: {(name1: String, name2 : String) -> Bool in
    if name1 == "Messi" {
        return true
    } else if name2 == "Messi" {
        return false
    }else {
        return name1 < name2
    }
}))

// Arguments can be represented as $0 or $1

let kOnlyNames = team.filter { $0.hasPrefix("K")}
print(kOnlyNames)

let uppercasedTeam = team.map { $0.uppercased()}
print(uppercasedTeam)

// functions accepting closures as aruguments

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
     var result = [Int]()
    
    for _ in 0..<size {
        var number = generator()
        result.append(number)
    }
    
    return result
}

let numberArray = makeArray(size: 10, using: { Int.random(in: 0...100)})
print(numberArray)


// Checkpoint
let luckyNumbers = [7,14,38,21,16,15,12,33,31,40]

luckyNumbers.filter{
    $0 % 2 == 0
}.sorted().map {
    print("\($0) is a lucky number")
}


// Structs
// Double is a struct

struct Movie {
    let name: String
    let year: Int
    let leadActor: String
    // This var will not be part of the initializers
    var views: Int = 100_000_000
    
    mutating func addViews(view : Int) {
        views += view
    }
}

var tommorowNeverDies = Movie(name: "", year: 2005, leadActor: "Daniel")
tommorowNeverDies.addViews(view: 10223)
print(tommorowNeverDies.views)

// Property observers
// didSet and willSet
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        didSet {
            print("New Contacts \(contacts)")
            print("Old Value = \(oldValue)")
        }
        willSet {
            print("Current Contact: \(contacts)")
            print("New Value = \(newValue)")
        }
    }
}

var app = App()
app.contacts.append("Apple")
app.contacts.append("Amazon")

// Custom Initializers
struct Player {
    let name :  String
    let id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    func printPlayerInfo(){
        print("Name: \(self.name) and id: \(self.id)")
    }
}

var player = Player(name: "Vanchi", id: 1)
player.printPlayerInfo()

// Access control
struct BankAccount {
    // Private ensures no one can access the funds information
    // fileprivate and public are other access control attributes
    // private(set) - read only
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        }
        
        return false
    }
}

var bank = BankAccount()
bank.deposit(amount: 100)
let withdrawalResult = bank.withdraw(amount: 200)
print(withdrawalResult)


// Static properties and methods

// Classes
// Supports inheritence
// Needs its own initializers
// deinitializers are possible

class SnakeGame {
    var score = 0 {
        didSet{
            print("Old score: \(oldValue)")
            print("The new score is \(self.score)")
        }
    }
}

var snakeGame = SnakeGame()
snakeGame.score = 10

// Inheritence of classes
class Employee {
    var hours: Int
    init(hours : Int){
        self.hours = hours
    }
    
    func printSummary(){
        print("I work \(self.hours) hours")
    }
}


class Developer : Employee {
    func work(){
        print("I have been coding for \(self.hours) hours")
    }
    // Overriding print Summary here
    override func printSummary() {
        print("I'm a great engineer")
    }
}

var developer = Developer(hours: 60)
developer.printSummary()


// Structs and Classes differ in how their instances are copied. Classes are reference types
// Structs are not reference types
class User {
    var name : String
    
    init(name: String){
        self.name = name
        print("Initializing a player")
    }
    
    deinit {
        print("DeInitializing a Player")
    }
}

for i in 1...3 {
    let user = User(name: String(i))
    print(user.name)
}

// Protocols
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        return distance/50
    }
    
    func travel(distance: Int) {
        print("Im traveling for \(distance) miles")
    }
    
    func openSunroof(){
        print("Opening sunroof!!")
    }
}
