From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:28:48 +0100
Subject: [Buildroot] [git commit] Revert "gst1-imx: fix v4l2 plugins disable
 options"
Message-ID: <20171122202144.86A408149F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6803a17c3be938af97e6bed00235acc90a7e5d1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 56b611a972218e33e9fc4b48399138889a688a8e. This
patch was intended for the next branch, not the master branch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-imx/Config.in   |  6 ------
 package/gstreamer1/gst1-imx/gst1-imx.mk | 11 ++---------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 9b977bd..9f792d1 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -84,10 +84,4 @@ config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
 	help
 	  Elements for V4L2 capture
 
-config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
-	bool "imxv4l2videosink"
-	select BR2_PACKAGE_GST1_PLUGINS_BAD
-	help
-	  Elements for V4L2 output
-
 endif
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 080fce5..a21e282 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -83,17 +83,10 @@ GST1_IMX_CONF_OPTS += --disable-vpu
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC),y)
-# There's no --enable-imxv4l2videosrc option
+# There's no --enable-v4l2src option
 GST1_IMX_DEPENDENCIES += gst1-plugins-bad
 else
-GST1_IMX_CONF_OPTS += --disable-imxv4l2videosrc
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK),y)
-# There's no --enable-imxv4l2videosink option
-GST1_IMX_DEPENDENCIES += gst1-plugins-bad
-else
-GST1_IMX_CONF_OPTS += --disable-imxv4l2videosink
+GST1_IMX_CONF_OPTS += --disable-v4l2src
 endif
 
 $(eval $(waf-package))
