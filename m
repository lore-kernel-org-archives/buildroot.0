From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 06 Nov 2019 20:37:02 +0100
Subject: [Buildroot] [PATCH next v8 0/6] Top-level parallel build support
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
Message-ID: <uvjb9gxeno.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 05 Nov 2019 17:46:39 +0100 schrieb Thomas Petazzoni:

> This is really only the core changes. It is sufficient for a number of
> configuration, but we know some specific packages are broken with
> per-package directories (for example: Qt5).

Hi,

are you, at this stage, interested in per-package bug reports?

If yes, this defconfig does not build:

BR2_x86_64=y
BR2_x86_core2=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/
tarballs/br-x86-64-core2-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_APR_UTIL=y

>>> apr-util 1.6.1 Building
PATH="/home/buildroot/br/output/per-package/apr-util/host/bin:/home/
buildroot/br/output/per-package/apr-util/host/sbin:/usr/lib/android-ndk:/
usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/make   
-C /home/buildroot/br/output/build/apr-util-1.6.1/
make[1]: Entering directory '/home/buildroot/br/output/build/apr-
util-1.6.1'
make[2]: Entering directory '/home/buildroot/br/output/build/apr-
util-1.6.1'
/bin/bash /home/buildroot/br/output/per-package/apr/host/x86_64-buildroot-
linux-uclibc/sysroot/usr/build-1/libtool --silent --mode=compile /home/
buildroot/br/output/per-package/apr/host/bin/x86_64-linux-gcc   -
D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -
DLINUX -D_GNU_SOURCE -D_REENTRANT -DHAVE_CONFIG_H    -D_LARGEFILE_SOURCE -
D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/buildroot/br/output/
build/apr-util-1.6.1/include -I/home/buildroot/br/output/build/apr-
util-1.6.1/include/private  -I/home/buildroot/br/output/per-package/apr-
util/host/x86_64-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/include/
apr-1    -o xml/apr_xml.lo -c xml/apr_xml.c && touch xml/apr_xml.lo
xml/apr_xml.c:35:10: fatal error: expat.h: No such file or directory
 #include <expat.h>
          ^~~~~~~~~
compilation terminated.

Regards, Bernd
