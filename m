From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  3 Jan 2018 19:38:33 +0100
Subject: [Buildroot] [PATCH 07/16] gst1-imx: update g2d libraries
 dependencies
In-Reply-To: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
Message-ID: <20180103183842.10182-8-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To match the new imx-gpu-g2d package.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/gstreamer1/gst1-imx/Config.in   | 6 +++---
 package/gstreamer1/gst1-imx/gst1-imx.mk | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index e4cee05b90..7b46233b53 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -27,12 +27,12 @@ comment "imxeglvivsink needs the Vivante 3D libraries"
 
 config BR2_PACKAGE_GST1_IMX_G2D
 	bool "imxg2d"
-	depends on BR2_PACKAGE_IMX_GPU_VIV_G2D
+	depends on BR2_PACKAGE_IMX_GPU_G2D
 	help
 	  Elements leveraging the 2D GPU
 
-comment "imxg2d needs the Vivante 2D libraries"
-	depends on !BR2_PACKAGE_IMX_GPU_VIV_G2D
+comment "imxg2d needs the G2D libraries"
+	depends on !BR2_PACKAGE_IMX_GPU_G2D
 
 config BR2_PACKAGE_GST1_IMX_IPU
 	bool "imxipu"
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index a8fe6fe041..43b4d9b15f 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -33,6 +33,10 @@ ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 GST1_IMX_DEPENDENCIES += imx-gpu-viv
 endif
 
+ifeq ($(BR2_PACKAGE_IMX_GPU_G2D),y)
+GST1_IMX_DEPENDENCIES += imx-gpu-g2d
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_IMX_EGLVISINK),y)
 # There's no --enable-eglvivsink option
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-- 
2.15.1
