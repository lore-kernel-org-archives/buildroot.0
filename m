From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 20 Apr 2010 15:31:01 +0100
Subject: [Buildroot] [PATCH] initramfs: fix init symlink
Message-ID: <1271773861-26198-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When initramfs was ported to the new fs structure the init symlink
macro was defined, but forgot to add it to PRE_GEN_HOOKS

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 fs/initramfs/initramfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 9aaf1b0..3e81567 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -17,6 +17,8 @@ define ROOTFS_INITRAMFS_INIT_SYMLINK
 	ln -s sbin/init $(TARGET_DIR)/init
 endef
 
+ROOTFS_INITRAMFS_PRE_GEN_HOOKS += ROOTFS_INITRAMFS_INIT_SYMLINK
+
 define ROOTFS_INITRAMFS_CMD
 	$(SHELL) fs/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
 endef
-- 
1.7.0
