From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 10:45:59 +0200
Subject: [Buildroot] [PATCH 7/9] fs: don't use := when not needed
In-Reply-To: <cover.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <63b793261a6b4cb97ee9fb0581e7280e5339c50f.1572079551.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/btrfs/btrfs.mk | 2 +-
 fs/ext2/ext2.mk   | 2 +-
 fs/f2fs/f2fs.mk   | 2 +-
 fs/jffs2/jffs2.mk | 4 ++--
 fs/tar/tar.mk     | 2 +-
 fs/ubi/ubi.mk     | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/btrfs/btrfs.mk b/fs/btrfs/btrfs.mk
index 388516389b..70e3ead97c 100644
--- a/fs/btrfs/btrfs.mk
+++ b/fs/btrfs/btrfs.mk
@@ -14,7 +14,7 @@ BTRFS_SIZE_SECTOR = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR))
 BTRFS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_FEATURES))
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
-BTRFS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_BTRFS_LABEL))
+BTRFS_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_BTRFS_LABEL))
 # ")
 
 BTRFS_OPTS = \
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 6bb4b1c7f8..74c99bd7b1 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -13,7 +13,7 @@ EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
 
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
-EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
+EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 #" Syntax highlighting... :-/ )
 
 EXT2_OPTS = \
diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
index f35bb60ad0..21a2879c17 100644
--- a/fs/f2fs/f2fs.mk
+++ b/fs/f2fs/f2fs.mk
@@ -11,7 +11,7 @@ endif
 
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
-F2FS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
+F2FS_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
 # ")
 F2FS_COLD_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_COLD_FILES))
 F2FS_HOT_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_HOT_FILES))
diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 740ab3e03d..2adbc2320e 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JFFS2_OPTS := -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
-SUMTOOL_OPTS := $(JFFS2_OPTS)
+JFFS2_OPTS = -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
+SUMTOOL_OPTS = -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_PAD),y)
 ifneq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE)),0x0)
diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 393d01bfe8..841af14706 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
+TAR_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
 
diff --git a/fs/ubi/ubi.mk b/fs/ubi/ubi.mk
index 9874e73ff6..d848f8b23a 100644
--- a/fs/ubi/ubi.mk
+++ b/fs/ubi/ubi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
+UBI_UBINIZE_OPTS = -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
 UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
 ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
 UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
-- 
2.20.1
