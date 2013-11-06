From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Nov 2013 00:12:33 +0100
Subject: [Buildroot] [PATCH 5/7] rootfs-ext2: symlink with the compressed
	rootfs
In-Reply-To: <1383779555-9222-1-git-send-email-arnout@mind.be>
References: <1383779555-9222-1-git-send-email-arnout@mind.be>
Message-ID: <1383779555-9222-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, a symlink was created to the uncompressed filesystem,
which made it a bit useless in case compression was chosen.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2:
- Initial revision. This patch was introduced to enable the U-Boot image
  of the cpio rootfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/ext2/ext2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index b4280aa..0af955f 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -28,7 +28,7 @@ define ROOTFS_EXT2_CMD
 endef
 
 rootfs-ext2-symlink:
-	ln -sf rootfs.ext2 $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)
+	ln -sf rootfs.ext2$(ROOTFS_EXT2_COMPRESS_EXT) $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)$(ROOTFS_EXT2_COMPRESS_EXT)
 
 ifneq ($(BR2_TARGET_ROOTFS_EXT2_GEN),2)
 ROOTFS_EXT2_POST_TARGETS += rootfs-ext2-symlink
-- 
1.8.4.rc3
