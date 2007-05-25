From: Stuart Wood <stuart.wood@labxtechnologies.com>
Date: Fri, 25 May 2007 16:10:02 -0400
Subject: [Buildroot] Build Failure for ARM
Message-ID: <200705251610.02645.stuart.wood@labxtechnologies.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build failure for ARM, 920T, OABI
uclibc 0.9.29  

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
_fpmaxtostr.c:(.text+0xd0): undefined reference to `__nedf2'
_fpmaxtostr.c:(.text+0xf4): undefined reference to `__eqdf2'
_fpmaxtostr.c:(.text+0x110): undefined reference to `__divdf3'
_fpmaxtostr.c:(.text+0x11c): undefined reference to `__ltdf2'
_fpmaxtostr.c:(.text+0x1c0): undefined reference to `__muldf3'
_fpmaxtostr.c:(.text+0x380): undefined reference to `__gedf2'
_fpmaxtostr.c:(.text+0x434): undefined reference to `__adddf3'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x51c): undefined reference to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
/opt/buildroot/bin/../lib/gcc/arm-linux-uclibc/4.1.2/libgcc.a(_fixunsdfsi.o): 
In function `__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory 
`/home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/uClibc-0.9.29'
make: *** 
[/home/stuart/ArmLinux/buildroot/toolchain_build_arm_nofpu/uClibc-0.9.29/lib/libc.a] 
Error 2
