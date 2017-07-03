From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 00:51:00 +0200
Subject: [Buildroot] [PATCH v3 05/11] fs/ext2: simplify code
In-Reply-To: <20170703225106.1492-1-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
Message-ID: <20170703225106.1492-6-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

No option is conditional anymore, so just collate them into a single
assignment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2->v3:
- reintroduce this change from Yann' series
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
2.13.2
