From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 09:06:37 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: Add cxgb4 firmware
Message-ID: <20140116081739.BEC029C508@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6f7c8771f486492ef5505163a5724cf30c874e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds firmware for the Chelsio T4 1Gb/10Gb ethernet cards.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in         |    4 ++++
 package/linux-firmware/linux-firmware.mk |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 57f8096..861d967 100644
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
index db9928d..de5213f 100644
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
