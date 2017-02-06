From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:43 -0500
Subject: [Buildroot] [PATCH 30/44] linux-firmware: add av7110 dvb option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-31-aduskett@codeblue.com>
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
index 8ea536b..b22f770 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -429,6 +429,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AS102
 	help
 	  Firmware file for Abilis Systems single DVB-T receiver as102
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AV7110
+	bool "AV7110 cards"
+	help
+	  Firmware file for AV7110 cards
+
 config BR2_PACKAGE_LINUX_FIRMWARE_DIB0700
 	bool "DiBcom dib0700"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1e80f12..7e02bd5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -561,6 +561,12 @@ LINUX_FIRMWARE_FILES += as102_data1_st.hex as102_data2_st.hex
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Abilis
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AV7110),y)
+LINUX_FIRMWARE_DIRS += av7110
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_DIB0700),y)
 LINUX_FIRMWARE_FILES += dvb-usb-dib0700-1.20.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.dib0700
-- 
2.9.3
