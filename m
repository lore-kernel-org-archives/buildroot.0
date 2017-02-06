From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:30 -0500
Subject: [Buildroot] [PATCH 17/44] linux-firmware: add iwlwifi-5150 option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-18-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 6ec08b8..9722775 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -180,6 +180,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	  Firmware files for the Intel Wifi 5000 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5150
+	bool "Intel iwlwifi 5150"
+	help
+	  Firmware files for the Intel Wifi 5150 devices supported by
+	  the iwlwifi kernel driver.
+	  
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A
 	bool "Intel iwlwifi 6000G2A"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d8a4e60..b883a0c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -393,6 +393,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5150),y)
+LINUX_FIRMWARE_FILES += iwlwifi-5150-2.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A),y)
 LINUX_FIRMWARE_FILES += iwlwifi-6000g2a-6.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
-- 
2.9.3
