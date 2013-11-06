From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Nov 2013 00:12:30 +0100
Subject: [Buildroot] [PATCH 2/7] rootfs-common: remove the now unused
	ROOTFS_<PKG>_POST_GEN_HOOKS
In-Reply-To: <1383779555-9222-1-git-send-email-arnout@mind.be>
References: <1383779555-9222-1-git-send-email-arnout@mind.be>
Message-ID: <1383779555-9222-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2:
- Initial revision. This patch was introduced to enable the U-Boot image
  of the cpio rootfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 01d2c00..f22fb61 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -16,9 +16,6 @@
 #  ROOTFS_$(FSTYPE)_PRE_GEN_HOOKS, a list of hooks to call before
 #  generating the filesystem image
 #
-#  ROOTFS_$(FSTYPE)_POST_GEN_HOOKS, a list of hooks to call after
-#  generating and compressing the filesystem image
-#
 #  ROOTFS_$(FSTYPE)_POST_TARGETS, the list of targets that should be
 #  run after running the main filesystem target. This is useful for
 #  initramfs, to rebuild the kernel once the initramfs is generated.
@@ -63,7 +60,6 @@ endif
 	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	cp support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
-	$$(foreach hook,$$(ROOTFS_$(2)_POST_GEN_HOOKS),$$(call $$(hook))$$(sep))
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 	gzip -9 -c $$@ > $$@.gz
 endif
-- 
1.8.4.rc3
