From: hartleys <hartleys@visionengravers.com>
Date: Wed, 13 Aug 2008 20:49:20 -0400
Subject: [Buildroot] Problem compiling c++ files
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190966BEED@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm not sure if this is a buildroot problem or something with automake.
Hopefully someone can help.

I'm trying to cross-compile a c++ program under buildroot with an
external toolchain. For some reason the ./configure output does not set
the CXX and CXXCPP variables with the full path to the executables. Then
during the make step I get  the following error:

if arm-linux-g++ -DHAVE_CONFIG_H -I. -I. -I../..   -I../..
-I../../include  -g -O2 -MT test.o -MD -MP -MF ".deps/test.Tpo" -c -o
test.o test.cpp; \
        then mv -f ".deps/test.Tpo" ".deps/test.Po"; else rm -f
".deps/test.Tpo"; exit 1; fi
/bin/sh: arm-linux-g++: command not found

Here's the relevant section of the generated Makefile:

CC = /usr/local/arm/4.1.1-920t/bin/arm-linux-gcc -Os
-I/home/cross/buildroot/build_arm/staging_dir/include
-I/home/cross/buildroot/build_arm/staging_dir/usr/include
-I/usr/local/arm/4.1.1-920t/arm-linux/include
CCDEPMODE = depmode=gcc3
CFLAGS = -g -O2 -Wall
CPP = /usr/local/arm/4.1.1-920t/bin/arm-linux-cpp -Os
-I/home/cross/buildroot/build_arm/staging_dir/include
-I/home/cross/buildroot/build_arm/staging_dir/usr/include
-I/usr/local/arm/4.1.1-920t/arm-linux/include
CPPFLAGS = 
CXX = arm-linux-g++
CXXCPP = arm-linux-g++ -E

Shouldn't the CXX and CXXCPP also be prefixed by
/usr/local/arm/4.1.1-920t/bin/?

All the other programs in the external toolchain, such as AR, RANLIB and
STRIP, have the prefix.

Thanks,
Hartley
