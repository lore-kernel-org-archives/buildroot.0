From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 16:16:41 +0200
Subject: [Buildroot] [PATCH v4 11/18] package/x11r7/xlib_*: mass switch to
 xorgproto
In-Reply-To: <20180721141648.29939-1-bernd.kuhls@t-online.de>
References: <20180721141648.29939-1-bernd.kuhls@t-online.de>
Message-ID: <20180721141648.29939-12-bernd.kuhls@t-online.de>
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
 package/x11r7/xlib_libFS/Config.in                 |  3 +--
 package/x11r7/xlib_libFS/xlib_libFS.mk             |  2 +-
 package/x11r7/xlib_libICE/Config.in                |  2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk           |  2 +-
 package/x11r7/xlib_libSM/Config.in                 |  2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk             |  2 +-
 package/x11r7/xlib_libX11/Config.in                |  6 +-----
 package/x11r7/xlib_libX11/xlib_libX11.mk           | 14 +++-----------
 package/x11r7/xlib_libXScrnSaver/Config.in         |  2 +-
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |  2 +-
 package/x11r7/xlib_libXau/Config.in                |  2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk           |  4 ++--
 package/x11r7/xlib_libXaw/Config.in                |  2 +-
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |  2 +-
 package/x11r7/xlib_libXcomposite/Config.in         |  3 +--
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |  2 +-
 package/x11r7/xlib_libXcursor/Config.in            |  2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |  4 ++--
 package/x11r7/xlib_libXdamage/Config.in            |  3 +--
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |  2 +-
 package/x11r7/xlib_libXdmcp/Config.in              |  2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |  4 ++--
 package/x11r7/xlib_libXext/Config.in               |  3 +--
 package/x11r7/xlib_libXext/xlib_libXext.mk         |  2 +-
 package/x11r7/xlib_libXfixes/Config.in             |  4 +---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |  5 ++---
 package/x11r7/xlib_libXfont/Config.in              |  3 +--
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |  4 ++--
 package/x11r7/xlib_libXfont2/Config.in             |  3 +--
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk     |  6 ++----
 package/x11r7/xlib_libXft/Config.in                |  2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk           |  2 +-
 package/x11r7/xlib_libXi/Config.in                 |  3 +--
 package/x11r7/xlib_libXi/xlib_libXi.mk             |  5 ++---
 package/x11r7/xlib_libXinerama/Config.in           |  2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |  2 +-
 package/x11r7/xlib_libXmu/Config.in                |  2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |  2 +-
 package/x11r7/xlib_libXpm/Config.in                |  2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |  2 +-
 package/x11r7/xlib_libXrandr/Config.in             |  4 +---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |  2 +-
 package/x11r7/xlib_libXrender/Config.in            |  3 +--
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |  4 ++--
 package/x11r7/xlib_libXres/Config.in               |  3 +--
 package/x11r7/xlib_libXres/xlib_libXres.mk         |  2 +-
 package/x11r7/xlib_libXt/Config.in                 |  3 +--
 package/x11r7/xlib_libXt/xlib_libXt.mk             |  2 +-
 package/x11r7/xlib_libXtst/Config.in               |  2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |  2 +-
 package/x11r7/xlib_libXv/Config.in                 |  3 +--
 package/x11r7/xlib_libXv/xlib_libXv.mk             |  2 +-
 package/x11r7/xlib_libXvMC/Config.in               |  3 +--
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |  2 +-
 package/x11r7/xlib_libXxf86dga/Config.in           |  3 +--
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |  2 +-
 package/x11r7/xlib_libXxf86vm/Config.in            |  3 +--
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |  2 +-
 package/x11r7/xlib_libdmx/Config.in                |  2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |  2 +-
 package/x11r7/xlib_libfontenc/Config.in            |  2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |  4 ++--
 package/x11r7/xlib_libxkbfile/Config.in            |  2 +-
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |  4 ++--
 package/x11r7/xlib_libxshmfence/Config.in          |  2 +-
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   |  2 +-
 66 files changed, 78 insertions(+), 112 deletions(-)

