From: Alexander Khryukin <alexander@mezon.ru>
Date: Mon, 18 Mar 2013 01:53:38 +0400
Subject: [Buildroot] nspr and aarch64 build issue
Message-ID: <CABtOAfxeHbNeKc8eWfxaTLPgOeh10HmF2psbXnvZh9mLF0hKTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, guys!
I'm trying to build aarch64 libnspr package


cd freebl; /usr/bin/make libs
make[3]: Entering directory
`/home/user/buildroot/output/build/libnss-3.12.9/mozilla/security/nss/lib/freebl'
../../../coreconf/nsinstall/Linux2.6_aarch64_glibc_PTH_OPT.OBJ/nsinstall -R
-m 664 Linux2.6_aarch64_glibc_PTH_OPT.OBJ/libfreebl.a
/home/user/buildroot/output/build/libnss-3.12.9/mozilla/dist/lib
/usr/bin/make FREEBL_CHILD_BUILD=1 \
 OBJDIR=Linux2.6_aarch64_glibc_PTH_OPT.OBJ/Linux_SINGLE_SHLIB libs
 make[4]: Entering directory
`/home/user/buildroot/output/build/libnss-3.12.9/mozilla/security/nss/lib/freebl'
 /home/user/buildroot/output/host/usr/bin/aarch64-linux-gnu-gcc -o
Linux2.6_aarch64_glibc_PTH_OPT.OBJ/Linux_SINGLE_SHLIB/drbg.o -c
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-Os  -ansi -D_POSIX_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE -fPIC -DLINUX2_1
-Wall -Werror-implicit-function-declaration -Wno-switch -pipe -DLINUX
-Dlinux -DHAVE_STRERROR -DXP_UNIX -DSHLIB_SUFFIX=\"so\"
-DSHLIB_PREFIX=\"lib\" -DSHLIB_VERSION=\"3\" -DSOFTOKEN_SHLIB_VERSION=\"3\"
-DRIJNDAEL_INCLUDE_TABLES -UDEBUG -DNDEBUG -D_REENTRANT -DNSS_ENABLE_ECC
-DUSE_UTIL_DIRECTLY -DFREEBL_NO_DEPEND -DMP_API_COMPATIBLE
-I/home/user/buildroot/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/nspr
-I/home/user/buildroot/output/build/libnss-3.12.9/mozilla/dist/include
-I../../../../dist/public/nss -I../../../../dist/private/nss -Impi -Iecl
drbg.c
 drbg.c: In function 'RNG_RandomUpdate':
 *drbg.c:516:5: error: size of array 'arg' is negative*
 make[4]: ***
[Linux2.6_aarch64_glibc_PTH_OPT.OBJ/Linux_SINGLE_SHLIB/drbg.o] Error 1
 make[4]: Leaving directory
`/home/user/buildroot/output/build/libnss-3.12.9/mozilla/security/nss/lib/freebl'
 make[3]: *** [libs] Error 2
 make[3]: Leaving directory
`/home/user/buildroot/output/build/libnss-3.12.9/mozilla/security/nss/lib/freebl'
 make[2]: *** [libs] Error 2
 make[2]: Leaving directory
`/home/user/buildroot/output/build/libnss-3.12.9/mozilla/security/nss/lib'
 make[1]: *** [libs] Error 2
 make[1]: Leaving directory
`/home/user/buildroot/output/build/libnss-3.12.9/mozilla/security/nss'
 make: *** [/home/user/buildroot/output/build/libnss-3.12.9/.stamp_built]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130318/934be1a5/attachment-0001.html>
