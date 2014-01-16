From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 14:27:51 +0800
Subject: [Buildroot] [PATCH 3/3] package/linux-firmware: Add cxgb4 firmware
In-Reply-To: <1389853671.877776.456824160566.0.gpush@pablo>
Message-ID: <1389853671.878761.982783196116.3.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds firmware for the Chelsio T4 1Gb/10Gb ethernet cards.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/linux-firmware/Config.in         |    4 ++++
 package/linux-firmware/linux-firmware.mk |    7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 57f8096b..861d9670 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -100,6 +100,10 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	help
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
+	bool "Chelsio T4 "
+	help
+	  Firmware files for Chelsio T4 1Gb and 10Gb ethernet cards (cxgb4)
 endmenu
 
 menu "DVB firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index db9928d9..de5213fb 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -144,6 +144,13 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4),y)
+LINUX_FIRMWARE_FILES += \
+	cxgb4/t4fw-1.9.23.0.bin \
+	cxbg4/t4fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XC5000),y)
 LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc5000
