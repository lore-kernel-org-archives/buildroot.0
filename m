From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Fri, 17 Aug 2007 12:56:59 -0400
Subject: [Buildroot] Best distro to use buildroot ?
References: <003501c7e0d5$a6d2d7c0$6e00a8c0@JONATHAN>
	<20070817155449.GA21322@real.realitydiluted.com>
Message-ID: <005701c7e0ef$a08f4d20$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I got this error when i try to build the jffs2 filesystem.

dumarjo at dumarjo-desktop:~/buildroot$ sudo make

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
[: 227: 3: unexpected operator
C++ compiler 'Usage: /usr/bin/which [-a] args'
C++ compiler version './/toolchain/dependencies/dependencies.sh:': 
Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

CFLAGS=-I/home/dumarjo/buildroot/toolchain_build_arm/linux/include 
/usr/bin/make -j1 CC="/usr/bin/gcc" CROSS= \
                LINUXDIR= -C 
/home/dumarjo/buildroot/toolchain_build_arm/mtd_orig/util mkfs.jffs2
make[1]: Entering directory 
`/home/dumarjo/buildroot/toolchain_build_arm/mtd_orig/util'
/usr/bin/gcc -I../include -O2 -Wall -g -c -o mkfs.jffs2.o 
mkfs.jffs2.c -g -Wp,-MD,.mkfs.jffs2.c.dep
mkfs.jffs2.c:68:18: error: zlib.h: No such file or directory
make[1]: *** [mkfs.jffs2.o] Error 1
make[1]: Leaving directory 
`/home/dumarjo/buildroot/toolchain_build_arm/mtd_orig/util'
make: *** 
[/home/dumarjo/buildroot/toolchain_build_arm/mtd_orig/util/mkfs.jffs2] Error 
2
dumarjo at dumarjo-desktop:~/buildroot$

I have check in the ../include and the zlib.h file is there.

Jonathan
----- Original Message ----- 
From: "Steven J. Hill" <sjhill@realitydiluted.com>
To: "Jonathan Dumaresq" <jdumaresq@cimeq.qc.ca>
Cc: <buildroot@uclibc.org>
Sent: Friday, August 17, 2007 11:54 AM
Subject: Re: [Buildroot] Best distro to use buildroot ?


>> What is the best distro to build buildroot.
>>
> There have been changes within the past couple of months that do
> a lot of dependency checking to make sure the buildroot environment
> is distro agnostic. Could you please tell us what your problem is
> with your path? Thanks.
>
> -Steve
> 
