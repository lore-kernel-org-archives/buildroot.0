From: Paolo Scaffardi <scaffardi@gfplab.com>
Date: Tue, 05 Jun 2007 08:42:17 +0200
Subject: [Buildroot] STILL soft float toolchain problems on ARM
Message-ID: <466505C9.6020007@gfplab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there!
I'm still trying to get a working buildroot for my ARM platform (EP9302
cirrus logic CPU, T920), with soft float enabled. My configuration uses
GCC 4.1.2, libfloat, soft float and uclibc 0.9.29 (i tried both
snapshots and 0.9.29 official release).

I'm using last buildroot snapshot, and i tried EVERY configuration with
soft floats but nothing worked because of an error compiling
uclibc-0.9.29. I went to uclibc folder and i tryied to finish build,
then i got these lines:

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
/mnt/giano/usr/local/arm/4.1.2-920t/bin/../lib/gcc/arm-linux-uclibc/4.1.2/libgcc.a(_fixunsdfsi.o):
In function `__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2

Can anyone help me fixing that?

Bye,
Paolo Scaffardi
GFP Lab s.r.l.
http://www.gfplab.com
tel 0541 1796200
fax 0541 1796120
fav via email 178 2258454
