From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 May 2017 17:58:42 +0200
Subject: [Buildroot] [PATCH 7/9] fs/ext2: simplify code
In-Reply-To: <cover.1493654310.git.yann.morin.1998@free.fr>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
Message-ID: <72b0bda12b63d9c60526c4e43bf7d395f3c881ea.1493654310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No option is conditional anymore, so just collate them into a single
assignment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext2/ext2.mk | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 57058b5fd2..16e14777c3 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -4,22 +4,19 @@
 #
 ################################################################################
 
-EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
-
-EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
-
-EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
-
-EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
-
-EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
-
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
 EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 #" Syntax highlighting... :-/ )
 
-EXT2_OPTS += -l "$(EXT2_LABEL)"
+EXT2_OPTS = \
+	-G $(BR2_TARGET_ROOTFS_EXT2_GEN) \
+	-R $(BR2_TARGET_ROOTFS_EXT2_REV) \
+	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS) \
+	-i $(BR2_TARGET_ROOTFS_EXT2_INODES) \
+	-I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES) \
+	-r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
+	-l "$(EXT2_LABEL)"
 
 ROOTFS_EXT2_DEPENDENCIES = host-mke2img
 
-- 
2.11.0
