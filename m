From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:37:39 +0100
Subject: [Buildroot] [git commit] fs: pass EXTRA_ENV to post-fakeroot script
Message-ID: <20180115203922.AE99C834ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b3d1b36a3ead6939fc48b9083754be763ada1c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like we do for post-build and post-image scripts, pass EXTRA_ENV to
post-fakeroot script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 9715eb1..6d579db 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -95,7 +95,7 @@ endif
 	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
-		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
+		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 ifeq ($$(BR2_REPRODUCIBLE),y)
