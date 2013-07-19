From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 11:51:55 +0200
Subject: [Buildroot] [git commit] linux-firmware: add support for b43xx
	firmwares
Message-ID: <20130719103550.17A649A225@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39ed0d29990fda16bbc55e54183ea1331b72be0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/Config.in         |    5 +++++
 package/linux-firmware/linux-firmware.mk |    3 +++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index d9bb095..01fe90f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -20,6 +20,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	help
 	  Firmware files for the Atheros 9271 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
+	bool "Broadcom BRCM bcm43xx"
+	help
+	  Firmware files for the Broadcom BRCM bcm43xx
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	bool "Intel iwlwifi 5000"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4ff0e0a..a88bc4c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -112,6 +112,9 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_DIB0700) += \
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK) += \
 	dvb-usb-terratec-h5-drxk.fw
 
+# brcm
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX) += \
+	brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw
 
 ifneq ($(LINUX_FIRMWARE_FILES_y),)
 
