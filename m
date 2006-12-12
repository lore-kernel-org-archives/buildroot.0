From: Daniel Silverstone <dsilvers@digital-scurf.org>
Date: Tue, 12 Dec 2006 10:33:27 +0000
Subject: [Buildroot] Issue preparing a buildroot
Message-ID: <1165919607.6628.4.camel@petitemort.i.digital-scurf.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to forward-port a bunch of patches we have for a buildroot
of approx. July vintage to SVN HEAD. Unfortunately for me, I cannot get
buildroot to build on my Ubuntu edgy box.

No matter which combination of uclibc, binutils, kernel-headers etc I
choose, I fail to get past the toolchain bootstrap.

No matter what I choose, the gcc bootstrap fails because
<linux/limits.h> is not available. This is, of course, because the
kernel does not export this header as part of its userland interface any
more; yet we have a set of headers being unpacked by buildroot which do
contain it (assuming I pick an early enough set).

Does anyone here have experience of getting buildroot going on an
Ubuntu/edgy system, or even experience of resolving such an error?

Here is an example failure:

make[2]: Entering directory `/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-initial/gcc'
/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-initial/./gcc/xgcc -B/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-initial/./gcc/ -B/space/dsilvers/dev-simtec/buildroot-curl-support/build_i686/staging_dir/i686-linux-uclibc/bin/ -B/space/dsilvers/dev-simtec/buildroot-curl-support/build_i686/staging_dir/i686-linux-uclibc/lib/ -isystem /space/dsilvers/dev-simtec/buildroot-curl-support/build_i686/staging_dir/i686-linux-uclibc/include -isystem /space/dsilvers/dev-simtec/buildroot-curl-support/build_i686/staging_dir/i686-linux-uclibc/sys-include -O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include  -I. -I. -I/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-20061121/gcc -I/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-20061121/gcc/. -I/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-20061121/gcc/../include -I/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-20061121/gcc/../libcpp/include  -I/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-20061121/gcc/../libdecnumber -I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions -fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder  -fno-omit-frame-pointer \
          -c /space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-20061121/gcc/crtstuff.c -DCRT_BEGIN \
          -o crtbegin.o
In file included from /space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/uClibc_dev//usr/include/bits/posix1_lim.h:153,
                 from /space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/uClibc_dev//usr/include/limits.h:144,
                 from /space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-initial/./gcc/include/limits.h:122,
                 from /space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-initial/./gcc/include/syslimits.h:7,
                 from /space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-initial/./gcc/include/limits.h:11,
                 from /space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-20061121/gcc/tsystem.h:108,
                 from /space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/gcc-4.2-20061121/gcc/crtstuff.c:68:
/space/dsilvers/dev-simtec/buildroot-curl-support/toolchain_build_i686/uClibc_dev//usr/include/bits/local_lim.h:36:26: error: linux/limits.h: No such file or directory

I hope you can help,

Thank,

D.

-- 
Daniel Silverstone                         http://www.digital-scurf.org/
PGP mail accepted and encouraged.            Key Id: 2BC8 4016 2068 7895
