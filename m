From: Chris Kerios <ckerios@gmail.com>
Date: Mon, 27 Feb 2012 20:31:10 -0500
Subject: [Buildroot] RC3 ctng toolchain build failure
Message-ID: <CAKyeDQ9trStPDomP37wKGCbgobgWmjt6UkG-amrFLOj_KvPcXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doing a vanilla build (nothing other than defaults) on Fedora 14 host
for a i386/geode target.  No packages added, just brought up make
xconfig and set for ctng with uclibc for the library and saved.  No
other settings  were used other than defaults for everything.  Was not
using ccache either.  Seems it can't find fenv.h for some reason.
Researched news list and didn't see anything on this except something
a few months ago about version conflicts and not using ccache.  Also,
I didn't select to build C++ either.  Any ideas?  Messages below.

Regards,
Chris

[ALL  ]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/i586-unknown-linux-uclibc/build/build-cc-core-static/./gcc/xgcc
-B/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/i586-unknown-linux-uclibc/build/build-cc-core-static/./gcc/
-B/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/i586-unknown-linux-uclibc/build/gcc-core-static/i586-unknown-linux-uclibc/bin/
-B/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/i586-unknown-linux-uclibc/build/gcc-core-static/i586-unknown-linux-uclibc/lib/
-isystem /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/i586-unknown-linux-uclibc/build/gcc-core-static/i586-unknown-linux-uclibc/include
-isystem /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/i586-unknown-linux-uclibc/build/gcc-core-static/i586-unknown-linux-uclibc/sys-include
-g -Os -O2   -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual
-Wold-style-definition  -isystem ./include  -fPIC -g  -DIN_LIBGCC2
-D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc  -I. -I. -I../.././gcc
-I/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc
-I/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/.
-I/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/../gcc
-I/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/../include
-I/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid
-DENABLE_DECIMAL_BID_FORMAT -DHAVE_CC_TLS -DUSE_TLS -o
bid_decimal_data.o -MT bid_decimal_data.o -MD -MP -MF
bid_decimal_data.dep -c
/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_data.c
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:47:18:
error: fenv.h: No such file or directory
[ALL  ]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:
In function '__dfp_test_except':
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:59:
error: 'FE_INEXACT' undeclared (first use in this function)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:59:
error: (Each undeclared identifier is reported only once
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:59:
error: for each function it appears in.)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:61:
error: 'FE_UNDERFLOW' undeclared (first use in this function)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:63:
error: 'FE_OVERFLOW' undeclared (first use in this function)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:65:
error: 'FE_DIVBYZERO' undeclared (first use in this function)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:67:
error: 'FE_INVALID' undeclared (first use in this function)
[ALL  ]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:
In function '__dfp_raise_except':
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:76:
error: 'FE_INEXACT' undeclared (first use in this function)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:78:
error: 'FE_UNDERFLOW' undeclared (first use in this function)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:80:
error: 'FE_OVERFLOW' undeclared (first use in this function)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:82:
error: 'FE_DIVBYZERO' undeclared (first use in this function)
[ERROR]    /home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/src/gcc-4.4.6/libgcc/config/libbid/bid_decimal_globals.c:84:
error: 'FE_INVALID' undeclared (first use in this function)
[ERROR]    make[4]: *** [bid_decimal_globals.o] Error 1
[ALL  ]    make[4]: *** Waiting for unfinished jobs....
[ALL  ]    make[4]: Leaving directory
`/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/i586-unknown-linux-uclibc/build/build-cc-core-static/i586-unknown-linux-uclibc/libgcc'
[ERROR]    make[3]: *** [all-target-libgcc] Error 2
[ALL  ]    make[3]: Leaving directory
`/home/chris/Embedded/buildroot-2012.02-rc3/output/build/build-toolchain/.build/i586-unknown-linux-uclibc/build/build-cc-core-static'
[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Installing static core C compiler'
[ERROR]  >>        called in step '(top-level)'
[ERROR]  >>
[ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions at 172]
[ERROR]  >>        called from: do_cc_core[scripts/build/cc/gcc.sh at 381]
[ERROR]  >>        called from: do_cc_core_pass_2[scripts/build/cc/gcc.sh at 95]
[ERROR]  >>        called from: main[scripts/crosstool-NG.sh at 595]
[ERROR]  >>
[ERROR]  >>  For more info on this error, look at the file: 'build.log'
[ERROR]  >>  There is a list of known issues, some with workarounds, in:
[ERROR]  >>
'/home/chris/Embedded/buildroot-2012.02-rc3/output/host/usr/share/doc/ct-ng-1.13.4/B
- Known issues.txt'
[ERROR]
[ERROR]  (elapsed: 21:35.18)
make[2]: *** [build] Error 2
make[1]: *** [build.2] Error 2
make: *** [/home/chris/Embedded/buildroot-2012.02-rc3/output/stamps/ct-ng-toolchain-built]
Error 2