diff --git a/package/x11r7/xlib_libFS/Config.in b/package/x11r7/xlib_libFS/Config.in
index 0c8a7290c1..6ff0bcc36e 100644
--- a/package/x11r7/xlib_libFS/Config.in
+++ b/package/x11r7/xlib_libFS/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBFS
 	bool "libFS"
 	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org FS library
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index a3c58b90d9..56f2dc3cba 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -10,7 +10,7 @@ XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFS_LICENSE = MIT
 XLIB_LIBFS_LICENSE_FILES = COPYING
 XLIB_LIBFS_INSTALL_STAGING = YES
-XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto host-pkgconf
+XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xorgproto host-pkgconf
 XLIB_LIBFS_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libICE/Config.in b/package/x11r7/xlib_libICE/Config.in
index d63f935602..ccdd400396 100644
--- a/package/x11r7/xlib_libICE/Config.in
+++ b/package/x11r7/xlib_libICE/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBICE
 	bool "libICE"
 	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org ICE library
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index e2a4e7d387..982e8fdef1 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -10,6 +10,6 @@ XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_LICENSE = MIT
 XLIB_LIBICE_LICENSE_FILES = COPYING
 XLIB_LIBICE_INSTALL_STAGING = YES
-XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto host-pkgconf
+XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xorgproto host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libSM/Config.in b/package/x11r7/xlib_libSM/Config.in
index ef83b531f8..02ee2bd232 100644
--- a/package/x11r7/xlib_libSM/Config.in
+++ b/package/x11r7/xlib_libSM/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_XLIB_LIBSM
 	bool "libSM"
 	select BR2_PACKAGE_XLIB_LIBICE
 	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org SM library
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 30640bd101..9049cea234 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -10,7 +10,7 @@ XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBSM_LICENSE = MIT
 XLIB_LIBSM_LICENSE_FILES = COPYING
 XLIB_LIBSM_INSTALL_STAGING = YES
-XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
+XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xorgproto
 XLIB_LIBSM_CONF_OPTS = --without-libuuid
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libX11/Config.in b/package/x11r7/xlib_libX11/Config.in
index 3ad8d00ae5..d69c51b91e 100644
--- a/package/x11r7/xlib_libX11/Config.in
+++ b/package/x11r7/xlib_libX11/Config.in
@@ -5,10 +5,6 @@ config BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXDMCP
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org X11 library
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 64344da737..e2266cdfad 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -16,12 +16,8 @@ XLIB_LIBX11_DEPENDENCIES = \
 	xlib_xtrans \
 	xlib_libXau \
 	xlib_libXdmcp \
-	xproto_kbproto \
-	xproto_xproto \
-	xproto_xextproto \
-	xproto_inputproto \
-	xproto_xf86bigfontproto \
-	host-xproto_xproto
+	xorgproto \
+	host-xorgproto
 
 HOST_XLIB_LIBX11_DEPENDENCIES = \
 	host-libxcb \
@@ -29,11 +25,7 @@ HOST_XLIB_LIBX11_DEPENDENCIES = \
 	host-xlib_xtrans \
 	host-xlib_libXau \
 	host-xlib_libXdmcp \
-	host-xproto_kbproto \
-	host-xproto_xproto \
-	host-xproto_xextproto \
-	host-xproto_inputproto \
-	host-xproto_xf86bigfontproto
+	host-xorgproto
 
 XLIB_LIBX11_CONF_OPTS = \
 	--disable-malloc0returnsnull \
