From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:53 -0300
Subject: [Buildroot] [PATCH 28/36] fs/*/Config.in: re-wrap help text
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-29-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention <tab><2 spaces><62 chars>.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 fs/cpio/Config.in      |  6 +++---
 fs/ext2/Config.in      | 22 ++++++++++++----------
 fs/initramfs/Config.in |  3 ++-
 fs/jffs2/Config.in     | 16 +++++++++-------
 fs/ubi/Config.in       | 11 ++++++-----
 5 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 679959d222..83a7fa5824 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -1,9 +1,9 @@
 config BR2_TARGET_ROOTFS_CPIO
 	bool "cpio the root filesystem (for use as an initial RAM filesystem)"
 	help
-	  Build a cpio archive of the root filesystem.  This is typically
-	  used for an initial RAM filesystem that is passed to the kernel
-	  by the bootloader.
+	  Build a cpio archive of the root filesystem. This is typically
+	  used for an initial RAM filesystem that is passed to the
+	  kernel by the bootloader.
 
 if BR2_TARGET_ROOTFS_CPIO
 
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 27ad69fde9..74bacc1141 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -49,11 +49,11 @@ config BR2_TARGET_ROOTFS_EXT2_SIZE
 	default BR2_TARGET_ROOTFS_EXT2_BLOCKS if BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP # legacy 2017.08
 	default "60M"
 	help
-	  The size of the filesystem image. If it does not have a suffix,
-	  it is interpreted as power-of-two kilobytes. If it is suffixed
-	  by 'k', 'm', 'g', 't' (either upper-case or lower-case), then
-	  it is interpreted in power-of-two kilobytes, megabytes,
-	  gigabytes, terabytes, etc.
+	  The size of the filesystem image. If it does not have a
+	  suffix, it is interpreted as power-of-two kilobytes. If it is
+	  suffixed by 'k', 'm', 'g', 't' (either upper-case or
+	  lower-case), then it is interpreted in power-of-two kilobytes,
+	  megabytes, gigabytes, terabytes, etc.
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
@@ -65,15 +65,16 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	help
 	  The number of blocks on the filesystem (as a percentage of the
 	  total number of blocks), that are reserved for use by root.
-	  Traditionally, this has been 5%, and all ext-related tools still
-	  default to reserving 5% when creating a new ext filesystem.
+	  Traditionally, this has been 5%, and all ext-related tools
+	  still default to reserving 5% when creating a new ext
+	  filesystem.
 
 config BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS
 	string "additional mke2fs options"
 	default "-O ^64bit"
 	help
-	  Specify a space-separated list of mke2fs options, including any
-	  ext2/3/4 filesystem features.
+	  Specify a space-separated list of mke2fs options, including
+	  any ext2/3/4 filesystem features.
 
 	  For more information about the mke2fs options, see the manual
 	  page mke2fs(8).
@@ -91,7 +92,8 @@ choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
 	help
-	  Select compressor for ext2/3/4 filesystem of the root filesystem
+	  Select compressor for ext2/3/4 filesystem of the root
+	  filesystem
 
 config BR2_TARGET_ROOTFS_EXT2_NONE
 	bool "no compression"
diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index 8ed9f7ebb5..9d5a3f92e6 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -10,7 +10,8 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 	  A rootfs.cpio file will be generated in the images/ directory.
 	  This is the archive that will be included in the kernel image.
 	  The default rootfs compression set in the kernel configuration
-	  is used, regardless of how buildroot's cpio archive is configured.
+	  is used, regardless of how buildroot's cpio archive is
+	  configured.
 
 	  Note that enabling initramfs together with another filesystem
 	  formats doesn't make sense: you would end up having two
diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index 208cabaa52..44c0b10446 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -94,18 +94,20 @@ config BR2_TARGET_ROOTFS_JFFS2_SUMMARY
 config BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
 	bool "Select custom virtual memory page size"
 	help
-	  Use a custom virtual memory page size.  Note that this is not related to
-	  the flash memory page size.  Using this option is only needed if Linux is
-	  configured to use a page size different than 4kB.
+	  Use a custom virtual memory page size. Note that this is not
+	  related to the flash memory page size. Using this option is
+	  only needed if Linux is configured to use a page size
+	  different than 4kB.
 
 config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE
 	hex "Virtual memory page size"
 	default 0x1000
 	depends on BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
 	help
-	  Set to virtual memory page size of target system (in bytes).  This value
-	  should match the virtual page size in Linux (i.e. this should have the
-	  same value as the value of the PAGE_SIZE macro in Linux).  It is not
-	  related to the flash memory page size.
+	  Set to virtual memory page size of target system (in bytes).
+	  This value should match the virtual page size in Linux (i.e.
+	  this should have the same value as the value of the PAGE_SIZE
+	  macro in Linux). It is not related to the flash memory page
+	  size.
 
 endif
diff --git a/fs/ubi/Config.in b/fs/ubi/Config.in
index 5fa2f1f61d..85b1c56bb0 100644
--- a/fs/ubi/Config.in
+++ b/fs/ubi/Config.in
@@ -18,8 +18,9 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	int "sub-page size"
 	default 512
 	help
-	  Tells ubinize that the flash supports sub-pages and the sub-page
-	  size. Use 0 if sub-pages are not supported on flash chip.
+	  Tells ubinize that the flash supports sub-pages and the
+	  sub-page size. Use 0 if sub-pages are not supported on flash
+	  chip.
 	  The value provided here is passed to the -s/--sub-page-size
 	  option of ubinize.
 
@@ -28,9 +29,9 @@ config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
 	help
 	  Select this option to use a custom ubinize configuration file,
 	  rather than the default configuration used by Buildroot (which
-	  defines a single dynamic volume marked as auto-resize).  Passing
-	  a custom ubinize configuration file allows you to create several
-	  volumes, specify volume types, etc.
+	  defines a single dynamic volume marked as auto-resize).
+	  Passing a custom ubinize configuration file allows you to
+	  create several volumes, specify volume types, etc.
 
 	  As a convenience, buildroot replaces the string
 	  "BR2_ROOTFS_UBIFS_PATH" with the path to the built ubifs file.
-- 
2.14.1
