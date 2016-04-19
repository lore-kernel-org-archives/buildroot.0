From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Apr 2016 11:44:08 -0300
Subject: [Buildroot] [PATCH v2 7/7] linux-firmware: add support for intel
	iwlwifi 6000g2b
In-Reply-To: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1461077048-16189-8-git-send-email-gustavo@zacarias.com.ar>
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
index f7bd526..ded0bcd 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -92,6 +92,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A
 	  Firmware files for the Intel Wifi 6000G2A devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B
+	bool "Intel iwlwifi 6000G2B"
+	help
+	  Firmware files for the Intel Wifi 6000G2B devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
 	bool "Intel iwlwifi 7260"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 94cdcfa..1401848 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -252,6 +252,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-6000g2a-6.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B),y)
+LINUX_FIRMWARE_FILES += iwlwifi-6000g2b-6.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
 LINUX_FIRMWARE_FILES += iwlwifi-7260-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
-- 
2.7.3