diff --git a/package/x11r7/xlib_libXScrnSaver/Config.in b/package/x11r7/xlib_libXScrnSaver/Config.in
index 5df9a00c72..05c96d74cd 100644
--- a/package/x11r7/xlib_libXScrnSaver/Config.in
+++ b/package/x11r7/xlib_libXScrnSaver/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_XLIB_LIBXSCRNSAVER
 	bool "libXScrnSaver"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org XScrnSaver library
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 4c3d36d007..92abb902eb 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -10,7 +10,7 @@ XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSCRNSAVER_LICENSE = MIT
 XLIB_LIBXSCRNSAVER_LICENSE_FILES = COPYING
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
-XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
+XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXSCRNSAVER_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXau/Config.in b/package/x11r7/xlib_libXau/Config.in
index a220f01970..0323faa3ea 100644
--- a/package/x11r7/xlib_libXau/Config.in
+++ b/package/x11r7/xlib_libXau/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXAU
 	bool "libXau"
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  X.Org Xau library
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 1c50cb2e4e..0fc78e7068 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -10,9 +10,9 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_LICENSE = MIT
 XLIB_LIBXAU_LICENSE_FILES = COPYING
 XLIB_LIBXAU_INSTALL_STAGING = YES
-XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xproto_xproto
+XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xorgproto
 HOST_XLIB_LIBXAU_DEPENDENCIES = \
-	host-pkgconf host-xutil_util-macros host-xproto_xproto
+	host-pkgconf host-xutil_util-macros host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXaw/Config.in b/package/x11r7/xlib_libXaw/Config.in
index 3695bb679f..bda4ded26d 100644
--- a/package/x11r7/xlib_libXaw/Config.in
+++ b/package/x11r7/xlib_libXaw/Config.in
@@ -4,6 +4,6 @@ config BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXPM
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xaw library
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index d78adffeda..17d51a9570 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -10,6 +10,6 @@ XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAW_LICENSE = MIT
 XLIB_LIBXAW_LICENSE_FILES = COPYING
 XLIB_LIBXAW_INSTALL_STAGING = YES
-XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto
+XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXcomposite/Config.in b/package/x11r7/xlib_libXcomposite/Config.in
index 14da977af0..b417140aea 100644
--- a/package/x11r7/xlib_libXcomposite/Config.in
+++ b/package/x11r7/xlib_libXcomposite/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	bool "libXcomposite"
-	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xcomposite library
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index f0e59cba1d..e84b52e3fd 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -10,6 +10,6 @@ XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCOMPOSITE_LICENSE = MIT
 XLIB_LIBXCOMPOSITE_LICENSE_FILES = COPYING
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
-XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
+XLIB_LIBXCOMPOSITE_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXfixes xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXcursor/Config.in b/package/x11r7/xlib_libXcursor/Config.in
index 6519cc7667..0c70f95918 100644
--- a/package/x11r7/xlib_libXcursor/Config.in
+++ b/package/x11r7/xlib_libXcursor/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xcursor library
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index b27aa653e9..6ee76039e0 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -10,10 +10,10 @@ XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_LICENSE = MIT
 XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
-XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
+XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xorgproto
 HOST_XLIB_LIBXCURSOR_DEPENDENCIES = \
 	host-xlib_libX11 host-xlib_libXfixes host-xlib_libXrender \
-	host-xproto_xproto
+	host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXdamage/Config.in b/package/x11r7/xlib_libXdamage/Config.in
index 242748663c..d1a07dea9e 100644
--- a/package/x11r7/xlib_libXdamage/Config.in
+++ b/package/x11r7/xlib_libXdamage/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_XLIB_LIBXDAMAGE
 	bool "libXdamage"
