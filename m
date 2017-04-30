From: J Evans <g4@novadsp.com>
Date: Sun, 30 Apr 2017 13:35:47 +0100
Subject: [Buildroot] [PATCH 1/1] ext2.mk: ensure -b option is always set for
	mke2img and genext2fs
Message-ID: <1493555747-27289-1-git-send-email-g4@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J Evans <g4@novadsp.com>
---
 fs/ext2/ext2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 30f1d17..9d3e8fd 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -6,9 +6,7 @@
 
 EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
-endif
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
 EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
-- 
2.7.4
