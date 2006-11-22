From: lists at primefarm.co.uk <lists@primefarm.co.uk>
Date: Wed, 22 Nov 2006 20:21:00 -0000 (UTC)
Subject: [Buildroot] problem generating c++ compiler for target arch
In-Reply-To: <20061122201834.GD1863@aon.at>
References: <33335.80.176.236.13.1164224678.squirrel@mail.primefarm.co.uk>
	<20061122200213.GB1863@aon.at>
	<33446.80.176.236.13.1164226145.squirrel@mail.primefarm.co.uk>
	<20061122201834.GD1863@aon.at>
Message-ID: <33518.80.176.236.13.1164226860.squirrel@mail.primefarm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK,

I managed to get buildroot to complete the build at last. Sadly, the c++
compiler is b0rked.

Looks like it's missing all sorts of libraries and things. Here is some
sample output trying to compile a very simple program (C++ hello world):


david at tulip:~/buildroot/build_arm/staging_dir/bin$ ./arm-linux-gcc foo.cpp
/tmp/ccNH0d2c.o: In function `std::__verify_grouping(char const*, unsigned
int, std::basic_string<char, std::char_traits<char>, std::allocator<char>
> const&)':
foo.cpp:(.text+0x20): undefined reference to `std::basic_string<char,
std::char_traits<char>, std::allocator<char> >::size() const'
foo.cpp:(.text+0x98): undefined reference to `std::basic_string<char,
std::char_traits<char>, std::allocator<char> >::operator[](unsigned int)
const'
foo.cpp:(.text+0x100): undefined reference to `std::basic_string<char,
std::char_traits<char>, std::allocator<char> >::operator[](unsigned int)
const'
foo.cpp:(.text+0x144): undefined reference to `std::basic_string<char,
std::char_traits<char>, std::allocator<char> >::operator[](unsigned int)
const'
/tmp/ccNH0d2c.o: In function `main':
foo.cpp:(.text+0x1ac): undefined reference to `std::basic_ostream<char,
std::char_traits<char> >& std::operator<< <std::char_traits<char>
>(std::basic_ostream<char, std::char_traits<char> >&, char const*)'
foo.cpp:(.text+0x1bc): undefined reference to `std::cout'
/tmp/ccNH0d2c.o: In function
`__static_initialization_and_destruction_0(int, int)':
foo.cpp:(.text+0x200): undefined reference to `std::ios_base::Init::Init()'
foo.cpp:(.text+0x228): undefined reference to `std::ios_base::Init::~Init()'
collect2: ld returned 1 exit status
david at tulip:~/buildroot/build_arm/staging_dir/bin$ cat foo.cpp
cat: foo.cpp: No such file or directory


All sorts of things missing there - have I inadvertantly broken lots of
buildroot?

David
