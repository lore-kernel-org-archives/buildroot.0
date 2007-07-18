From: Gabbar Singh <gabbar_singh_new@yahoo.com>
Date: Tue, 17 Jul 2007 21:51:18 -0700 (PDT)
Subject: [Buildroot] Buildroot compilation errors (libintl) in cygwin.
Message-ID: <358465.84284.qm@web52107.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am trying to build a rootfs for arm9 using buildroot.
I am getting this error repeatedly. I couldnt find any helpful info on googling. could anybody please help me out with this.

$ make
if [ ! -e "/home/buildroot/toolchain_build_arm/bin/sed" ] ; then \
                mkdir -p "/home/buildroot/toolchain_build_arm/bin"; \
                rm -f "/home/buildroot/toolchain_build_arm/bin/sed"; \
                ln -sf "/usr/bin/sed" "/home/buildroot/toolchain_build_arm
/bin/sed"; \
        fi

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/usr/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '3.4.4':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '3.4.4':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

set -x && make MAKE="make -j1" -C /home/buildroot/toolchain_build_arm/uCli
bc-0.9.29 \
                PREFIX=/home/buildroot/toolchain_build_arm/uClibc_dev/ \
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/home/buildroot/toolchain_build_arm/uClibc_
dev/ \
                HOSTCC="/usr/bin/gcc" \
                pregen install_dev
+ make 'MAKE=make -j1' -C /home/buildroot/toolchain_build_arm/uClibc-0.9.2
9 PREFIX=/home/buildroot/toolchain_build_arm/uClibc_dev/ DEVEL_PREFIX=/usr
/ RUNTIME_PREFIX=/home/buildroot/toolchain_build_arm/uClibc_dev/ HOSTCC=/u
sr/bin/gcc pregen install_dev
/bin/sh: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc: No such file or di
rectory
make[1]: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc: Command not found
make[1]: Entering directory `/home/buildroot/toolchain_build_arm/uClibc-0.
9.29'
make[1]: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc: Command not found
make[1]: Entering directory `/home/buildroot/toolchain_build_arm/uClibc-0.
9.29'
make[1]: Entering directory `/home/buildroot/toolchain_build_arm/uClibc-0.
9.29'
/bin/sh: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc: No such file or di
rectory
make[2]: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc: Command not found
make[2]: /home/arm/usr/bin/arm-linux-uclibcgnueabi-gcc: Command not found
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE    conf.
o  zconf.tab.o -o conf
conf.o:conf.c:(.text+0xb2): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xc6): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xda): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xf2c): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0x10c5): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0x116f): more undefined references to `_libintl_gettext' fo
llow
collect2: ld returned 1 exit status
make[2]: *** [conf] Error 1
make[1]: *** [extra/config/conf] Error 2
make[1]: Leaving directory `/home/buildroot/toolchain_build_arm/uClibc-0.9
.29'
make: *** [/home/buildroot/toolchain_build_arm/uClibc-0.9.29/.configured]
Error 2


Thanks and Regards,
Naren

 
---------------------------------
Need Mail bonding?
Go to the Yahoo! Mail Q&A for great tips from Yahoo! Answers users.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070717/e43b8dc7/attachment-0001.htm 
