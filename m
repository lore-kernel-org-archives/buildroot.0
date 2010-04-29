From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 29 Apr 2010 23:24:18 +0300
Subject: [Buildroot] [PATCH] Make Mesa3D optional for X11
Message-ID: <20100429202418.7426.16656.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Darius Augulis <augulis.darius@gmail.com>

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/x11r7/xapp_xdriinfo/Config.in              |    2 +-
 package/x11r7/xdriver_xf86-video-ati/Config.in     |    1 +
 package/x11r7/xdriver_xf86-video-glint/Config.in   |    1 +
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    1 +
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    1 +
 package/x11r7/xdriver_xf86-video-mga/Config.in     |    1 +
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    1 +
 package/x11r7/xdriver_xf86-video-r128/Config.in    |    1 +
 package/x11r7/xdriver_xf86-video-savage/Config.in  |    1 +
 package/x11r7/xdriver_xf86-video-sis/Config.in     |    1 +
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    1 +
 package/x11r7/xdriver_xf86-video-xgi/Config.in     |    1 +
 package/x11r7/xdriver_xf86-video-xgixp/Config.in   |    1 +
 package/x11r7/xserver_xorg-server/Config.in        |    1 -
 .../xserver_xorg-server/xserver_xorg-server.mk     |    8 ++++++--
 15 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 7442690..970bff5 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D
 	help
 	  query configuration information of DRI drivers
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index d61f11c..107a57b 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
index 703e020..782b6da 100644
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glint/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	bool "xf86-video-glint"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index ddbf4ff..9a1d6cf 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
 	help
 	  Intel video driver
diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index 8202045..f2464e7 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	bool "xf86-video-mach64"
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
index 575bca4..40c6f3a 100644
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	bool "xf86-video-mga"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index 2b42fe0..25424ff 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	bool "xf86-video-openchrome"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXVMC
 	select BR2_PACKAGE_XPROTO_GLPROTO
diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
index feb8893..96bd8d7 100644
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	bool "xf86-video-r128"
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
index ec311bd..a9c8f6c 100644
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	bool "xf86-video-savage"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index fd76847..ac2b632 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	bool "xf86-video-sis"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
index 08104c9..57bb411 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	bool "xf86-video-tdfx"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
diff --git a/package/x11r7/xdriver_xf86-video-xgi/Config.in b/package/x11r7/xdriver_xf86-video-xgi/Config.in
index 9a0c215..d0fe665 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
 	bool "xf86-video-xgi"
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
index e905280..8d466f4 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
 	bool "xf86-video-xgixp"
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 6aa4a03..5743168 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MCOOKIE
-	select BR2_PACKAGE_MESA3D if BR2_PACKAGE_XSERVER_xorg
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0dd6127..6c6017b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -50,7 +50,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_xextproto 		\
 	xproto_xf86bigfontproto 	\
 	xproto_xf86dgaproto 		\
-	xproto_xf86driproto	 	\
 	xproto_xf86rushproto 		\
 	xproto_xf86vidmodeproto 	\
 	xproto_xproto 			\
@@ -65,7 +64,6 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
 XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg --disable-glx
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
@@ -77,6 +75,12 @@ else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-dri
+endif
+
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-null-root-cursor
 else
