From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Jun 2017 17:52:32 -0300
Subject: [Buildroot] [PATCH 2/2] linux-firmware: Add support for i.MX SDMA
In-Reply-To: <1497646352-3328-1-git-send-email-festevam@gmail.com>
References: <1497646352-3328-1-git-send-email-festevam@gmail.com>
Message-ID: <1497646352-3328-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the i.MX SDMA firmwares to be installed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.7.4
