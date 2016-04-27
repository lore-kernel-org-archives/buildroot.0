From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Apr 2016 23:29:50 +0200
Subject: [Buildroot] [git commit] rpi-firmware: change overlay file suffix
	from dtb to dtbo
Message-ID: <20160427213726.A971A81E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=799726b1676cca7707bdb965ff6b14df663ecb5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit dc7b1c0 (rpi-firmware: bump version) bumped rpi-firmware to a version
based on kernel 4.4.x, but didn't update the overlay logic to handle the
.dtbo files from dynamic device tree support.

For details, see:
https://www.raspberrypi.org/forums/viewtopic.php?f=107&t=139732

[Peter: extend description]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
