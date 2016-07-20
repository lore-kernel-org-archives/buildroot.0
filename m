From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 23:35:44 +0200
Subject: [Buildroot] [git commit] efl: add missing select of zlib
Message-ID: <20160720213717.9696E81DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef5d9f433b3b246ed52471fefef556a62688adc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The efl package has zlib in its dependencies, but does not select it,
which causes a dependency check error with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.05-1162-g94c7298.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_EFL=y

This commit fixes this by selecting the zlib package at the Config.in
level.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 50d5f7f..97157f8 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_UTIL_LINUX
 	# libblkid is part of required tools, see EFL's README.
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_ZLIB
 	help
 	  Enlightenment Foundation Libraries
 
