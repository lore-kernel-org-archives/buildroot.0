From: Colleen <colleen@skycatch.com>
Date: Fri, 15 May 2015 16:50:23 +0000
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add iwlwifi 6000g2a
	firmware
Message-ID: <1431708623-6661-1-git-send-email-colleen@skycatch.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Colleen <colleen@skycatch.com>
---
 package/linux-firmware/Config.in         |    6 ++++++
 package/linux-firmware/linux-firmware.mk |    5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 7265990..2e4c205 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -81,6 +81,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	  Firmware files for the Intel Wifi 5000 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A
+	bool "Intel iwlwifi 6000G2A"
+	help
+	  Firmware files for the Intel Wifi 6000G2A devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
 	bool "Intel iwlwifi 7260"
 	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9acfc53..4a7e4ef 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -197,6 +197,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A),y)
+LINUX_FIRMWARE_FILES += iwlwifi-6000g2a-5.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
 LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
-- 
1.7.9.5
