From: Micha Nelissen <micha@neli.hopto.org>
Date: Tue, 04 Sep 2007 23:40:15 +0200
Subject: [Buildroot] Uclibc 0.9.29 compiler error
Message-ID: <fbkjea$tfd$1@sea.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot SVN, gcc 4.2.1, uclibc 0.9.29, armeb-linux for
xscale. I've configured to use software floating point. Linking of
uclibc fails, it cannot find some functions which seem software floating
point related e.g. __floatsidf. Objdump'ing the libgcc.a file, this
function is present, but section *UND* is listed instead of .text.

<quote>
  LD libuClibc-0.9.29.so
libc/libc_so.a(difftime.os): In function `difftime':
difftime.c:(.text+0x8): undefined reference to `__floatsidf'
difftime.c:(.text+0x2c): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xd0): undefined reference to `__nedf2'
_fpmaxtostr.c:(.text+0xf4): undefined reference to `__eqdf2'
_fpmaxtostr.c:(.text+0x110): undefined reference to `__divdf3'
_fpmaxtostr.c:(.text+0x11c): undefined reference to `__ltdf2'
_fpmaxtostr.c:(.text+0x1c8): undefined reference to `__muldf3'
_fpmaxtostr.c:(.text+0x38c): undefined reference to `__gedf2'
_fpmaxtostr.c:(.text+0x444): undefined reference to `__adddf3'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x520): undefined reference to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
/home/micha/netbox/buildroot/build_armeb/staging_dir/bin/../lib/gcc/armeb-linux-uclibc/4.1.2/libgcc.a(_fixunsdfsi.o):
In function `__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Fout 2
</quote>

<quote>
SYMBOL TABLE:
00000000 l    df *ABS*  00000000 libgcc2.c
00000000 l    d  .text  00000000 .text
00000000 l    d  .data  00000000 .data
00000000 l    d  .bss   00000000 .bss
00000000 l    d  .comment       00000000 .comment
00000000         *UND*  00000000 __extendsfdf2
00000000         *UND*  00000000 __muldf3
00000000         *UND*  00000000 __fixunsdfsi
00000000         *UND*  00000000 __floatsidf
00000000         *UND*  00000000 __adddf3
00000000 g     F .text  000000a8 __fixunssfdi
</quote>

Any idea how to solve this?

Thanks,

Micha
