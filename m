From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:37 -0500
Subject: [Buildroot] [PATCH 24/44] linux-firmware: add intel e100 option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-25-aduskett@codeblue.com>
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
index 622441b..7e3cd25 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -385,6 +385,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T6
 	help
 	  Firmware files for Chelsio T6 1Gb and 10Gb ethernet cards (cxgb6)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
+	bool "Intel PRO/100 Ethernet NIC"
+	help
+	  Firmware files for the Intel PRO/100 Ethernet NIC ethernet card
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d47d05d..ff0d653 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -490,6 +490,11 @@ LINUX_FIRMWARE_FILES += cxgb4/t6fw-1.16.26.0.bin cxgb4/t6fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100),y)
+LINUX_FIRMWARE_DIRS += e100/
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8105e-1.fw \
-- 
2.9.3
