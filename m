From: J Evans <g4@novadsp.com>
Date: Sat, 29 Apr 2017 17:01:21 +0100
Subject: [Buildroot] [PATCH 1/2] ext2.mk: ensure file system block count is
	not zero (0)
Message-ID: <1493481682-128366-1-git-send-email-g4@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J Evans <g4@novadsp.com>
---
 fs/ext2/ext2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 30f1d17..3a0c764 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -6,7 +6,9 @@
 
 EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
+ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
+$(error BR2_TARGET_ROOTFS_EXT2_BLOCKS cannot be zero (0))
+else
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endif
 
-- 
2.7.4
