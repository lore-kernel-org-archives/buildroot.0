From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jun 2018 23:06:47 +0200
Subject: [Buildroot] [PATCH v2 03/22] package/gstreamer1/gst1-plugins-bad:
 switch to xorgproto
In-Reply-To: <20180623210706.2519-1-bernd.kuhls@t-online.de>
References: <20180623210706.2519-1-bernd.kuhls@t-online.de>
Message-ID: <20180623210706.2519-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index b09e515f5a..db966e9adf 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
 	depends on !BR2_PACKAGE_RPI_USERLAND # x11
 	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index b041014f81..216301059a 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -88,7 +88,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-glx
-GST1_PLUGINS_BAD_DEPENDENCIES += xproto_glproto xlib_libXrender
+GST1_PLUGINS_BAD_DEPENDENCIES += xorgproto xlib_libXrender
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-glx
 endif
-- 
2.17.1
