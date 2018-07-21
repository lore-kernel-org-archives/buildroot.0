From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 16:16:37 +0200
Subject: [Buildroot] [PATCH v4 07/18] package/x11r7/xapp_*: mass switch to
 xorgproto
In-Reply-To: <20180721141648.29939-1-bernd.kuhls@t-online.de>
References: <20180721141648.29939-1-bernd.kuhls@t-online.de>
Message-ID: <20180721141648.29939-8-bernd.kuhls@t-online.de>
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
 package/x11r7/xapp_mkfontscale/Config.in           |  2 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |  4 ++--
 package/x11r7/xapp_rgb/Config.in                   |  2 +-
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |  2 +-
 package/x11r7/xapp_sessreg/Config.in               |  2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |  2 +-
 package/x11r7/xapp_xconsole/Config.in              |  2 +-
 package/x11r7/xapp_xconsole/xapp_xconsole.mk       |  2 +-
 package/x11r7/xapp_xdm/Config.in                   |  3 +--
 package/x11r7/xapp_xdm/xapp_xdm.mk                 | 10 +++++++++-
 package/x11r7/xapp_xdriinfo/Config.in              |  2 +-
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk       |  2 +-
 package/x11r7/xapp_xfindproxy/Config.in            |  3 +--
 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk   |  3 +--
 package/x11r7/xapp_xfs/Config.in                   |  2 +-
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |  2 +-
 package/x11r7/xapp_xsetpointer/Config.in           |  2 +-
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk |  2 +-
 18 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/Config.in b/package/x11r7/xapp_mkfontscale/Config.in
index 0cfee6ad05..d0a9d89658 100644
--- a/package/x11r7/xapp_mkfontscale/Config.in
+++ b/package/x11r7/xapp_mkfontscale/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_XAPP_MKFONTSCALE
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_ZLIB
 	help
 	  create an index of scalable font files for X
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 12416b4d6b..a07d2f4fbd 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -9,9 +9,9 @@ XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
 XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
-XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
+XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xorgproto
 HOST_XAPP_MKFONTSCALE_DEPENDENCIES = \
-	host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
+	host-zlib host-freetype host-xlib_libfontenc host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_rgb/Config.in b/package/x11r7/xapp_rgb/Config.in
index 038b849d4b..7198b5f1a4 100644
--- a/package/x11r7/xapp_rgb/Config.in
+++ b/package/x11r7/xapp_rgb/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XAPP_RGB
 	bool "rgb"
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  uncompile an rgb color-name database
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 82878abad0..d63576f44d 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -9,6 +9,6 @@ XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
 XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RGB_LICENSE = MIT
 XAPP_RGB_LICENSE_FILES = COPYING
-XAPP_RGB_DEPENDENCIES = xproto_xproto
+XAPP_RGB_DEPENDENCIES = xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_sessreg/Config.in b/package/x11r7/xapp_sessreg/Config.in
index 0796bc1bca..c9048b3b7e 100644
--- a/package/x11r7/xapp_sessreg/Config.in
+++ b/package/x11r7/xapp_sessreg/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XAPP_SESSREG
 	bool "sessreg"
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  manage utmp/wtmp entries for non-init clients
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index c6e9463d3b..46935aed9a 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -9,6 +9,6 @@ XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
 XAPP_SESSREG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SESSREG_LICENSE = MIT
 XAPP_SESSREG_LICENSE_FILES = COPYING
-XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
+XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xconsole/Config.in b/package/x11r7/xapp_xconsole/Config.in
index 7baf4ff6af..3d796bd3c1 100644
--- a/package/x11r7/xapp_xconsole/Config.in
+++ b/package/x11r7/xapp_xconsole/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_XAPP_XCONSOLE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  xconsole - monitor system console messages with X
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index 52656de83c..a91b98dc60 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -10,7 +10,7 @@ XAPP_XCONSOLE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCONSOLE_LICENSE = MIT
 XAPP_XCONSOLE_LICENSE_FILES = COPYING
 XAPP_XCONSOLE_DEPENDENCIES = \
-	xlib_libX11 xlib_libXaw xlib_libXt xproto_xproto \
+	xlib_libX11 xlib_libXaw xlib_libXt xorgproto \
 	xlib_libXmu
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index 69829701ca..af816a1349 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_XAPP_XDM
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org xdm application
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 8f846a82aa..2c213a6bf0 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -10,7 +10,15 @@ XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDM_LICENSE = MIT
 XAPP_XDM_LICENSE_FILES = COPYING
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
-XAPP_XDM_DEPENDENCIES = xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
+XAPP_XDM_DEPENDENCIES = \
+	xapp_sessreg \
+	xapp_xrdb \
+	xlib_libX11 \
+	xlib_libXaw \
+	xlib_libXdmcp \
+	xlib_libXinerama \
+	xlib_libXt \
+	xorgproto
 XAPP_XDM_CONF_OPTS = \
 	--with-utmp-file=/var/adm/utmpx \
 	--with-wtmp-file=/var/adm/wtmpx
diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 2b204d9171..df65b491ab 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
 	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  query configuration information of DRI drivers
 
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 00dea8c7ad..7f7aac9e15 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -9,6 +9,6 @@ XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDRIINFO_LICENSE = MIT
 XAPP_XDRIINFO_LICENSE_FILES = COPYING
-XAPP_XDRIINFO_DEPENDENCIES = libgl xlib_libX11 xproto_glproto
+XAPP_XDRIINFO_DEPENDENCIES = libgl xlib_libX11 xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfindproxy/Config.in b/package/x11r7/xapp_xfindproxy/Config.in
index b186ab65bc..e452dc9658 100644
--- a/package/x11r7/xapp_xfindproxy/Config.in
+++ b/package/x11r7/xapp_xfindproxy/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_XAPP_XFINDPROXY
 	bool "xfindproxy"
 	select BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  xfindproxy utilizes the Proxy Management Protocol to
 	  communicate with a proxy manager to locate available X11
diff --git a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
index 7662a902a2..7832e0ca96 100644
--- a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
+++ b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
@@ -12,7 +12,6 @@ XAPP_XFINDPROXY_LICENSE_FILES = COPYING
 XAPP_XFINDPROXY_DEPENDENCIES = \
 	xlib_libICE \
 	xlib_libXt \
-	xproto_xproto \
-	xproto_xproxymanagementprotocol
+	xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index b708af8c0c..19e675b265 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_XAPP_XFS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBXFONT2
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X font server
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index f4fe35dfb7..9177a65b9c 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -9,6 +9,6 @@ XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
 XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
-XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont2 xproto_fontsproto
+XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont2 xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetpointer/Config.in b/package/x11r7/xapp_xsetpointer/Config.in
index 2b0b4624e8..0deb6d8112 100644
--- a/package/x11r7/xapp_xsetpointer/Config.in
+++ b/package/x11r7/xapp_xsetpointer/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XAPP_XSETPOINTER
 	bool "xsetpointer"
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  set an X Input device as the main pointer
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index f56cdd58a1..a34b7e637d 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -9,6 +9,6 @@ XAPP_XSETPOINTER_SOURCE = xsetpointer-$(XAPP_XSETPOINTER_VERSION).tar.bz2
 XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETPOINTER_LICENSE = MIT
 XAPP_XSETPOINTER_LICENSE_FILES = COPYING
-XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
+XAPP_XSETPOINTER_DEPENDENCIES = xlib_libX11 xlib_libXi xorgproto
 
 $(eval $(autotools-package))
-- 
2.18.0
