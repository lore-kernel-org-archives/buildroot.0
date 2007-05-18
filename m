From: Tom <fivemiletom@gmail.com>
Date: Thu, 17 May 2007 22:31:11 -0700
Subject: [Buildroot] cygwin buildroot error - how to include libs ?
Message-ID: <464D3A1F.9060600@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

when building building cygwin I get the error shown below, due the lost 
linker not finding functions from the libintl library. The packages 
libintl, libintl1 etc are part of my cygwin installation.

I first ran into a similar problem when building the 2.6.21.1 kernel, 
which could be fixed by adding HOST_LOADLIBES="-lcurses -lintl" to the 
invocation and thus to the make commands. No luck. Would anyone know a 
place that will cause make to add it for all HOSTCC(linker) invocations?

Furthermore, is there a minimum requirement for the host gcc, is 3.4.4 
good enough?

Thanks
Tom


******************************************************
Buildroot cygwin build error
******************************************************


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
C++ compiler '/usr/bin/c++'
C++ compiler version '3.4.4':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

set -x && make MAKE="make -j1" -C /tw/buildroot/toolchain_build_arm/uClibc \
                 PREFIX=/tw/buildroot/toolchain_build_arm/uClibc_dev/ \
                 DEVEL_PREFIX=/usr/ \
 
RUNTIME_PREFIX=/tw/buildroot/toolchain_build_arm/uClibc_dev/ \
                 HOSTCC="gcc" \
                 pregen install_dev
+ make 'MAKE=make -j1' -C /tw/buildroot/toolchain_build_arm/uClibc 
PREFIX=/tw/bu
ildroot/toolchain_build_arm/uClibc_dev/ DEVEL_PREFIX=/usr/ 
RUNTIME_PREFIX=/tw/bu
ildroot/toolchain_build_arm/uClibc_dev/ HOSTCC=gcc pregen install_dev
/bin/sh: 
/tw/buildroot/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-gcc: No
  such file or directory
make[1]: 
/tw/buildroot/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-gcc: Co
mmand not found
make[1]: Entering directory `/tw/buildroot/toolchain_build_arm/uClibc'
make[1]: 
/tw/buildroot/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-gcc: Co
mmand not found
make[1]: Entering directory `/tw/buildroot/toolchain_build_arm/uClibc'
make[1]: Entering directory `/tw/buildroot/toolchain_build_arm/uClibc'
/bin/sh: 
/tw/buildroot/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-gcc: No
  such file or directory
make[2]: 
/tw/buildroot/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-gcc: Co
mmand not found
make[2]: 
/tw/buildroot/build_arm/staging_dir/bin/arm-linux-uclibcgnueabi-gcc: Co
mmand not found
gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE    conf.o 
  zconf.
tab.o -o conf
conf.o:conf.c:(.text+0xb2): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xc6): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xda): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0xf2c): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0x10c5): undefined reference to `_libintl_gettext'
conf.o:conf.c:(.text+0x116f): more undefined references to 
`_libintl_gettext' fo
llow
collect2: ld returned 1 exit status
make[2]: *** [conf] Error 1
make[1]: *** [extra/config/conf] Error 2
make[1]: Leaving directory `/tw/buildroot/toolchain_build_arm/uClibc'
make: *** [/tw/buildroot/toolchain_build_arm/uClibc/.configured] Error 2
