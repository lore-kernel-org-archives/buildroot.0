From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jun 2018 16:01:27 +0200
Subject: [Buildroot] [PATCH 08/13] package/x11r7/xdriver_xf86-video-*: mass
 switch to xorgproto
In-Reply-To: <20180617140132.2752-1-bernd.kuhls@t-online.de>
References: <20180617140132.2752-1-bernd.kuhls@t-online.de>
Message-ID: <20180617140132.2752-9-bernd.kuhls@t-online.de>
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
 package/x11r7/xdriver_xf86-video-amdgpu/Config.in     |  9 +--------
 .../xdriver_xf86-video-amdgpu.mk                      |  9 +--------
 package/x11r7/xdriver_xf86-video-ark/Config.in        |  6 +-----
 .../xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk  |  2 +-
 package/x11r7/xdriver_xf86-video-ast/Config.in        |  3 +--
 .../xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk  |  2 +-
 package/x11r7/xdriver_xf86-video-ati/Config.in        |  9 +--------
 .../xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk  |  9 +--------
 package/x11r7/xdriver_xf86-video-cirrus/Config.in     |  7 +------
 .../xdriver_xf86-video-cirrus.mk                      |  2 +-
 package/x11r7/xdriver_xf86-video-dummy/Config.in      |  7 +------
 .../xdriver_xf86-video-dummy.mk                       |  2 +-
 package/x11r7/xdriver_xf86-video-fbdev/Config.in      |  6 +-----
 .../xdriver_xf86-video-fbdev.mk                       |  2 +-
 package/x11r7/xdriver_xf86-video-fbturbo/Config.in    |  8 +-------
 .../xdriver_xf86-video-fbturbo.mk                     | 11 +----------
 package/x11r7/xdriver_xf86-video-geode/Config.in      |  6 +-----
 .../xdriver_xf86-video-geode.mk                       |  2 +-
 package/x11r7/xdriver_xf86-video-glint/Config.in      | 10 +---------
 .../xdriver_xf86-video-glint.mk                       |  2 +-
 package/x11r7/xdriver_xf86-video-i128/Config.in       |  7 +------
 .../xdriver_xf86-video-i128.mk                        |  2 +-
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in    |  3 +--
 .../xdriver_xf86-video-imx-viv.mk                     |  2 +-
 package/x11r7/xdriver_xf86-video-imx/Config.in        |  7 +------
 .../xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk  |  3 +--
 package/x11r7/xdriver_xf86-video-intel/Config.in      |  3 +--
 .../xdriver_xf86-video-intel.mk                       |  3 +--
 package/x11r7/xdriver_xf86-video-mach64/Config.in     |  6 +-----
 .../xdriver_xf86-video-mach64.mk                      |  2 +-
 package/x11r7/xdriver_xf86-video-mga/Config.in        |  9 +--------
 .../xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk  |  2 +-
 package/x11r7/xdriver_xf86-video-neomagic/Config.in   |  8 +-------
 .../xdriver_xf86-video-neomagic.mk                    |  2 +-
 package/x11r7/xdriver_xf86-video-nouveau/Config.in    |  6 +-----
 .../xdriver_xf86-video-nouveau.mk                     |  6 +-----
 package/x11r7/xdriver_xf86-video-nv/Config.in         |  7 +------
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk    |  2 +-
 package/x11r7/xdriver_xf86-video-openchrome/Config.in |  7 +------
 .../xdriver_xf86-video-openchrome.mk                  |  8 +-------
 package/x11r7/xdriver_xf86-video-qxl/Config.in        |  3 +--
 .../xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk  |  3 +--
 package/x11r7/xdriver_xf86-video-r128/Config.in       |  6 +-----
 .../xdriver_xf86-video-r128.mk                        |  2 +-
 package/x11r7/xdriver_xf86-video-savage/Config.in     |  8 +-------
 .../xdriver_xf86-video-savage.mk                      |  2 +-
 .../x11r7/xdriver_xf86-video-siliconmotion/Config.in  |  7 +------
 .../xdriver_xf86-video-siliconmotion.mk               |  2 +-
 package/x11r7/xdriver_xf86-video-sis/Config.in        | 10 +---------
 .../xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk  |  2 +-
 package/x11r7/xdriver_xf86-video-tdfx/Config.in       |  8 +-------
 .../xdriver_xf86-video-tdfx.mk                        |  8 +-------
 package/x11r7/xdriver_xf86-video-tga/Config.in        |  8 +-------
 .../xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk  |  2 +-
 package/x11r7/xdriver_xf86-video-trident/Config.in    |  8 +-------
 .../xdriver_xf86-video-trident.mk                     |  2 +-
 package/x11r7/xdriver_xf86-video-vesa/Config.in       |  6 +-----
 .../xdriver_xf86-video-vesa.mk                        |  2 +-
 package/x11r7/xdriver_xf86-video-vmware/Config.in     |  7 +------
 .../xdriver_xf86-video-vmware.mk                      |  2 +-
 package/x11r7/xdriver_xf86-video-voodoo/Config.in     |  7 +------
 .../xdriver_xf86-video-voodoo.mk                      |  2 +-
 62 files changed, 62 insertions(+), 254 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
