From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:30:21 +0100
Subject: [Buildroot] [git commit] rootfs-common: remove the now unused
	ROOTFS_<PKG>_POST_GEN_HOOKS
Message-ID: <20131110233747.531849BB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=053d678a6c8667b2dd8f4e1940a34cba31f338d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
