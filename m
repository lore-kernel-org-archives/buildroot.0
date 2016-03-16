From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:52 +0100
Subject: [Buildroot] [PATCH 12/14] gst1-imx: add missing libfslcodec
	dependency
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-13-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by imxmp3audioenc and imxuniaudiodec plugins.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/gstreamer1/gst1-imx/gst1-imx.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index ca6bc49..650e097 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -27,6 +27,10 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_IMX_DEPENDENCIES += gst1-plugins-bad
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFSLCODEC),y)
+GST1_IMX_DEPENDENCIES += libfslcodec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBIMXVPUAPI),y)
 GST1_IMX_DEPENDENCIES += libimxvpuapi
 endif
-- 
2.7.0
