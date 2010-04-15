From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 15 Apr 2010 13:51:33 +0200
Subject: [Buildroot] [git commit master] initramfs: trivial fix following
	move to fs
Message-ID: <20100415115253.9C4B220CC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7e276bc3d2186e27b6af59d71b58ab4dda05888
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
