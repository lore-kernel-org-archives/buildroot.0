From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 19:58:30 +0200
Subject: [Buildroot] [git commit] Remove redundant dollar signs in Config.in
	files
Message-ID: <20131027072650.BFFBA9BBA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbc2494a41bbdcc12b7242d06852892d2824db4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some Config.in(.host) files have constructs like:

config FOO_VERSION
	string
	default "1.0" if FOO_1_0
	default "2.0" if FOO_2_0
	default $FOO_CUSTOM_VERSION if FOO_CUSTOM

The dollar sign here is not needed and confusing, so can be removed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in                 |    4 ++--
 boot/uboot/Config.in                   |    4 ++--
 fs/jffs2/Config.in                     |    4 ++--
 linux/Config.in                        |    2 +-
 package/gcc/Config.in.host             |    2 +-
 package/linux-headers/Config.in.host   |    2 +-
 package/uclibc/Config.in               |    2 +-
 toolchain/toolchain-external/Config.in |    2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index eb2b0b2..a409aca 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -41,9 +41,9 @@ endif
 config BR2_TARGET_BAREBOX_VERSION
 	string
 	default "2013.10.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
-	default $BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
+	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
-	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
+	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
 config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
 	string "custom patch dir"
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7a20d06..88c076d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -47,9 +47,9 @@ endif
 config BR2_TARGET_UBOOT_VERSION
 	string
 	default "2013.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
-	default $BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
+	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
+	default BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index f15e730..e2a3ee9 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -58,7 +58,7 @@ config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
 	default 0x800 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
-	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
+	default BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
 
 config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	hex
@@ -68,7 +68,7 @@ config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x10000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
-	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
+	default BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
 
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool "Do not use Cleanmarker"
diff --git a/linux/Config.in b/linux/Config.in
index f7c5330..52291d8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -79,7 +79,7 @@ config BR2_LINUX_KERNEL_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
+	default BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
 
 #
 # Patch selection
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bd2ad8c..41c1213 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -91,7 +91,7 @@ config BR2_GCC_VERSION
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
 	default "4.8-arc"   if BR2_GCC_VERSION_4_8_ARC
-	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
+	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a32f665..88aa7e5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -89,4 +89,4 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.17"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.6"	if BR2_KERNEL_HEADERS_3_11
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
-	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
+	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2de0270..0e7ae54 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -37,7 +37,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
 	default 0.9.33-arc	if BR2_UCLIBC_VERSION_0_9_33_ARC
-	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
+	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0d42041..48b5865 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -849,7 +849,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
-	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
+	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
