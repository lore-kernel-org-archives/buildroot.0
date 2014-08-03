From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 14:47:03 +0200
Subject: [Buildroot] [git commit] gst-fsl-plugins,
	libfslvpuwrap: add missing select
Message-ID: <20140803124929.DED899D365@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01370132c10cb2d194042e08fefbc9cec8392c66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to select imx-vpu, packages must also select the
freescale-imx package, otherwise, kconfig prints some warnings.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-fsl-plugins/Config.in |    1 +
 package/libfslvpuwrap/Config.in             |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 309e745..a4a2606 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
 	select BR2_PACKAGE_IMX_VPU
 	select BR2_PACKAGE_LIBFSLPARSER
 	select BR2_PACKAGE_LIBFSLCODEC
+	select BR2_PACKAGE_FREESCALE_IMX
 	help
 	  GStreamer plugins for hardware-accelerated audio and video
 	  parsers and codecs on i.MX platforms. It requires a kernel that
diff --git a/package/libfslvpuwrap/Config.in b/package/libfslvpuwrap/Config.in
index fa85ce5..9cc15d5 100644
--- a/package/libfslvpuwrap/Config.in
+++ b/package/libfslvpuwrap/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBFSLVPUWRAP
 	bool "libfslvpuwrap"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
+	select BR2_PACKAGE_FREESCALE_IMX
 	select BR2_PACKAGE_IMX_VPU
 	help
 	  Wrapper library for the vpu library, giving it a different API.
