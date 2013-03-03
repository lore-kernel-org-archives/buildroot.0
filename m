From: Carlo Caione <carlo.caione@gmail.com>
Date: Sun,  3 Mar 2013 17:49:11 +0100
Subject: [Buildroot] [PATCH] u-boot: u-boot SPL is usually under ./spl/
Message-ID: <1362329351-7738-1-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ea77259..3dfcca3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -103,7 +103,7 @@ endef
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 	$(if $(BR2_TARGET_UBOOT_SPL),
-		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
+		cp -dpf $(@D)/spl/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
 endef
 
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
-- 
1.8.1.3