index 968c5e767c..43090c7559 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -6,14 +6,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
-	select BR2_PACKAGE_XPROTO_DRI3PROTO
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  AMD GPU video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 5c1fb3f844..b8b7dcfe2f 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -12,14 +12,7 @@ XDRIVER_XF86_VIDEO_AMDGPU_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
 	libdrm \
 	xlib_libXcomposite \
-	xproto_dri3proto \
-	xproto_fontsproto \
-	xproto_glproto \
-	xproto_randrproto \
-	xproto_videoproto \
-	xproto_xextproto \
-	xproto_xf86driproto \
-	xproto_xproto \
+	xorgproto \
 	xserver_xorg-server
 
 # xdriver_xf86-video-amdgpu requires O_CLOEXEC
diff --git a/package/x11r7/xdriver_xf86-video-ark/Config.in b/package/x11r7/xdriver_xf86-video-ark/Config.in
index cecedde024..e1219affa3 100644
--- a/package/x11r7/xdriver_xf86-video-ark/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ark/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
 	bool "xf86-video-ark"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org driver for ark cards
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index c0b905b8dd..3f2a63609e 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION)
 XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ARK_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ARK_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-ast/Config.in b/package/x11r7/xdriver_xf86-video-ast/Config.in
index 5dfe95e537..2ebe8fc2fb 100644
--- a/package/x11r7/xdriver_xf86-video-ast/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ast/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST
 	bool "xf86-video-ast"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  No description available
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index 3c9eb91159..b39bbf9a15 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION)
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AST_LICENSE = MIT
 XDRIVER_XF86_VIDEO_AST_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_AST_DEPENDENCIES = xproto_fontsproto xproto_xproto xserver_xorg-server
+XDRIVER_XF86_VIDEO_AST_DEPENDENCIES = xorgproto xserver_xorg-server
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 00d91bda51..fdf1ebd18b 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -5,14 +5,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  ATI video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 8726695399..83399039d4 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -12,14 +12,7 @@ XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	libdrm \
 	xlib_libXcomposite \
-	xproto_fontsproto \
-	xproto_glproto \
-	xproto_randrproto \
-	xproto_videoproto \
-	xproto_xextproto \
-	xproto_xf86driproto \
-	xproto_xineramaproto \
-	xproto_xproto \
+	xorgproto \
 	xserver_xorg-server
 
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO)$(BR2_PACKAGE_LIBEPOXY),yy)
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/Config.in b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
index 11c9df8e0e..2987c3f0f0 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/Config.in
+++ b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
@@ -1,10 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS
 	bool "xf86-video-cirrus"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Cirrus Logic video driver
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index 78e8a9c05d..fa776a24d6 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS
 XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_CIRRUS_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/Config.in b/package/x11r7/xdriver_xf86-video-dummy/Config.in
