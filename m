From: Will Newton <will.newton@gmail.com>
Date: Tue, 10 Aug 2010 13:22:50 +0100
Subject: [Buildroot] Build failure with 2010.08-rc1
Message-ID: <AANLkTikDrKuuL2q6Mp_rL-MFVg4nBoTMJeHiGAXFJoM-@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

buildroot 2010.08-rc1 is failing to build for me part way through the
initial gcc build.

/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4-initial/./gcc/xgcc
-B/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4-initial/./gcc/
-B/home/ldap/wnewton/src/metag-buildroot2/output/build/staging_dir/usr/metag-unknown-linux-uclibc/bin/
-B/home/ldap/wnewton/src/metag-buildroot2/output/build/staging_dir/usr/metag-unknown-linux-uclibc/lib/
-isystem /home/ldap/wnewton/src/metag-buildroot2/output/build/staging_dir/usr/metag-unknown-linux-uclibc/include
-isystem /home/ldap/wnewton/src/metag-buildroot2/output/build/staging_dir/usr/metag-unknown-linux-uclibc/sys-include
-O2  -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -fomit-frame-pointer -fPIC -g0 -DHAVE_GTHR_DEFAULT
-DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -I. -I.
-I/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc
-I/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/.
-I/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/../include
-I/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/../libcpp/include
-I/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gmp/include
-I/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/mpfr/include
-I/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/../libdecnumber
-I../libdecnumber  -fexceptions -c
/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/unwind-dw2.c
-o libgcc/./unwind-dw2.o
In file included from ./gthr-default.h:1,
                 from
/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/gthr.h:114,
                 from
/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/unwind-dw2.c:42:
/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/gthr-posix.h:43:21:
error: pthread.h: No such file or directory
/home/ldap/wnewton/src/metag-buildroot2/output/toolchain/gcc-4.2.4/gcc/gthr-posix.h:44:20:
error: unistd.h: No such file or directory

Which appears to be caused by trying to build gcc without headers. I
assume the configure --with-newlib is intended to build against the
newlib headers? How is this intended to work as by default gcc does
not ship with newlib?
