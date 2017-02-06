From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:46 -0500
Subject: [Buildroot] [PATCH 33/44] linux-firmware: add siano mdtv dvb option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-34-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index a6e6b0c..2db4f15 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -454,11 +454,21 @@ config BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK
 	help
 	  Firmware file for Terratec H5 DRX-K based DVB tuner driver
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TELGENT
+	bool "Telgent 2300"
+	help
+	  Firmware file for Telgent 2300 based DVB tuner driver
+	  
 config BR2_PACKAGE_LINUX_FIRMWARE_XCx000
 	bool "Xceive/Cresta xc4000/xc5000/xc500c"
 	help
 	  Firmware file for xc4000/xc5000/xc5000c based DVB tuner driver
 
+config BR2_PACKAGE_LINUX_FIRMWARE_SIANO_MDTV
+	bool "Siano MDTV Core module"
+	help
+	  Firmware file for Siano MDTV Core module based DVB tuner driver
+	  
 endmenu
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index fad9a41..2418706 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -589,6 +589,24 @@ LINUX_FIRMWARE_FILES += dvb-usb-terratec-h5-drxk.fw
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_SIANO_MDTV),y)
+LINUX_FIRMWARE_FILES += \
+	cmmb_vega_12mhz.inp \
+	cmmb_venice_12mhz.inp \
+	dvb_nova_12mhz.inp \
+	dvb_nova_12mhz_b0.inp \
+	isdbt_nova_12mhz.inp \
+	isdbt_nova_12mhz_b0.inp \
+	isdbt_rio.inp \
+	sms1xxx-hcw-55xxx-dvbt-02.fw \
+	sms1xxx-hcw-55xxx-isdbt-02.fw \
+	sms1xxx-nova-a-dvbt-01.fw \
+	sms1xxx-nova-b-dvbt-01.fw \
+	sms1xxx-stellar-dvbt-01.fw \
+	tdmb_nova_12mhz.inp
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.siano
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TELGENT),y)
 LINUX_FIRMWARE_FILES += tlg2300_firmware.bin
 # No license file; the license is in the file WHENCE
-- 
2.9.3
