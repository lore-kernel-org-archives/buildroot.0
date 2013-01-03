From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Jan 2013 22:18:59 +0100
Subject: [Buildroot] [PATCH 3/3] linux-firmware: add options for DVB
	firmware files
In-Reply-To: <cover.1357247755.git.yann.morin.1998@free.fr>
References: <cover.1357247755.git.yann.morin.1998@free.fr>
Message-ID: <354191cac96fccccc2c015ec563d031b801ebaeb.1357247755.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are three firmware files that can be installed, each for
different devices.

For example, the DIB0700 firmware can be used by quite a few DVB
USB sticks based on this chipset (I know of at least two of them).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         |   19 +++++++++++++++++++
 package/linux-firmware/linux-firmware.mk |    9 +++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4cfd4db..bf264eb 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -77,4 +77,23 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
 
 endmenu
 
+menu "DVB firmwares"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_DIB0700
+	bool "DiBcom dib0700"
+	help
+	  Firmware file for dib0700-based USB DVB tuner driver
+
+config BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK
+	bool "Terratec H5 DRX-K"
+	help
+	  Firmware file for Terratec H5 DRX-K based DVB tuner driver
+
+config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
+	bool "Xceive xc5000"
+	help
+	  Firmware file for xc5000-based DVB tuner driver
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e9a5424..db20d33 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -92,6 +92,15 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
 	ti-connectivity/TIInit_7.2.31.bts 			\
 	LICENCE.ti-connectivity
 
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_XC5000) += \
+	dvb-fe-xc5000-1.6.114.fw
+
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_DIB0700) += \
+	dvb-usb-dib0700-1.20.fw
+
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK) += \
+	dvb-usb-terratec-h5-drxk.fw
+
 
 ifneq ($(LINUX_FIRMWARE_FILES_y),)
 
-- 
1.7.2.5
