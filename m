From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:58:46 +0100
Subject: [Buildroot] [git commit] gst1-imx: add missing libfslcodec
	dependency
Message-ID: <20160319135921.72D44803EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62d1d8ce4b943ef560bba422c5b2b2bf3d536f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by imxmp3audioenc and imxuniaudiodec plugins.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