-	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xdamage library
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 9f982eef10..d52b4e0e24 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -10,6 +10,6 @@ XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_LICENSE = MIT
 XLIB_LIBXDAMAGE_LICENSE_FILES = COPYING
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
-XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
+XLIB_LIBXDAMAGE_DEPENDENCIES = xlib_libX11 xlib_libXfixes xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXdmcp/Config.in b/package/x11r7/xlib_libXdmcp/Config.in
index 218ff1598b..832822e912 100644
--- a/package/x11r7/xlib_libXdmcp/Config.in
+++ b/package/x11r7/xlib_libXdmcp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXDMCP
 	bool "libXdmcp"
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xdmcp library
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index ec1b861b92..179234e73f 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -10,8 +10,8 @@ XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
 XLIB_LIBXDMCP_LICENSE_FILES = COPYING
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
-XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
-HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
+XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xorgproto
+HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXext/Config.in b/package/x11r7/xlib_libXext/Config.in
index 823a165bf2..58c9ce55ea 100644
--- a/package/x11r7/xlib_libXext/Config.in
+++ b/package/x11r7/xlib_libXext/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXEXT
 	bool "libXext"
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xext library
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 211c85360a..02fee222b6 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -10,7 +10,7 @@ XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
 XLIB_LIBXEXT_LICENSE_FILES = COPYING
 XLIB_LIBXEXT_INSTALL_STAGING = YES
-XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
+XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xorgproto
 XLIB_LIBXEXT_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXfixes/Config.in b/package/x11r7/xlib_libXfixes/Config.in
index 9bbabb2558..2c3b6684f8 100644
--- a/package/x11r7/xlib_libXfixes/Config.in
+++ b/package/x11r7/xlib_libXfixes/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXFIXES
 	bool "libXfixes"
-	select BR2_PACKAGE_XPROTO_FIXESPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xfixes library
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index b7d835bb30..f563ba34ec 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -10,10 +10,9 @@ XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
 XLIB_LIBXFIXES_LICENSE_FILES = COPYING
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
-XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
+XLIB_LIBXFIXES_DEPENDENCIES =  xlib_libX11 xorgproto
 HOST_XLIB_LIBXFIXES_DEPENDENCIES = \
-	host-xproto_fixesproto host-xlib_libX11 host-xproto_xextproto \
-	host-xproto_xproto
+	host-xlib_libX11 host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXfont/Config.in b/package/x11r7/xlib_libXfont/Config.in
index cc1da0ea39..4658027da8 100644
--- a/package/x11r7/xlib_libXfont/Config.in
+++ b/package/x11r7/xlib_libXfont/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBFONTENC
 	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XFONT_ENCODINGS
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xfont library
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 30163eec6f..61b6f99785 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -12,11 +12,11 @@ XLIB_LIBXFONT_LICENSE_FILES = COPYING
 XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
 
-XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontsproto xproto_xproto xfont_encodings
+XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xorgproto
 
 HOST_XLIB_LIBXFONT_DEPENDENCIES = \
 	host-freetype host-xlib_libfontenc host-xlib_xtrans \
-	host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
+	host-xorgproto
 
 XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 HOST_XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
diff --git a/package/x11r7/xlib_libXfont2/Config.in b/package/x11r7/xlib_libXfont2/Config.in
index 6cba46586b..fc2ebfe22c 100644
--- a/package/x11r7/xlib_libXfont2/Config.in
+++ b/package/x11r7/xlib_libXfont2/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBFONTENC
 	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XFONT_ENCODINGS
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xfont library
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index 3f1bdee435..ba2c7540cb 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -14,16 +14,14 @@ XLIB_LIBXFONT2_DEPENDENCIES = \
 	freetype \
 	xlib_libfontenc \
 	xlib_xtrans \
-	xproto_fontsproto \
-	xproto_xproto \
+	xorgproto \
 	xfont_encodings
 
 HOST_XLIB_LIBXFONT2_DEPENDENCIES = \
 	host-freetype \
 	host-xlib_libfontenc \
 	host-xlib_xtrans \
-	host-xproto_fontsproto \
-	host-xproto_xproto \
+	host-xorgproto \
 	host-xfont_encodings
 
 XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
