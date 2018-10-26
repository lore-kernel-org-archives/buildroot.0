From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:26:17 +0200
Subject: [Buildroot] [git commit] uboot: replace mkimage invocation with
 MKIMAGE
Message-ID: <20181026192512.197348911F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0210f160834fbc1291673cd950c6c189f0951b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already use $(MKIMAGE) instead of $(HOST_DIR)/bin/mkimage in xvisor, linux,
and cpio; use it here too.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fa92eafff5..cbdfee6ac3 100644
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
