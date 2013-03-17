From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2013 23:37:08 +0100
Subject: [Buildroot] [PATCH 3/5] fs/ext2: add a symlink 'rootfs.ext#' ->
	'rootfs.ext2'
In-Reply-To: <cover.1363559530.git.yann.morin.1998@free.fr>
References: <cover.1363559530.git.yann.morin.1998@free.fr>
Message-ID: <82b51e4ec85a5faa64a6107de0ad141311e20301.1363559530.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
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
-- 
1.7.2.5
