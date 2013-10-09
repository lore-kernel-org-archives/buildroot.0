From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Tue,  8 Oct 2013 20:05:30 -0700
Subject: [Buildroot] [PATCH V4 1/2] i.MX: Use FREESCALE_IMX_SITE for
	Freescale packages
In-Reply-To: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1381287931-7070-2-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch consolidates the URLs for various Freescale-supplied
packages to use FREESCALE_IMX_SITE.

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
No changes in V4.

 package/freescale-imx/firmware-imx/firmware-imx.mk         | 2 +-
 package/freescale-imx/freescale-imx.mk                     | 2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk                   | 2 +-
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk       | 3 +--
 package/libfslcodec/libfslcodec.mk                         | 3 +--
 package/libfslparser/libfslparser.mk                       | 3 +--
 package/libfslvpuwrap/libfslvpuwrap.mk                     | 3 +--
 8 files changed, 8 insertions(+), 12 deletions(-)

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
index d35a62e..0dd5629 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -7,6 +7,6 @@
 FREESCALE_IMX_VERSION = 1.1.0
 
 # No official download site from freescale, just this mirror
-FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
+FREESCALE_IMX_SITE   = http://download.ossystems.com.br/bsp/freescale/source
 
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
 
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index ccdb521..4437875 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 GST_FSL_PLUGINS_VERSION = 3.0.1
-# No official download site from freescale, just this mirror
-GST_FSL_PLUGINS_SITE = http://download.ossystems.com.br/bsp/freescale/source
+GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
 # LGPLv2.1+, which essentially makes it LGPLv2.1+
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index c18332a..ad1cc63 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBFSLCODEC_VERSION = 3.0.1
-# No official download site from freescale, just this mirror
-LIBFSLCODEC_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
 LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 3e27a6a..3aab3a7 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBFSLPARSER_VERSION = 3.0.1
-# No official download site from freescale, just this mirror
-LIBFSLPARSER_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 1bc7129..346a20a 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBFSLVPUWRAP_VERSION = 1.0.17
-# No official download site from freescale, just this mirror
-LIBFSLVPUWRAP_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
 LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
 LIBFSLVPUWRAP_REDISTRIBUTE = NO
-- 
1.8.1.2
