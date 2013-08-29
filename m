From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 29 Aug 2013 14:59:19 +0200
Subject: [Buildroot] [PATCH 4 of 9 v3] Remove redundant dollar signs in
	Config.in files
In-Reply-To: <patchbomb.1377781155@argentina>
References: <patchbomb.1377781155@argentina>
Message-ID: <193fe71bdc3273181295.1377781159@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some Config.in files have constructs like:

config FOO_VERSION
	string
	default "1.0" if FOO_1_0
	default "2.0" if FOO_2_0
	default $FOO_CUSTOM_VERSION if FOO_CUSTOM

The dollar sign here is not needed and confusing, so can be removed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
(v3): new patch in this series

 boot/barebox/Config.in                 |  4 ++--
 boot/uboot/Config.in                   |  4 ++--
 fs/jffs2/Config.in                     |  4 ++--
 linux/Config.in                        |  2 +-
 package/uclibc/Config.in               |  2 +-
 toolchain/toolchain-external/Config.in |  2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -41,9 +41,9 @@ endif
 config BR2_TARGET_BAREBOX_VERSION
 	string
 	default "2013.07.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
-	default $BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
+	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
-	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
+	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
 config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
 	string "custom patch dir"
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -47,9 +47,9 @@ endif
 config BR2_TARGET_UBOOT_VERSION
 	string
 	default "2013.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
-	default $BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
+	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
+	default BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
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
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
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
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -832,7 +832,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
-	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
+	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
