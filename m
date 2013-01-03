From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 00:46:16 +0100
Subject: [Buildroot] [git commit] linux-firmware: add options for DVB
	firmware files
Message-ID: <20130103234638.098A69A5F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4e444bb0bc690f1c9f5c846ebd58298b8f7b855
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are three firmware files that can be installed, each for
different devices.

For example, the DIB0700 firmware can be used by quite a few DVB
USB sticks based on this chipset (I know of at least two of them).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
