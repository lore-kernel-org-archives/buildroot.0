From: Gertjan Hofman <gertjan_hofman@yahoo.com>
Date: Thu, 4 Oct 2007 15:11:44 -0700 (PDT)
Subject: [Buildroot] ARM soft-float toolchain build crashes 20071004
Message-ID: <155346.38582.qm@web32610.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't want to report this as a bug if it's not...but.

Dowload 4-Oct-2007 version of buildroot. Choose ARM
processor, choose 'soft-float' in make menuconfig.

make:
....
 CC libc/misc/internals/__uClibc_main.os
  CC libc/stdlib/atexit.os
  AS lib/crt1.o
  AS lib/Scrt1.o
  AS lib/crti.o
  AS lib/crtn.o
  STRIP -x -R .note -R .comment lib/libc.a
  AR cr lib/libc.a
  STRIP -x -R .note -R .comment lib/uclibc_nonshared.a
  AR cr lib/uclibc_nonshared.a
  AR cr libc/libc_so.a
  LD libuClibc-0.9.29.so
libc/libc_so.a(difftime.os): In function `difftime':
difftime.c:(.text+0x8): undefined reference to
`__floatsidf'
difftime.c:(.text+0x2c): undefined reference to
`__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function
`_fpmaxtostr':
_fpmaxtostr.c:(.text+0xd0): undefined reference to
`__nedf2'
_fpmaxtostr.c:(.text+0xf4): undefined reference to
`__eqdf2'
_fpmaxtostr.c:(.text+0x110): undefined reference to
`__divdf3'
_fpmaxtostr.c:(.text+0x11c): undefined reference to
`__ltdf2'
_fpmaxtostr.c:(.text+0x1d0): undefined reference to
`__muldf3'
_fpmaxtostr.c:(.text+0x384): undefined reference to
`__gedf2'
_fpmaxtostr.c:(.text+0x40c): undefined reference to
`__floatunsidf'
libc/libc_so.a(__psfs_do_numeric.os): In function
`__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x540): undefined reference
to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to
`__extendsfdf2'
libc/libc_so.a(__strtofpmax.os): In function
`__strtofpmax':
__strtofpmax.c:(.text+0x154): undefined reference to
`__adddf3'
/arm/buildroot/buildroot-20071004a/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/libgcc.a(_fixunsdfsi.o):
In function `__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to
`__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2


I have never gotten soft-float to work with BuildRoot.
Is this is a bug or my error ? If there is anything
else to post to determine the problem, let me know.

Build platform is i386 Ubuntu 7.04

Much appreciated

Gertjan














       
____________________________________________________________________________________
Looking for a deal? Find great prices on flights and hotels with Yahoo! FareChase.
http://farechase.yahoo.com/