diff --git a/package/x11r7/xlib_libXft/Config.in b/package/x11r7/xlib_libXft/Config.in
index 6eef170177..84967a55e3 100644
--- a/package/x11r7/xlib_libXft/Config.in
+++ b/package/x11r7/xlib_libXft/Config.in
@@ -5,6 +5,6 @@ config BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xft library
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index de9b47093b..64415cfd30 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -11,6 +11,6 @@ XLIB_LIBXFT_LICENSE = MIT
 XLIB_LIBXFT_LICENSE_FILES = COPYING
 XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
-XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
+XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXi/Config.in b/package/x11r7/xlib_libXi/Config.in
index 3ae22d6305..3131306902 100644
--- a/package/x11r7/xlib_libXi/Config.in
+++ b/package/x11r7/xlib_libXi/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXI
 	bool "libXi"
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xi library
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index d593c1e95a..2833738911 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -12,11 +12,10 @@ XLIB_LIBXI_LICENSE_FILES = COPYING
 XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = \
 	host-pkgconf \
-	xproto_inputproto \
-	xproto_xproto \
 	xlib_libX11 \
 	xlib_libXext \
-	xlib_libXfixes
+	xlib_libXfixes \
+	xorgproto
 
 XLIB_LIBXI_CONF_OPTS = --disable-malloc0returnsnull
 
diff --git a/package/x11r7/xlib_libXinerama/Config.in b/package/x11r7/xlib_libXinerama/Config.in
index 5a79b4eb76..f8ea959537 100644
--- a/package/x11r7/xlib_libXinerama/Config.in
+++ b/package/x11r7/xlib_libXinerama/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_XLIB_LIBXINERAMA
 	bool "libXinerama"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xinerama library
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 3c2a505bc8..405faefa46 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -10,7 +10,7 @@ XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_LICENSE = MIT
 XLIB_LIBXINERAMA_LICENSE_FILES = COPYING
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
-XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
+XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXINERAMA_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXmu/Config.in b/package/x11r7/xlib_libXmu/Config.in
index ed239dc11c..b588920835 100644
--- a/package/x11r7/xlib_libXmu/Config.in
+++ b/package/x11r7/xlib_libXmu/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xmu library
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index 261f871387..b3f3db3e5d 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -10,6 +10,6 @@ XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXMU_LICENSE = MIT
 XLIB_LIBXMU_LICENSE_FILES = COPYING
 XLIB_LIBXMU_INSTALL_STAGING = YES
-XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
+XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXpm/Config.in b/package/x11r7/xlib_libXpm/Config.in
index 528498cb43..9a15d77d8c 100644
--- a/package/x11r7/xlib_libXpm/Config.in
+++ b/package/x11r7/xlib_libXpm/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_XLIB_LIBXPM
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xpm library
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 09f897ea09..7e11c4b5aa 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -12,7 +12,7 @@ XLIB_LIBXPM_LICENSE_FILES = COPYING
 XLIB_LIBXPM_INSTALL_STAGING = YES
 # we patch configure.ac
 XLIB_LIBXPM_AUTORECONF = YES
-XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
+XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(TARGET_NLS_DEPENDENCIES)
 
diff --git a/package/x11r7/xlib_libXrandr/Config.in b/package/x11r7/xlib_libXrandr/Config.in
index 3b3ebd5790..e019ca5ef8 100644
--- a/package/x11r7/xlib_libXrandr/Config.in
+++ b/package/x11r7/xlib_libXrandr/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXRANDR
 	bool "libXrandr"
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xrandr library
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 0fd298c50d..1bfd78f73d 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -10,7 +10,7 @@ XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
 XLIB_LIBXRANDR_LICENSE_FILES = COPYING
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
-XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
+XLIB_LIBXRANDR_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXrender xorgproto
 XLIB_LIBXRANDR_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXrender/Config.in b/package/x11r7/xlib_libXrender/Config.in
