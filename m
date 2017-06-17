From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jun 2017 16:15:23 +0200
Subject: [Buildroot] [git commit] linux-firmware: Add support for i.MX SDMA
Message-ID: <20170617141442.D3C307FE9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b87eec6555dd716d051285d7314d55143578dd63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow the i.MX SDMA firmwares to be installed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 9 +++++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index e9a4dfb..43ed841 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -306,4 +306,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_XCx000
 
 endmenu
 
+menu "SoC Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA
+	bool "Freescale i.MX SDMA"
+	help
+	  Firmware files for i.MX SDMA.
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 65b9a73..bce36ce 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -30,6 +30,12 @@ LINUX_FIRMWARE_FILES += intel/ibt-*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ibt_firmware
 endif
 
+# Freescale i.MX SDMA
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA),y)
+LINUX_FIRMWARE_FILES += imx/sdma/sdma-imx6q.bin imx/sdma/sdma-imx7d.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.sdma_firmware
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
