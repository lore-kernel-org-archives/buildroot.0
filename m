From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:11 +0200
Subject: [Buildroot] [PATCH 13/15 v2] package/linux-firmware: add option for
	ITEtech it9135 firmware
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <af379047613f9a189455750bfd9c944ba169664c.1411246412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 433de9e..6a43290 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -190,6 +190,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_DIB0700
 	help
 	  Firmware file for dib0700-based USB DVB tuner driver
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ITETECH_IT9135
+	bool "ITEtech it9135"
+	help
+	  Firmware files for ITEtech it9135 (Ax and Bx) DVB-T USB tuner
+
 config BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK
 	bool "Terratec H5 DRX-K"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5014449..0d96502 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -211,6 +211,11 @@ LINUX_FIRMWARE_FILES += dvb-usb-dib0700-1.20.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.dib0700
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ITETECH_IT9135),y)
+LINUX_FIRMWARE_FILES += dvb-usb-it9135-01.fw dvb-usb-it9135-02.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.it913x
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK),y)
 LINUX_FIRMWARE_FILES += dvb-usb-terratec-h5-drxk.fw
 # No license file; the license is in the file WHENCE
-- 
1.9.1
