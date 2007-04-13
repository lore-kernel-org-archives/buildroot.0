From: Haavard Skinnemoen <hskinnemoen@atmel.com>
Date: Fri, 13 Apr 2007 09:54:51 +0200
Subject: [Buildroot] C++ support in uclibc toolchain for arm.
In-Reply-To: <1176438335.3670.9.camel@localhost.localdomain>
References: <1176438335.3670.9.camel@localhost.localdomain>
Message-ID: <20070413095451.548a95ad@dhcp-252-105.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Apr 2007 09:55:35 +0530
aniruddha <aniruddha.navur@tokheimkaizen.com> wrote:

> Dear All,
> 
> Following error is thrown when I make a C++ program using uclibc
> toolchain(gcc- 3.2.2,uclibc-0.9.21,binutils- 2.13.21)
> 
> ERROR Description:
> 
> make[1]: Entering directory
> `/home/karim/control-project/daq-module/sysappl/C++'
> g++    -c -o test1.o test1.cpp
> /home/karim/control-project/daq-module/tools/arm-uClibc/bin/arm-uclibc-gcc -c --static -o test1 test1.o
> arm-linux-gcc: test1.o: linker input file unused because linking not
> done

-c is only used for compiling. Just drop it if you want to link. Also,
you should probably link C++ applications using g++ in order to pull in
the C++ libraries automatically. Finally, the object file should be
compiled using a cross compiler, not the host compiler (assuming you
are indeed cross-compiling.)

Haavard
