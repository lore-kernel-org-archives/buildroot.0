From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  5 Feb 2014 23:18:13 +0100
Subject: [Buildroot] [PATCH 2/2] opencv: cleanup depends and comments
In-Reply-To: <1391638693-12997-1-git-send-email-s.martin49@gmail.com>
References: <1391638693-12997-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391638693-12997-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the opencv package globally depends on BR2_TOOLCHAIN_HAS_THREADS
and BR2_USE_WCHAR, then cleanup these redundant (and useless)
dependencies in the opencv's sub-options.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/Config.in | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index ccde5cb..dfdd93a 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -140,20 +140,13 @@ comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
-	depends on BR2_USE_WCHAR # gstreamer -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
 	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
-comment "gstreamer support needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGTK2
 
@@ -188,13 +181,12 @@ config BR2_PACKAGE_OPENCV_WITH_TIFF
 config BR2_PACKAGE_OPENCV_WITH_V4L
 	bool "v4l support"
 	depends on BR2_LARGEFILE
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBV4L
 	help
 	  Enable Video 4 Linux support.
 
-comment "v4l support needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "v4l support needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
 
 comment "Install options"
 
-- 
1.8.5.3
