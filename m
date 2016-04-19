From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Apr 2016 11:44:06 -0300
Subject: [Buildroot] [PATCH v2 5/7] linux-firmware: add support for intel
	iwlwifi 8265
In-Reply-To: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1461077048-16189-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9eb46ae..0f91ab0 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -111,6 +111,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C
 	  Firmware files for the Intel Wifi 8000C devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265
+	bool "Intel iwlwifi 8265"
+	help
+	  Firmware files for the Intel Wifi 8265 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b959694..87ae93b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -267,6 +267,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-8000C-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265),y)
+LINUX_FIRMWARE_FILES += iwlwifi-8265-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += \
 	bnx2x/bnx2x-e1-7.10.51.0.fw \
-- 
2.7.3
