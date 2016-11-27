From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 21:12:23 +0100
Subject: [Buildroot] [git commit] Revert "fs: call the pseudo wrapper"
Message-ID: <20161127202537.74F887FBF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b2f9b137ce14bbca01f18c3a4357bd3219a6b9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 74a3e75bb8208a8f3bb8426549fce1ea09b3be8a.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 22f3de5..2dbef4d 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -97,7 +97,7 @@ endif
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo-wrapper -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