index c723e4df46..4487ef1faa 100644
--- a/package/x11r7/xlib_libXrender/Config.in
+++ b/package/x11r7/xlib_libXrender/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXRENDER
 	bool "libXrender"
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xrender library
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 6134c45386..870f94386e 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -10,9 +10,9 @@ XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRENDER_LICENSE = MIT
 XLIB_LIBXRENDER_LICENSE_FILES = COPYING
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
-XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
+XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xorgproto
 HOST_XLIB_LIBXRENDER_DEPENDENCIES = \
-	host-xlib_libX11 host-xproto_renderproto host-xproto_xproto
+	host-xlib_libX11 host-xorgproto
 
 XLIB_LIBXRENDER_CONF_OPTS = --disable-malloc0returnsnull
 
diff --git a/package/x11r7/xlib_libXres/Config.in b/package/x11r7/xlib_libXres/Config.in
index 39abbbfd33..4e135ed3aa 100644
--- a/package/x11r7/xlib_libXres/Config.in
+++ b/package/x11r7/xlib_libXres/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XLIB_LIBXRES
 	bool "libXres"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org XRes library
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 0075e8f60b..72f2ec4424 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -10,7 +10,7 @@ XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
 XLIB_LIBXRES_LICENSE_FILES = COPYING
 XLIB_LIBXRES_INSTALL_STAGING = YES
-XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
+XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXRES_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXt/Config.in b/package/x11r7/xlib_libXt/Config.in
index 6557e20bcd..0f55780886 100644
--- a/package/x11r7/xlib_libXt/Config.in
+++ b/package/x11r7/xlib_libXt/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_XLIB_LIBXT
 	bool "libXt"
 	select BR2_PACKAGE_XLIB_LIBSM
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_XCB_PROTO
 	select BR2_PACKAGE_LIBXCB
 	help
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 4715ac642f..946fd517a7 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -10,7 +10,7 @@ XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_LICENSE = MIT
 XLIB_LIBXT_LICENSE_FILES = COPYING
 XLIB_LIBXT_INSTALL_STAGING = YES
-XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
+XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xorgproto xcb-proto libxcb host-xorgproto
 XLIB_LIBXT_CONF_OPTS = --disable-malloc0returnsnull --disable-install-makestrs
 XLIB_LIBXT_AUTORECONF = YES
 
diff --git a/package/x11r7/xlib_libXtst/Config.in b/package/x11r7/xlib_libXtst/Config.in
index 8853bde8d4..2c7db22468 100644
--- a/package/x11r7/xlib_libXtst/Config.in
+++ b/package/x11r7/xlib_libXtst/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_RECORDPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xtst library
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index d71290ae40..e0d7e8217c 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -15,6 +15,6 @@ XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libX11 \
 	xlib_libXext \
 	xlib_libXi \
-	xproto_recordproto
+	xorgproto
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXv/Config.in b/package/x11r7/xlib_libXv/Config.in
index 90f07f34be..d3e57445a3 100644
--- a/package/x11r7/xlib_libXv/Config.in
+++ b/package/x11r7/xlib_libXv/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XLIB_LIBXV
 	bool "libXv"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xv library
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 0e02439fa8..0ff99b9380 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -10,7 +10,7 @@ XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_LICENSE = ISC-like
 XLIB_LIBXV_LICENSE_FILES = COPYING
 XLIB_LIBXV_INSTALL_STAGING = YES
-XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
+XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXV_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXvMC/Config.in b/package/x11r7/xlib_libXvMC/Config.in
index 90c0e74e45..5cc6ec766a 100644
--- a/package/x11r7/xlib_libXvMC/Config.in
+++ b/package/x11r7/xlib_libXvMC/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_XLIB_LIBXVMC
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXV
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org XvMC library
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index cb39c29f21..c970182fe5 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -10,7 +10,7 @@ XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
 XLIB_LIBXVMC_INSTALL_STAGING = YES
-XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
+XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xorgproto
 XLIB_LIBXVMC_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXxf86dga/Config.in b/package/x11r7/xlib_libXxf86dga/Config.in
