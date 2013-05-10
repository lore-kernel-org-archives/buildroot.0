From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Date: Fri, 10 May 2013 10:30:13 +0200
Subject: [Buildroot] [PATCH 3/3] Move and refactor package firmware-imx to
	the freescale-imx directory
In-Reply-To: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <1368174613-3427-4-git-send-email-h.fijnvandraat@inter.nl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When moved, the version and download site are set to those specified in the
freescale-imx.mk file.
This means that the version is bumped from 12.09.01 to 1.1.0

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
---
 package/Config.in                                        |    1 -
 package/freescale-imx/Config.in                          |    1 +
 package/{ => freescale-imx}/firmware-imx/Config.in       |    0
 package/{ => freescale-imx}/firmware-imx/firmware-imx.mk |    7 +++----
 4 files changed, 4 insertions(+), 5 deletions(-)
 rename package/{ => freescale-imx}/firmware-imx/Config.in (100%)
 rename package/{ => freescale-imx}/firmware-imx/firmware-imx.mk (85%)

diff --git a/package/Config.in b/package/Config.in
index da422fb..6a27455 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -215,7 +215,6 @@ menu "Hardware handling"
 source "package/freescale-imx/Config.in"
 menu "Misc devices firmwares"
 source "package/b43-firmware/Config.in"
-source "package/firmware-imx/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/rpi-firmware/Config.in"
 source "package/ux500-firmware/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index a391014..1f60192 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -12,4 +12,5 @@ menuconfig BR2_PACKAGE_IMX
 
 if BR2_PACKAGE_IMX
 source "package/imx-lib/Config.in"
+source "package/freescale-imx/firmware-imx/Config.in"
 endif
diff --git a/package/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
similarity index 100%
rename from package/firmware-imx/Config.in
rename to package/freescale-imx/firmware-imx/Config.in
diff --git a/package/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
similarity index 85%
rename from package/firmware-imx/firmware-imx.mk
rename to package/freescale-imx/firmware-imx/firmware-imx.mk
index 3b43bef..062c6f9 100644
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
+FIRMWARE_IMX_VERSION = $(IMX_VERSION_LEVEL)
+FIRMWARE_IMX_SITE    = $(IMX_MIRROR_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
 	Atheros license (ath6k)
-- 
1.7.10.4
