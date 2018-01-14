From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 15:16:57 +0100
Subject: [Buildroot] [PATCH 01/17] fs: pass EXTRA_ENV to post-fakeroot script
In-Reply-To: <cover.1515939400.git.yann.morin.1998@free.fr>
References: <cover.1515939400.git.yann.morin.1998@free.fr>
Message-ID: <014946f321e52b20e14518002e89ec9662bfad53.1515939400.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like we do for post-build and post-image scripts, pass EXTRA_ENV to
post-fakeroot script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 9715eb13d9..6d579db810 100644
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
-- 
2.14.1
