From: Lance Fredrickson <lancethepants@gmail.com>
Date: Thu, 29 Sep 2016 12:17:25 -0600
Subject: [Buildroot] uclibc-ng: bump to 1.0.18
Message-ID: <48e09c43-e43d-f67f-c6cb-b640c367ab5a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been anticipating uclibc-ng 1.0.18 since it follows musl's lead and 
put everything (librt, libdl, pthread etc) into libc.
On a previous release of buildroot I tried changing to 1.0.18 and it 
stops in the build.  I also just tried a fresh clone of Master and come 
upon the same error.

make[1]: Entering directory 
'/home/lance/buildroot/output/build/uclibc-1.0.18/utils'
   HOSTCC utils/locale.host
../extra/locale/programs/locale.c:35:32: fatal error: 
bits/uClibc_locale.h: No such file or directory
  #include <bits/uClibc_locale.h>
                                 ^
compilation terminated.
Makefile.in:113: recipe for target '../utils/locale.host' failed


It appears by this point that it's successfully built the the library 
itself, but is failing on 'hostutils'?
I've attached a simple config that Master will fail on. Maybe should be 
fixed upstream from you, but thought I'd mention it here.

Lance
-------------- next part --------------
BR2_arm=y
BR2_cortex_a9=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
# BR2_UCLIBC_INSTALL_UTILS is not set
BR2_BINUTILS_VERSION_2_25_X=y
BR2_GCC_VERSION_6_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
