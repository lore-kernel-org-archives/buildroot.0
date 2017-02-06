From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:38 -0500
Subject: [Buildroot] [PATCH 25/44] linux-firmware: add kl5usb101 ethernet
	option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-26-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 7e3cd25..422e340 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -390,6 +390,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
 	help
 	  Firmware files for the Intel PRO/100 Ethernet NIC ethernet card
 
+config BR2_PACKAGE_LINUX_FIRMWARE_KLSI_KL5USB101
+	bool "USB KLSI KL5USB101-based Ethernet device"
+	help
+	  Firmware files for USB KLSI KL5USB101-based Ethernet devices
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ff0d653..f76fa97 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -495,6 +495,11 @@ LINUX_FIRMWARE_DIRS += e100/
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_KLSI_KL5USB101),y)
+LINUX_FIRMWARE_DIRS += kaweth/
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.kaweth
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8105e-1.fw \
-- 
2.9.3
