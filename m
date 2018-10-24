From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 23 Oct 2018 22:41:33 -0400
Subject: [Buildroot] [PATCH 1/3] uboot: replace mkimage invocation with
 MKIMAGE
Message-ID: <1540348893-3286-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already use $(MKIMAGE) instead of $(HOST_DIR)/bin/mkimage in xvisor, linux,
and cpio; use it here too.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fa92eaf..cbdfee6 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -286,7 +286,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	)
 	$(UBOOT_GENERATE_ENV_IMAGE)
 	$(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
-		$(HOST_DIR)/bin/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
+		$(MKIMAGE) -C none -A $(MKIMAGE_ARCH) -T script \
 			-d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
 			$(BINARIES_DIR)/boot.scr)
 endef
-- 
2.7.4
