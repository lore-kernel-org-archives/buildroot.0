From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:39 -0500
Subject: [Buildroot] [PATCH 26/44] linux-firmware: add myricom ethernet
	option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-27-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 422e340..f88009d 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -395,6 +395,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_KLSI_KL5USB101
 	help
 	  Firmware files for USB KLSI KL5USB101-based Ethernet devices
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MYRICOM
+	bool "MyriCOM Gigabit Ethernet"
+	help
+	  Firmware files for MyriCOM Gigabit Ethernet
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f76fa97..c5eceed 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -500,6 +500,12 @@ LINUX_FIRMWARE_DIRS += kaweth/
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.kaweth
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MYRICOM),y)
+LINUX_FIRMWARE_DIRS += myricom/
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8105e-1.fw \
-- 
2.9.3
