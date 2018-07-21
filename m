From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 16:16:33 +0200
Subject: [Buildroot] [PATCH v4 03/18] package/gstreamer1/gst1-plugins-base:
 switch to xorgproto
In-Reply-To: <20180721141648.29939-1-bernd.kuhls@t-online.de>
References: <20180721141648.29939-1-bernd.kuhls@t-online.de>
Message-ID: <20180721141648.29939-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer1/gst1-plugins-base/Config.in            | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 531fac4f47..340926ecb9 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -164,7 +164,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
 	depends on !BR2_PACKAGE_RPI_USERLAND # x11
 	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
 	help
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 3ad841bdd3..da58638b30 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -46,7 +46,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX),y)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-glx
-GST1_PLUGINS_BASE_DEPENDENCIES += xproto_glproto xlib_libXrender
+GST1_PLUGINS_BASE_DEPENDENCIES += xorgproto xlib_libXrender
 else
 GST1_PLUGINS_BASE_CONF_OPTS += --disable-glx
 endif
-- 
2.18.0