index 00f7e1df40..58c70a8413 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/Config.in
+++ b/package/x11r7/xdriver_xf86-video-dummy/Config.in
@@ -1,10 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
 	bool "xf86-video-dummy"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org driver for dummy cards
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index fff1495ef5..3127f6cb1b 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VE
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE = MIT
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
+XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/Config.in b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
index 9f7c5402b8..0ecba482fb 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/Config.in
+++ b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV
 	bool "xf86-video-fbdev"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  video driver for framebuffer device
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index 7d08c7da18..f39311e611 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VE
 XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
+XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/Config.in b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
index 7825901e98..7acf93e262 100644
--- a/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/Config.in
@@ -2,13 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBTURBO
 	bool "xf86-video-fbturbo"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_PIXMAN
-	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_LIBUMP
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  video driver, primarily optimized for the devices powered
 	  by the Allwinner SoC (A10, A13, A20). It can use some of
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
index 15f4cd1093..58a70416dd 100644
--- a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
@@ -12,12 +12,7 @@ XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES = \
 	xserver_xorg-server \
 	libdrm \
 	pixman \
-	xproto_fontsproto \
-	xproto_randrproto \
-	xproto_renderproto \
-	xproto_videoproto \
-	xproto_xproto \
-	xproto_xf86driproto
+	xorgproto
 
 ifeq ($(BR2_PACKAGE_LIBPCIACCESS),y)
 XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += libpciaccess
@@ -30,10 +25,6 @@ ifeq ($(BR2_PACKAGE_LIBUMP),y)
 XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += libump
 endif
 
-ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
-XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += xproto_dri2proto
-endif
-
 define XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
 	$(INSTALL) -m 0644 -D $(@D)/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
 endef
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index fe217b922c..b432f2d4a1 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	bool "xf86-video-geode"
 	depends on BR2_i386
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  video driver for geode device
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index 9138abdbee..54616f65fe 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VE
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_GEODE_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
+XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
index acae30b0b0..c474f6c912 100644
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glint/Config.in
@@ -2,15 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	bool "xf86-video-glint"
 	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  GLINT/Permedia video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index 52bc567e59..fba0030757 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_GLINT_SOURCE = xf86-video-glint-$(XDRIVER_XF86_VIDEO_GLINT_VE
 XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLINT_LICENSE = MIT
 XDRIVER_XF86_VIDEO_GLINT_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
+XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-i128/Config.in b/package/x11r7/xdriver_xf86-video-i128/Config.in
index 30b240cc1f..4f4810cc09 100644
--- a/package/x11r7/xdriver_xf86-video-i128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-i128/Config.in
@@ -1,10 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
 	bool "xf86-video-i128"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Number 9 I128 video driver
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index 1bb760cee3..148fc3d1d0 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSI
 XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_I128_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
index 5a0257305c..13cee14deb 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -6,8 +6,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org driver for iMX6 GPU (Vivante)
 
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index 222d74ac4b..0913427542 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -8,7 +8,7 @@ XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = rel_imx_4.9.x_1.0.0_ga
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = https://source.codeaurora.org/external/imx/xf86-video-imx-vivante
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE_METHOD = git
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv imx-gpu-g2d xserver_xorg-server \
-	xproto_xproto xproto_xf86driproto libdrm
+	xorgproto libdrm
 XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE_FILES = COPYING-MIT
 XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING = YES
diff --git a/package/x11r7/xdriver_xf86-video-imx/Config.in b/package/x11r7/xdriver_xf86-video-imx/Config.in
index 398d49e1f0..410a458411 100644
--- a/package/x11r7/xdriver_xf86-video-imx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx/Config.in
@@ -5,12 +5,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX
 	depends on BR2_LINUX_KERNEL # linux/mxcfb.h
 	depends on BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11
 	select BR2_PACKAGE_LIBZ160
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org driver for iMX5 GPU
 
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
index 5684a6db18..b80c6b7733 100644
--- a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
@@ -8,8 +8,7 @@ XDRIVER_XF86_VIDEO_IMX_VERSION = 11.09.01
 XDRIVER_XF86_VIDEO_IMX_SOURCE = xserver-xorg-video-imx-$(XDRIVER_XF86_VIDEO_IMX_VERSION).tar.gz
 XDRIVER_XF86_VIDEO_IMX_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_DEPENDENCIES = linux libz160 xserver_xorg-server \
-	xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto \
-	xproto_xf86dgaproto xproto_xproto
+	xorgproto
 XDRIVER_XF86_VIDEO_IMX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index dc2fabf404..c4152b7cf8 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	bool "xf86-video-intel"
 	depends on (BR2_i386 || BR2_x86_64)
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
 	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Intel video driver
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index fa0f650dbe..ff89a7041f 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -27,8 +27,7 @@ XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
 	libdrm \
 	libpciaccess \
 	xlib_libXrandr \
-	xproto_fontsproto \
-	xproto_xproto \
+	xorgproto \
 	xserver_xorg-server
 
 # X.org server support for DRI depends on a Mesa3D DRI driver
diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index 82de826ad7..71c89dd295 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	bool "xf86-video-mach64"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  mach64 video driver
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 599036033d..7f77b4883f 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -10,7 +10,7 @@ XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_MACH64_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS = --disable-dri
diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
index a504ec0c25..15fb3b9f87 100644
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
@@ -2,14 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	bool "xf86-video-mga"
 	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Matrox video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 065a68ea67..bdc9f35884 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -10,7 +10,7 @@ XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/archive/individual/dri
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
+XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 XDRIVER_XF86_VIDEO_MGA_CONF_OPTS = --disable-dri
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/Config.in b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
index f8c8c47fce..5f36a48f40 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/Config.in
+++ b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
@@ -1,11 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
 	bool "xf86-video-neomagic"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Neomagic video driver
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index cfd55361e7..93cd55a11b 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NE
 XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
+XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/Config.in b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
index 7e756e2107..c9fd2e3d2f 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
@@ -4,11 +4,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
-	select BR2_PACKAGE_XPROTO_DRI2PROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Nouveau video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
index e3969a2646..41b6fd6d42 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -12,11 +12,7 @@ XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_NOUVEAU_DEPENDENCIES = \
 	host-pkgconf \
 	libdrm \
-	xproto_dri2proto \
-	xproto_randrproto \
-	xproto_renderproto \
-	xproto_videoproto \
-	xproto_xextproto \
+	xorgproto \
 	xserver_xorg-server
 
 # xdriver_xf86-video-nouveau requires O_CLOEXEC
diff --git a/package/x11r7/xdriver_xf86-video-nv/Config.in b/package/x11r7/xdriver_xf86-video-nv/Config.in
index 8898f56729..5ff8b798c6 100644
--- a/package/x11r7/xdriver_xf86-video-nv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nv/Config.in
@@ -1,10 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
 	bool "xf86-video-nv"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  NVIDIA video driver
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 430ce4a1d1..1e5fc26ddb 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).ta
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NV_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index 02723eca69..a93d14376b 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -5,12 +5,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XLIB_LIBXVMC
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Openchrome, A free and Open Source video driver for the
 	  VIA/S3G UniChrome and UniChrome Pro graphics chipsets.
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 9ab032b6bc..0a669e186b 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -16,12 +16,6 @@ XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 	xlib_libX11 \
 	xlib_libXcomposite \
 	xlib_libXvMC \
-	xproto_fontsproto \
-	xproto_glproto \
-	xproto_randrproto \
-	xproto_renderproto \
-	xproto_xextproto \
-	xproto_xf86driproto \
-	xproto_xproto
+	xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-qxl/Config.in b/package/x11r7/xdriver_xf86-video-qxl/Config.in
index 967ecaf527..40f61fd69f 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/Config.in
+++ b/package/x11r7/xdriver_xf86-video-qxl/Config.in
@@ -5,8 +5,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL
 	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_SPICE_PROTOCOL
 	select BR2_PACKAGE_XLIB_LIBXFONT2 if !BR2_PACKAGE_XLIB_LIBXFONT
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  QEMU QXL paravirt video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
index f410f8e95f..ffbac05ec1 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -16,8 +16,7 @@ XDRIVER_XF86_VIDEO_QXL_CONF_OPTS = \
 XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES = \
 	libpciaccess \
 	spice-protocol \
