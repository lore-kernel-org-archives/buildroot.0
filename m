From: carl zhu <carl.zhu@gmail.com>
Date: Wed, 31 Jan 2007 10:42:10 +0800
Subject: [Buildroot] About the soft float point support
Message-ID: <168013e20701301842q3da3012dp3873fbe35e3ea65d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi All,
I have been building a new tool chain for IXP425, which have no FPU support.
but after I enable the soft FPU support, I always get the error message.
even I update buildroot to SVN snapshot.

Who can help me?

error message:
  CC libc/inet/rpc/rpc_thread.os
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
difftime.c:(.text+0x8): undefined reference to `__floatsidf'
difftime.c:(.text+0x2c): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xd8): undefined reference to `__nedf2'
_fpmaxtostr.c:(.text+0xfc): undefined reference to `__eqdf2'
_fpmaxtostr.c:(.text+0x118): undefined reference to `__divdf3'
_fpmaxtostr.c:(.text+0x124): undefined reference to `__ltdf2'
_fpmaxtostr.c:(.text+0x1d0): undefined reference to `__muldf3'
_fpmaxtostr.c:(.text+0x398): undefined reference to `__gedf2'
_fpmaxtostr.c:(.text+0x444): undefined reference to `__adddf3'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x520): undefined reference to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
/try/lib/gcc/armeb-linux-uclibc/4.1.1/libgcc.a(_fixunsdfsi.o): In function
`__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/carl/buildroot/toolchain_build_armeb_nofpu/uClibc'
make: ***
[/home/carl/buildroot/toolchain_build_armeb_nofpu/uClibc/lib/libc.a] Error 2

I also attach the buildroot config file
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070131/df3415e0/attachment.html 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
Url: http://busybox.net/lists/buildroot/attachments/20070131/df3415e0/attachment.pot 
