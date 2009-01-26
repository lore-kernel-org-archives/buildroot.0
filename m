From: Craig Dry <craigdry@yahoo.com>
Date: Mon, 26 Jan 2009 13:02:55 -0800 (PST)
Subject: [Buildroot] arm buildroot problem
Message-ID: <266406.44886.qm@web31810.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
?
?I am new to buildroot. I am having?the following problem:
?
??? 1. I downloaded the latest buildroot to my Fedora Core 10 PC as follows:
??? ??? svn co svn://uclibc.org/trunk/buildroot
?
??? 2. Configure it by:
??? ??? make menuconfig (I changed the target Architecture to "arm".? Then I exited and save the configuration file.? No other changes.)
?
??? 3.?do a build by entering:
??? ??? make > make.log
?
Unfortunately I get the following error:
?
TARGET_CPU_DEFAULT="" \
?HEADERS="auto-host.h ansidecl.h" DEFINES="" \
?/bin/sh /home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/mkconfig.sh bconfig.h
/usr/lib/ccache/gcc? -c?? -g -O2 -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE? -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute??? -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc -I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/build -I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/../include -I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/../libcpp/include -I/home/cdry/buildroot/toolchain_build_arm/gmp/include -I/home/cdry/buildroot/toolchain_build_arm/mpfr/include -I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/../libdecnumber -I/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/../libdecnumber/dpd -I../libdecnumber??? -o build/genmodes.o /home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2/gcc/genmodes.c
/home/cdry/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as: unrecognized option `-Qy'
make[2]: *** [build/genmodes.o] Error 1
make[2]: Leaving directory `/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory `/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2-initial'
make: *** [/home/cdry/buildroot/toolchain_build_arm/gcc-4.3.2-initial/.compiled] Error 2

?
For the purpose of comparison, I?tried the following:
??? 1. got a fresh new buildroot from svn
??? 2. make menuconfig (this time, I leave the architecture selection at i386.? I exit and save the config file.)
??? 3. make > make.log
??? 4.?Runs to completion without error.
?
So I see the problem for the "arm" architecture, but not for the "i386" architecture. I need it for arm as
I am trying to put together a system for the KwikByte 9202C board(containing an Arm920T cpu).
?
If you have any idea how I can fix?this problem, I will appreciate it.
?
Thanks,
Craig Dry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090126/f14ce968/attachment-0001.htm 
