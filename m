From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:12:11 +0200
Subject: [Buildroot] [PATCH v2 2/2] rrdtool: bump version to 1.6.0
In-Reply-To: <1462976617-24524-2-git-send-email-fli4l@franke-prem.de>
References: <1462976617-24524-1-git-send-email-fli4l@franke-prem.de>
 <1462976617-24524-2-git-send-email-fli4l@franke-prem.de>
Message-ID: <20160511231211.1a1bd0c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 May 2016 16:23:37 +0200, Roland Franke wrote:

> -RRDTOOL_AUTORECONF = YES
> -RRDTOOL_GETTEXTIZE = YES

If anything, this should be done as part of the patch bumping to
version 1.6.0. I.e, your two patches should be merged into just one.

Also, this breaks the build for me, as I just reported on the v1 of
your patch:

/home/test/outputs/rrdtool/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: rrd_tool.o: undefined reference to symbol 'libintl_gettext'
/home/test/outputs/rrdtool/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.so.8: error adding symbols: DSO missing from command line

With the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.02-3-g762b7c9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RRDTOOL=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
