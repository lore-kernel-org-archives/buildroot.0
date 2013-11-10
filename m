From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:34:14 +0100
Subject: [Buildroot] [git commit] rootfs-ext2: symlink with the compressed
	rootfs
Message-ID: <20131110233747.801409BB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4df9ecb30ae64aab0e65f0dbbb2b60749c536db3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, a symlink was created to the uncompressed filesystem,
which made it a bit useless in case compression was chosen.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ext2/ext2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
