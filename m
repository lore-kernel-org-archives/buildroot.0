From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Apr 2016 23:48:34 +0200
Subject: [Buildroot] [PATCH v1] rpi-firmware: change overlay file suffix
	from dtb to dtbo
Message-ID: <1461620914-27745-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index cbacacd..96b10f4 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -23,7 +23,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
 define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
-	for ovldtb in  $(@D)/boot/overlays/*.dtb; do \
+	for ovldtb in  $(@D)/boot/overlays/*.dtbo; do \
 		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
 	done
 endef
-- 
2.8.1