index 8276b7178f..918ea0f150 100644
--- a/package/x11r7/xlib_libXxf86dga/Config.in
+++ b/package/x11r7/xlib_libXxf86dga/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_XLIB_LIBXXF86DGA
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xxf86dga library
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index eea756bdb2..59ebd2b413 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -10,7 +10,7 @@ XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_LICENSE = MIT
 XLIB_LIBXXF86DGA_LICENSE_FILES = COPYING
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
-XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
+XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXXF86DGA_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXxf86vm/Config.in b/package/x11r7/xlib_libXxf86vm/Config.in
index 9e32188ec8..c3b11f4218 100644
--- a/package/x11r7/xlib_libXxf86vm/Config.in
+++ b/package/x11r7/xlib_libXxf86vm/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XLIB_LIBXXF86VM
 	bool "libXxf86vm"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xxf86vm library
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index f650fe4e2a..2106451c74 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -10,7 +10,7 @@ XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86VM_LICENSE = MIT
 XLIB_LIBXXF86VM_LICENSE_FILES = COPYING
 XLIB_LIBXXF86VM_INSTALL_STAGING = YES
-XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
+XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXXF86VM_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libdmx/Config.in b/package/x11r7/xlib_libdmx/Config.in
index 879f6895c3..99cddb638a 100644
--- a/package/x11r7/xlib_libdmx/Config.in
+++ b/package/x11r7/xlib_libdmx/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_XLIB_LIBDMX
 	bool "libdmx"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_DMXPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org dmx library
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 01ff493201..c67593e9a4 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -10,7 +10,7 @@ XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBDMX_LICENSE = MIT
 XLIB_LIBDMX_LICENSE_FILES = COPYING
 XLIB_LIBDMX_INSTALL_STAGING = YES
-XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
+XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBDMX_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libfontenc/Config.in b/package/x11r7/xlib_libfontenc/Config.in
index d25e96a5a5..38cb8333c0 100644
--- a/package/x11r7/xlib_libfontenc/Config.in
+++ b/package/x11r7/xlib_libfontenc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBFONTENC
 	bool "libfontenc"
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_ZLIB
 	help
 	  X.Org fontenc library
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index e2c4c6e8d9..526aea9fe5 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -10,8 +10,8 @@ XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_LICENSE = MIT
 XLIB_LIBFONTENC_LICENSE_FILES = COPYING
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
-XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
-HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xproto_xproto
+XLIB_LIBFONTENC_DEPENDENCIES = zlib xorgproto
+HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libxkbfile/Config.in b/package/x11r7/xlib_libxkbfile/Config.in
index ccd35fa10f..0d7e466005 100644
--- a/package/x11r7/xlib_libxkbfile/Config.in
+++ b/package/x11r7/xlib_libxkbfile/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXKBFILE
 	bool "libxkbfile"
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_KBPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org xkbfile library
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index c69d73118f..97755fae84 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -10,8 +10,8 @@ XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_LICENSE = MIT
 XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
-XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
-HOST_XLIB_LIBXKBFILE_DEPENDENCIES = host-xlib_libX11 host-xproto_kbproto
+XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xorgproto
+HOST_XLIB_LIBXKBFILE_DEPENDENCIES = host-xlib_libX11 host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
index d4e87b3e81..710476b357 100644
--- a/package/x11r7/xlib_libxshmfence/Config.in
+++ b/package/x11r7/xlib_libxshmfence/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	bool "libxshmfence"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org shmfence library
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index f51cf0d5cb..f395ebe172 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -10,7 +10,7 @@ XLIB_LIBXSHMFENCE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSHMFENCE_LICENSE = MIT
 XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
 XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
-XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xproto_xproto
+XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xorgproto
 
 # 0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch
 XLIB_LIBXSHMFENCE_AUTORECONF = YES
-- 
2.18.0
