From: l m <lmmmcc@gmail.com>
Date: Thu, 20 Nov 2008 17:04:01 +0800
Subject: [Buildroot] =?gb2312?b?YmludXRpbHMgaW4gdGFyZ2V0IHN5c3RlbTogoa5M?=
	=?gb2312?b?T05HX01JTqGvIHVuZGVjbGFyZWQ=?=
Message-ID: <6c8937b20811200104w374564efu9b8eb7e5d19783c2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I found in recent buildroot system, the compiling was not successful, but
the previous version Revision: 23573 is fine. The error is

build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc -Os
-Ibuild_i686/staging_dir/usr/include -Ibuild_i686/staging_dir/include
-Wl,--rpath-link -Wl,build_i686/staging_dir/lib -Wl,--rpath-link
-Wl,build_i686/staging_dir/usr/lib --sysroot=build_i686/staging_dir/
-isysroot build_i686/staging_dir -mtune=i686 -march=i686 -c -DHAVE_CONFIG_H
-Os  -Ibuild_i686/staging_dir/usr/include -Ibuild_i686/staging_dir/include
-Wl,--rpath-link -Wl,build_i686/staging_dir/lib -Wl,--rpath-link
-Wl,build_i686/staging_dir/usr/lib --sysroot=build_i686/staging_dir/
-isysroot build_i686/staging_dir -mtune=i686 -march=i686 -I.
-Itoolchain_build_i686/binutils-2.18/libiberty/../include  -W -Wall
-Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c -o fibheap.o
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c: In function
'fibheap_union':
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:151: warning:
implicit declaration of function 'free'
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c: In function
'fibheap_delete_node':
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:258: error:
'LONG_MIN' undeclared (first use in this function)
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:258: error: (Each
undeclared identifier is reported only once
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:258: error: for each
function it appears in.)
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c: In function
'fibheap_consolidate':
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:360: warning:
implicit declaration of function 'memset'
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:360: warning:
incompatible implicit declaration of built-in function 'memset'
make[3]: *** [fibheap.o] Error 1
make[3]: Leaving directory `build_i686/binutils-2.18-target/libiberty'
make[2]: *** [all-libiberty] Error 2
make[2]: Leaving directory `build_i686/binutils-2.18-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory `build_i686/binutils-2.18-target'
make: *** [build_i686/binutils-2.18-target/binutils/objdump] Error 2
Some flags appear twice. There is one "checking for limits.h... no" in
binutils, it seems limits.h from gcc isn't included here, other a few times
checking is "yes".

  I'm using a X86 board, Could you help me to figure this out? Thank you

LM
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081120/6d596e9b/attachment.htm 
