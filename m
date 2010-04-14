From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 22:41:56 +0100
Subject: [Buildroot] [PATCH] initramfs: trivial fix following move to fs
Message-ID: <1271281316-2886-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 fs/initramfs/initramfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index cf1fcdb..4a205d1 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -12,7 +12,7 @@ define ROOTFS_INITRAMFS_INIT_SYMLINK
 endef
 
 define ROOTFS_INITRAMFS_CMD
-	$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
+	$(SHELL) fs/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
 endef
 
 $(eval $(call ROOTFS_TARGET,initramfs))
\ No newline at end of file
-- 
1.7.0
