From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:44 -0500
Subject: [Buildroot] [PATCH 31/44] linux-firmware: add hauppauge nova-usb
	dvb option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-32-aduskett@codeblue.com>
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
index b22f770..a6e6b0c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -439,6 +439,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_DIB0700
 	help
 	  Firmware file for dib0700-based USB DVB tuner driver
 
+config BR2_PACKAGE_LINUX_FIRMWARE_HAUPPAUGE
+	bool "Technotrend/Hauppauge Nova-USB devices"
+	help
+	  Firmware file for Technotrend/Hauppauge Nova-USB devices
+	  
 config BR2_PACKAGE_LINUX_FIRMWARE_ITETECH_IT9135
 	bool "ITEtech it9135"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 7e02bd5..33901d7 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -572,6 +572,12 @@ LINUX_FIRMWARE_FILES += dvb-usb-dib0700-1.20.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.dib0700
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_HAUPPAUGE),y)
+LINUX_FIRMWARE_FILES += ttusb-budget/dspbootcode.bin
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ITETECH_IT9135),y)
 LINUX_FIRMWARE_FILES += dvb-usb-it9135-01.fw dvb-usb-it9135-02.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.it913x
-- 
2.9.3
