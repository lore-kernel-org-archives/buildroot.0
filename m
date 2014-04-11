From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Apr 2014 17:11:43 +0200
Subject: [Buildroot] [git commit] libfslcodec: needs a (e)glibc based
	toolchain
Message-ID: <20140411151239.48F3A9C717@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35df2e155cc641c4a0e2f464563c2e1a5feb3e9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package contains prebuilt binaries linked against glibc.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-fsl-plugins/Config.in |    5 +++++
 package/libfslcodec/Config.in               |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 4e2bbe4..afedd95 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -1,10 +1,15 @@
 comment "gst-fsl-plugins needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm && !BR2_LINUX_KERNEL
 
+comment "gst-fsl-plugines needs an (e)glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_GST_FSL_PLUGINS
 	bool "gst-fsl-plugins"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libfslcodec
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_LIBFSLVPUWRAP
 	select BR2_PACKAGE_IMX_LIB
diff --git a/package/libfslcodec/Config.in b/package/libfslcodec/Config.in
index 7b31b7a..be79352 100644
--- a/package/libfslcodec/Config.in
+++ b/package/libfslcodec/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_LIBFSLCODEC
 	bool "libfslcodec"
 	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Binary codec libraries for the Freescale i.MX SoCs.
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
+
+comment "libfslcodec needs an (e)glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
