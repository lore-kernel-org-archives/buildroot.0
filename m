From: Dimitri Kaparis <kaparis.dimitri@gmail.com>
Date: Thu, 4 Aug 2011 12:40:53 +0300
Subject: [Buildroot] Arm build: asm error in libffi?
Message-ID: <CAFzH18j2mFTzSOrf1S9ChgaJ3cGyoxTOOTtCOuX8prUt5rXLzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I'm doing a build for arm using a crosstool-ng generated toolchain
(gcc 4.4.6, uclibc 0.9.30.3).
With buildroot-2011.05 I'm getting this:


libtool: compile:
(...)/buildroot-2011.05/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I./include -Iinclude -I./src -I. -I./include
-Iinclude -I./src -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -MT src/arm/sysv.lo -MD -MP -MF
src/arm/.deps/sysv.Tpo -c src/arm/sysv.S  -fPIC -DPIC -o
src/arm/.libs/sysv.o
src/arm/sysv.S: Assembler messages:
src/arm/sysv.S:246: Error: missing .fnstart before unwinding directive
make[3]: *** [src/arm/sysv.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
libtool: compile:
(...)/buildroot-2011.05/output/host/usr/bin/arm-unknown-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I./include -Iinclude -I./src -Wall -g
-fexceptions -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -MTsrc/closures.lo -MD -MP -MF
src/.deps/closures.Tpo -c src/closures.c -o src/closures.o >/dev/null
2>&1
make[3]: Leaving directory `(...)/buildroot-2011.05/output/build/libffi-3.0.9'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `(...)/buildroot-2011.05/output/build/libffi-3.0.9'
make[1]: *** [all] Error 2
make[1]: Leaving directory `(...)/buildroot-2011.05/output/build/libffi-3.0.9'
make: *** [(...)/buildroot-2011.05/output/build/libffi-3.0.9/.stamp_built]
Error 2

Any ideas?

Thanks,
Dimitri
