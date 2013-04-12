From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 14:42:31 +0200
Subject: [Buildroot] [git commit] fs/ext2: add a symlink 'rootfs.ext#' ->
	'rootfs.ext2'
Message-ID: <20130412130254.93FEF9B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aaefab09c7573f81a83c164ce2daca35b6a420e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/ext2.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 018a5a3..ffb7257 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -26,4 +26,11 @@ define ROOTFS_EXT2_CMD
 	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
 endef
 
+define ROOTFS_EXT2_HOOK_SYMLINK
+	ln -sf rootfs.ext2 $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)
+endef
+ifneq ($(BR2_TARGET_ROOTFS_EXT2_GEN),2)
+ROOTFS_EXT2_POST_GEN_HOOKS += ROOTFS_EXT2_HOOK_SYMLINK
+endif
+
 $(eval $(call ROOTFS_TARGET,ext2))
