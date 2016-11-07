From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Nov 2016 22:23:40 +0100
Subject: [Buildroot] [PATCH 6/6] fs: call pseudo as instructed by the pseudo
	package
In-Reply-To: <cover.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <f7a170d2df33fe2825b401df89702f02e053c81f.1478553802.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the newly introduced HOST_PSEUDO variable to call pseudo, ensuring
the proper environment variables are set.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 2dbef4d..452b0cc 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -97,7 +97,7 @@ endif
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(BR_PATH) $$(HOST_PSEUDO) -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
-- 
2.7.4
