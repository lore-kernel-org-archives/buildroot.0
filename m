From: Stefan Agner <stefan@agner.ch>
Date: Wed, 23 Dec 2020 11:11:36 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: add new option for
 Samsung MFC firmware
Message-ID: <31eb4b6dd64977c2476a727128ed0a093634c831.1608718175.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Multi format codec (MFC) is the IP present in Samsung Exynos
series SoCs for video encoding/decoding operations.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 105daf42b8..dbdfdb52b3 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -44,6 +44,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO
 	help
 	  Firmware files for Qualcomm Adreno GPU firmware
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MFC_V8
+	bool "Samsung MFC video encoder/decoder v8 firmware"
+	help
+	  Firmware files for Samsung MFC video encoder/decoder driver v8
+
 endmenu # Video
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8808b5284c..f1c84a134d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -39,6 +39,12 @@ LINUX_FIRMWARE_FILES += qcom/a*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MFC_V8),y)
+LINUX_FIRMWARE_FILES += s5p-mfc-v8.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*
-- 
2.29.2
