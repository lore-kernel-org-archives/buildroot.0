From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Nov 2016 23:18:34 +0100
Subject: [Buildroot] [PATCH 4/5] fs: call the pseudo wrapper
In-Reply-To: <cover.1478643505.git.yann.morin.1998@free.fr>
References: <cover.1478643505.git.yann.morin.1998@free.fr>
Message-ID: <3cb16b41f768b4e7e92ad1a482ab91066e661376.1478643505.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 2dbef4d..22f3de5 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -97,7 +97,7 @@ endif
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo-wrapper -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
-- 
2.7.4
