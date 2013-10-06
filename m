From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun,  6 Oct 2013 08:33:43 -0700
Subject: [Buildroot] [PATCH V2 2/3] i.MX6: Use canonical site for Freescale
	packages
In-Reply-To: <1381073624-27739-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1381073624-27739-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1381073624-27739-2-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use official Freescale site for distribution of i.MX packages,
rename FREESCALE_IMX_MIRROR_SITE to FREESCALE_IMX_SITE as
suggested by Peter Korsgaard.

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
V2 updates libfslcodec/libfslparser/libfslvpuwrap in their
original directories instead of freescale-imx/.
 
 package/freescale-imx/firmware-imx/firmware-imx.mk         | 2 +-
 package/freescale-imx/freescale-imx.mk                     | 4 ++--
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk                   | 2 +-
 package/libfslcodec/libfslcodec.mk                         | 3 +--
 package/libfslparser/libfslparser.mk                       | 3 +--
 package/libfslvpuwrap/libfslvpuwrap.mk                     | 3 +--
 7 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index d9fcb89..d26b31c 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FIRMWARE_IMX_VERSION = $(FREESCALE_IMX_VERSION)
-FIRMWARE_IMX_SITE = $(FREESCALE_IMX_MIRROR_SITE)
+FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
 	Atheros license (ath6k)
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index d35a62e..47e7be2 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -6,7 +6,7 @@
 
 FREESCALE_IMX_VERSION = 1.1.0
 
-# No official download site from freescale, just this mirror
-FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
+FREESCALE_IMX_SITE   = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
+#FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index c48d108..8e979ee 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
-GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
+GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_SITE)
 GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
 
 GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index bd7e174..e1a68ef 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
-IMX_LIB_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
+IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
 # No license file included
 
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index e0dca7f..ad1cc63 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBFSLCODEC_VERSION = 3.0.1
-# No official download site from freescale, just this mirror
-LIBFSLCODEC_SITE = $(FREESCALE_IMX_MIRROR_SITE)
+LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
 LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index c2af129..3aab3a7 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBFSLPARSER_VERSION = 3.0.1
-# No official download site from freescale, just this mirror
-LIBFSLPARSER_SITE = $(FREESCALE_IMX_MIRROR_SITE)
+LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index f4539f3..346a20a 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBFSLVPUWRAP_VERSION = 1.0.17
-# No official download site from freescale, just this mirror
-LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_MIRROR_SITE)
+LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
 LIBFSLVPUWRAP_REDISTRIBUTE = NO
-- 
1.8.1.2
