From: Sjoerd Venema <srg.venema@gmail.com>
Date: Thu, 5 Apr 2018 19:18:55 +0200
Subject: [Buildroot] ws281x library, scons, fails
Message-ID: <CAPzckP6sMQYU6cmsYv30P+CJsmvg=KHrvpVb+gC6BDOwHdqSwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a custom package which uses "scons", but I can't get it to compile.
I get the following error:

>>> rpi_ws281x e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6 Building
(cd
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6;
 PATH="/home/buildroot/buildroot-2018.02-rc3/output/host/bin:/home/buildroot/buildroot-2018.02-rc3/output/host/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/buildroot/.local/bin:/home/buildroot/bin"
 AR="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ar"
 AS="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-as"
 LD="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld"
 NM="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-nm"
 CC="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
 GCC="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
 CPP="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-cpp"
 CXX="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-g++"
 FC="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gfortran"
 F77="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gfortran"
 RANLIB="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ranlib"
 READELF="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-readelf"
 STRIP="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-strip"
 OBJCOPY="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-objcopy"
 OBJDUMP="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-objdump"
 AR_FOR_BUILD="/usr/bin/ar"
 AS_FOR_BUILD="/usr/bin/as"
 CC_FOR_BUILD="/usr/bin/gcc"
 GCC_FOR_BUILD="/usr/bin/gcc"
 CXX_FOR_BUILD="/usr/bin/g++"
 LD_FOR_BUILD="/usr/bin/ld"
 CPPFLAGS_FOR_BUILD="-I/home/buildroot/buildroot-2018.02-rc3/output/host/include"
 CFLAGS_FOR_BUILD="-O2
-I/home/buildroot/buildroot-2018.02-rc3/output/host/include"
 CXXFLAGS_FOR_BUILD="-O2
-I/home/buildroot/buildroot-2018.02-rc3/output/host/include"
 LDFLAGS_FOR_BUILD="-L/home/buildroot/buildroot-2018.02-rc3/output/host/lib
-Wl,-rpath,/home/buildroot/buildroot-2018.02-rc3/output/host/lib"
FCFLAGS_FOR_BUILD=""
 DEFAULT_ASSEMBLER="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-as"
DEFAULT_LINKER="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld"
 CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Os "
 CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os "
 LDFLAGS=""
 FCFLAGS=" -Os " FFLAGS=" -Os "
 PKG_CONFIG="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/pkg-config"
 STAGING_DIR="/home/buildroot/buildroot-2018.02-rc3/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot"
 INTLTOOL_PERL=/usr/bin/perl
 CROSS=/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-
/home/buildroot/buildroot-2018.02-rc3/output/host/bin/python2
/home/buildroot/buildroot-2018.02-rc3/output/host/bin/scons )

scons: Reading SConscript files ...
scons: done reading SConscript files.
scons: Building targets ...
Version version.h
CC      main.o
CC      mailbox.o
CC      ws2811.o
CC      pwm.o
CC      pcm.o
CC      dma.o
CC      rpihw.o
AR      libws2811.a
RANLIB  libws2811.a
LINK    test
scons: done building targets.
(cd
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/python;
PATH="/home/buildroot/buildroot-2018.02-rc3/output/host/bin:/home/buildroot/buildroot-2018.02-rc3/output/host/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/buildroot/.local/bin:/home/buildroot/bin"
PYTHONNOUSERSITE=1 python setup.py build)
running build
running build_py
creating build
creating build/lib.linux-x86_64-2.7
copying neopixel.py -> build/lib.linux-x86_64-2.7
running build_ext
building '_rpi_ws281x' extension
swigging rpi_ws281x.i to rpi_ws281x_wrap.c
swig -python -o rpi_ws281x_wrap.c rpi_ws281x.i
creating build/temp.linux-x86_64-2.7
/bin/gcc -pthread -fno-strict-aliasing -O2
-I/home/buildroot/buildroot-2018.02-rc3/output/host/include -DNDEBUG -g
-fwrapv -O3 -Wall -Wstrict-prototypes -fPIC
-I/home/buildroot/buildroot-2018.02-rc3/output/host/include/python2.7 -c
rpi_ws281x_wrap.c -o build/temp.linux-x86_64-2.7/rpi_ws281x_wrap.o
/bin/gcc -pthread -shared
-L/home/buildroot/buildroot-2018.02-rc3/output/host/lib
-Wl,-rpath,/home/buildroot/buildroot-2018.02-rc3/output/host/lib
-Wl,--enable-new-dtags build/temp.linux-x86_64-2.7/rpi_ws281x_wrap.o -L../.
-L/home/buildroot/buildroot-2018.02-rc3/output/host/lib -lws2811 -lrt
-lpython2.7 -o build/lib.linux-x86_64-2.7/_rpi_ws281x.so
*/usr/bin/ld: skipping incompatible .././libws2811.a when searching for
-lws2811*
*/usr/bin/ld: cannot find -lws2811*
collect2: error: ld returned 1 exit status
error: command '/bin/gcc' failed with exit status 1
make[1]: ***
[/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/.stamp_built]
Error 1
make: *** [_all] Error 2


Doing a 'file' on ws2811.o yields:
ws2811.o: ELF 32-bit LSB relocatable, ARM, version 1 (SYSV), not stripped

I'm building for the Raspberry Pi, so ARM, 32bit looks good..

Config.in, Makefile and Patch:
https://github.com/Sjoerd82/buildroot/tree/master/buildroot-2018.02-rc3/package/arctura/rpi_ws281x

Any idea??

kind regards,
Sjoerd
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180405/8eb9492e/attachment.html>
