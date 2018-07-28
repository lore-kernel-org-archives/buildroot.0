From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 22:29:42 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-base:
 switch to xorgproto
Message-ID: <20180728211151.90FDA8A392@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a31c976b30925c956053871c803cddf34bdc6b17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 210bbeb20a..36440ef5fa 100644
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
