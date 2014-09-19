From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:14:59 +0200
Subject: [Buildroot] [PATCH 09/14] package/linux-firmware: install
	Xceive/Cresta xc4000 and xc5000c
In-Reply-To: <cover.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <9ece335b32302b9b2feb0f237ea1dad01c415213.1411161197.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tweak the prompt, because Xceive is now part of Cresta, so the
new xc5000c-based devices might be branded under either name.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         |  6 +++---
 package/linux-firmware/linux-firmware.mk | 10 +++++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 724fe49..96d4ee4 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -188,10 +188,10 @@ config BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK
 	help
 	  Firmware file for Terratec H5 DRX-K based DVB tuner driver
 
-config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
-	bool "Xceive xc5000"
+config BR2_PACKAGE_LINUX_FIRMWARE_XCx000
+	bool "Xceive/Cresta xc4000/xc5000/xc500c"
 	help
-	  Firmware file for xc5000-based DVB tuner driver
+	  Firmware file for xc4000/xc5000/xc5000c based DVB tuner driver
 
 endmenu
 
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 94fd5b5..0b60c29 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -191,9 +191,13 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.11.27.0.bin cxgb4/t5fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XC5000),y)
-LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc5000
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
+LINUX_FIRMWARE_FILES += dvb-fe-xc4000-1.4.1.fw \
+			dvb-fe-xc5000-1.6.114.fw \
+			dvb-fe-xc5000c-4.1.30.7.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc4000 \
+				    LICENCE.xc5000 \
+				    LICENCE.xc5000c
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AS102),y)
-- 
1.9.1
