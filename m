From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:26 +0200
Subject: [Buildroot] [PATCH 16/20] firmware-imx: move to the freescale-imx
	directory
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>

This commit moves the firmware-imx package to the newly introduced
freescale-imx/ directory, and uses the new variables provided by
freescale-imx/freescale-imx.mk.

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 -
 package/freescale-imx/Config.in                    |    1 +
 package/{ => freescale-imx}/firmware-imx/Config.in |    0
 .../firmware-imx/firmware-imx.mk                   |    7 +++----
 4 files changed, 4 insertions(+), 5 deletions(-)
 rename package/{ => freescale-imx}/firmware-imx/Config.in (100%)
 rename package/{ => freescale-imx}/firmware-imx/firmware-imx.mk (85%)

diff --git a/package/Config.in b/package/Config.in
index a3b3e05..2874eb6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -215,7 +215,6 @@ endmenu
 menu "Hardware handling"
 menu "Misc devices firmwares"
 source "package/b43-firmware/Config.in"
-source "package/firmware-imx/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/rpi-firmware/Config.in"
 source "package/sunxi-boards/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index edc9ab5..840b83b 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -2,5 +2,6 @@ menu "Freescale i.MX libraries"
 	depends on BR2_arm
 
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/firmware-imx/Config.in"
 
 endmenu
diff --git a/package/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
similarity index 100%
rename from package/firmware-imx/Config.in
rename to package/freescale-imx/firmware-imx/Config.in
diff --git a/package/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
similarity index 85%
rename from package/firmware-imx/firmware-imx.mk
rename to package/freescale-imx/firmware-imx/firmware-imx.mk
index 3b43bef..85f8dc2 100644
--- a/package/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -1,12 +1,11 @@
 #############################################################
 #
-# buildroot makefile for firmware-imx
+# firmware-imx
 #
 #############################################################
 
-FIRMWARE_IMX_VERSION = 12.09.01
-# No official download site from freescale, just this mirror
-FIRMWARE_IMX_SITE = http://download.ossystems.com.br/bsp/freescale/source
+FIRMWARE_IMX_VERSION = $(FREESCALE_IMX_VERSION)
+FIRMWARE_IMX_SITE = $(FREESCALE_IMX_MIRROR_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
 	Atheros license (ath6k)
-- 
1.7.9.5
