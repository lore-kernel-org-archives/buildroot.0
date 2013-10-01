From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Tue,  1 Oct 2013 11:06:30 -0700
Subject: [Buildroot] [PATCH 2/2] gst-fsl-plugins: Bump version and change
	URL to match other i.MX components
In-Reply-To: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1380650790-18097-3-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index ccdb521..00c6acb 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-GST_FSL_PLUGINS_VERSION = 3.0.1
-# No official download site from freescale, just this mirror
-GST_FSL_PLUGINS_SITE = http://download.ossystems.com.br/bsp/freescale/source
+include package/freescale-imx/freescale-imx.inc
+
+GST_FSL_PLUGINS_VERSION = $(FREESCALE_IMX_VERSION)
+GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
+GST_FSL_PLUGINS_SOURCE = gst-fsl-plugins-$(GST_FSL_PLUGINS_VERSION).tar.gz
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
 # LGPLv2.1+, which essentially makes it LGPLv2.1+
-- 
1.8.1.2