-	xproto_fontsproto \
-	xproto_xproto \
+	xorgproto \
 	xserver_xorg-server
 
 # configure doesn't look for drm headers in the appropiate place, so help it
diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
index 22ba4931e6..e1e2dd2f30 100644
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	bool "xf86-video-r128"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  R128 video driver
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 344b48415c..9dd9ef25e4 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -10,7 +10,7 @@ XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 XDRIVER_XF86_VIDEO_R128_CONF_OPTS = --disable-dri
diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
index 77dde87619..bc6ca52370 100644
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
@@ -2,13 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	bool "xf86-video-savage"
 	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  S3 Savage video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index ae1dea34ae..d7311aa918 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -10,7 +10,7 @@ XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
+XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS = --disable-dri
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
index 727004a55a..036a2f1c83 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
@@ -1,10 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
 	bool "xf86-video-siliconmotion"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Silicon Motion video driver
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 53b19f9fea..65fd846535 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -9,7 +9,7 @@ XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF8
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xorgproto
 
 XDRIVER_XF86_VIDEO_SILICONMOTION_CONF_OPTS = --disable-selective-werror
 
diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index 3c86bd403e..db01cf2afe 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -2,15 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	bool "xf86-video-sis"
 	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  SiS and XGI video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 833246e35e..af80e15da9 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -10,7 +10,7 @@ XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SIS_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 XDRIVER_XF86_VIDEO_SIS_CONF_OPTS += --disable-dri
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
index 96a69ba25c..959dc31049 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
@@ -2,13 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	bool "xf86-video-tdfx"
 	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  3Dfx video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 471e6cf4d2..6511eec7ad 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -12,13 +12,7 @@ XDRIVER_XF86_VIDEO_TDFX_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = \
 	libdrm \
-	xproto_fontsproto \
-	xproto_randrproto \
-	xproto_renderproto \
-	xproto_videoproto \
-	xproto_xextproto \
-	xproto_xf86driproto \
-	xproto_xproto \
+	xorgproto \
 	xserver_xorg-server
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
index 9d03db3b38..7c75661acc 100644
--- a/package/x11r7/xdriver_xf86-video-tga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tga/Config.in
@@ -1,11 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
 	bool "xf86-video-tga"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org driver for tga cards
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index 8af5ac81e1..421b09be22 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION)
 XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TGA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TGA_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
+XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-trident/Config.in b/package/x11r7/xdriver_xf86-video-trident/Config.in
index 15ac3ea726..ca7069c800 100644
--- a/package/x11r7/xdriver_xf86-video-trident/Config.in
+++ b/package/x11r7/xdriver_xf86-video-trident/Config.in
@@ -1,11 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
 	bool "xf86-video-trident"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Trident video driver
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index 727744c532..20ec4bbc24 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRID
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TRIDENT_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
+XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-vesa/Config.in b/package/x11r7/xdriver_xf86-video-vesa/Config.in
index 98f434704f..fb4e4e8e93 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vesa/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
 	bool "xf86-video-vesa"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Generic VESA video driver
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index d2a9205197..425280a119 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSI
 XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VESA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VESA_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
index a3382d7346..6d937b47bb 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vmware/Config.in
@@ -3,12 +3,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	depends on BR2_PACKAGE_MESA3D
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  VMware SVGA video driver
 
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index 1b2066d277..3ba6b332a3 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -9,7 +9,7 @@ XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE
 XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = mesa3d xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = mesa3d xserver_xorg-server xorgproto
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XDRIVER_XF86_VIDEO_VMWARE_CONF_OPTS += --with-libudev
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/Config.in b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
index f531676dab..f4612120e4 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
@@ -1,10 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
 	bool "xf86-video-voodoo"
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Voodoo video driver
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index e1ef0c6ca3..d6deaa7974 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -9,6 +9,6 @@ XDRIVER_XF86_VIDEO_VOODOO_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-
 XDRIVER_XF86_VIDEO_VOODOO_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VOODOO_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_VOODOO_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
+XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xorgproto
 
 $(eval $(autotools-package))
-- 
2.17.1
