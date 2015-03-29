From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 29 Mar 2015 08:14:17 +0200
Subject: [Buildroot] [PATCH] gstreamer/gst-plugin-x170: requires the Linux
	kernel
Message-ID: <1427609657-9715-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a missing reverse depency from the on2-8170-libs package.

Fixes warning:
warning: (BR2_PACKAGE_GST_PLUGIN_X170) selects BR2_PACKAGE_ON2_8170_LIBS which has unmet direct dependencies (BR2_arm926t && BR2_TOOLCHAIN_USES_GLIBC && BR2_LINUX_KERNEL)

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/gstreamer/gst-plugin-x170/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-plugin-x170/Config.in b/package/gstreamer/gst-plugin-x170/Config.in
index ed668c6..09b44be 100644
--- a/package/gstreamer/gst-plugin-x170/Config.in
+++ b/package/gstreamer/gst-plugin-x170/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 	depends on BR2_arm926t
 	# glibc toolchain includes WCHAR and threading for libglib2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # on2-8170-libs
+	depends on BR2_LINUX_KERNEL # on2-8170-libs
 	select BR2_PACKAGE_ON2_8170_LIBS
 	help
 	  GStreamer plug-in to use the Hantro X170 video decoder present on
@@ -10,6 +11,6 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
-comment "gst-plugin-x170 needs an (e)glibc toolchain"
+comment "gst-plugin-x170 needs an (e)glibc toolchain and a Linux kernel to be built"
 	depends on BR2_arm926t
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.3.4
