From: Robert Carter <r.carter@cs.auckland.ac.nz>
Date: Thu, 03 Aug 2006 18:00:54 +1200
Subject: [Buildroot] make troubles
Message-ID: <1154584855.22773.13.camel@turing>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I'm just getting started with buildroot and i'm having some trouble
building. I'm using the daily buildroot snapshot tarball from
02-Aug-2006 00:15. I am using the default .config file created by 

make menuconfig

with only default options (I don't make changes to any options).

The build runs for a while but fails in the end with an error. If I run
make once more I get the output below. 

Rob

http://organicdesign.co.nz/Special:Recentchanges
-------------------------------------------------------

root at turing:~/buildroot# make

Checking build system dependencies:
sed works:                          Ok
GNU make version '3.81beta4':       Ok
gcc version '4.0.3':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

make -j1
CC=/home/rob/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc
CROSS_COMPILE="/home/rob/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-" CROSS="/home/rob/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-" PREFIX="/home/rob/buildroot/build_i686/root" \
                EXTRA_CFLAGS="-Os -pipe "
-C /home/rob/buildroot/build_i686/busybox
make[1]: Entering directory `/home/rob/buildroot/build_i686/busybox'
  CC modutils/lsmod.o
/home/rob/buildroot/build_i686/busybox/modutils/lsmod.c: In function
`lsmod_main':
/home/rob/buildroot/build_i686/busybox/modutils/lsmod.c:96: warning:
dereferencing type-punned pointer will break strict-aliasing rules
/home/rob/buildroot/build_i686/busybox/modutils/lsmod.c:114: warning:
dereferencing type-punned pointer will break strict-aliasing rules
make[2]: *** [/home/rob/buildroot/build_i686/busybox/modutils/lsmod.o]
Error 1
make[1]: *** [_all] Error 2
make[1]: Leaving directory `/home/rob/buildroot/build_i686/busybox'
make: *** [/home/rob/buildroot/build_i686/busybox/busybox] Error 2

root at turing:~/buildroot# make
Checking build system dependencies:
sed works:                          Ok
GNU make version '3.81beta4':       Ok
gcc version '4.0.3':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

make -j1
CC=/home/rob/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc
CROSS_COMPILE="/home/rob/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-" CROSS="/home/rob/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-" PREFIX="/home/rob/buildroot/build_i686/root" \
                EXTRA_CFLAGS="-Os -pipe "
-C /home/rob/buildroot/build_i686/busybox
make[1]: Entering directory `/home/rob/buildroot/build_i686/busybox'
  CC modutils/lsmod.o
/home/rob/buildroot/build_i686/busybox/modutils/lsmod.c: In function
`lsmod_main':
/home/rob/buildroot/build_i686/busybox/modutils/lsmod.c:96: warning:
dereferencing type-punned pointer will break strict-aliasing rules
/home/rob/buildroot/build_i686/busybox/modutils/lsmod.c:114: warning:
dereferencing type-punned pointer will break strict-aliasing rules
make[2]: *** [/home/rob/buildroot/build_i686/busybox/modutils/lsmod.o]
Error 1
make[1]: *** [_all] Error 2
make[1]: Leaving directory `/home/rob/buildroot/build_i686/busybox'
make: *** [/home/rob/buildroot/build_i686/busybox/busybox] Error 2
