From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 23:13:39 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: install new
	Broadcom 43xxx firmware
Message-ID: <20140601211500.0CE799CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=784ec4e526940f8f81d7831181374060c7224692
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This installs firmware files for the FullMAC series of Broadcom
WiFi devices.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in         |    5 +++--
 package/linux-firmware/linux-firmware.mk |    7 ++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ba9a6c1..ba41598 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -26,9 +26,10 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	  Firmware files for the Atheros 9271 module
 
 config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
-	bool "Broadcom BRCM bcm43xx"
+	bool "Broadcom BRCM bcm43xx/43xxx"
 	help
-	  Firmware files for the Broadcom BRCM bcm43xx
+	  Firmware files for the Broadcom bcm43xx and bcm43xxx,
+	  SoftMAC and FullMAC.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160
 	bool "Intel iwlwifi 3160"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9f36591..aa87c73 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -185,7 +185,12 @@ endif
 
 # brcm
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX),y)
-LINUX_FIRMWARE_FILES += brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw
+LINUX_FIRMWARE_FILES += brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw \
+			brcm/bcm4329-fullmac-4.bin brcm/brcmfmac43236b.bin \
+			brcm/brcmfmac43241b0-sdio.bin brcm/brcmfmac43241b4-sdio.bin \
+			brcm/brcmfmac4329-sdio.bin brcm/brcmfmac4330-sdio.bin \
+			brcm/brcmfmac4334-sdio.bin brcm/brcmfmac4335-sdio.bin \
+			brcm/brcmfmac43362-sdio.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
