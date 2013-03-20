From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xlib_libXp: removed in X11R7.7
Message-ID: <20130324225200.822DA9B21A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cf3a6adc320d8baa9da05d17429b229074bfa43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/x11r7/Config.in                        |    1 -
 package/x11r7/xapp_xdbedizzy/Config.in         |    1 -
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk |    2 +-
 package/x11r7/xapp_xdpyinfo/Config.in          |    1 -
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk   |    2 +-
 package/x11r7/xlib_libXaw/Config.in            |    1 -
 package/x11r7/xlib_libXaw/xlib_libXaw.mk       |    2 +-
 package/x11r7/xlib_libXp/Config.in             |    8 --------
 package/x11r7/xlib_libXp/xlib_libXp.mk         |   14 --------------
 9 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 954bb23..2ae59a4 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -36,7 +36,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXi/Config.in
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
-		source package/x11r7/xlib_libXp/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
diff --git a/package/x11r7/xapp_xdbedizzy/Config.in b/package/x11r7/xapp_xdbedizzy/Config.in
index fc51fee..e4a5960 100644
--- a/package/x11r7/xapp_xdbedizzy/Config.in
+++ b/package/x11r7/xapp_xdbedizzy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XAPP_XDBEDIZZY
 	bool "xdbedizzy"
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXP
 	help
 	  X.Org xdbedizzy application
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index 870d1d7..f5925fc 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -7,6 +7,6 @@
 XAPP_XDBEDIZZY_VERSION = 1.0.2
 XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
 XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp 
+XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
index e6ff686..9b19ad3 100644
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ b/package/x11r7/xapp_xdpyinfo/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_XAPP_XDPYINFO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXI
-	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXXF86DGA
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 47a004b..8c23eb7 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -7,6 +7,6 @@
 XAPP_XDPYINFO_VERSION = 1.3.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
+XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXaw/Config.in b/package/x11r7/xlib_libXaw/Config.in
index 1c10bc0..3695bb6 100644
--- a/package/x11r7/xlib_libXaw/Config.in
+++ b/package/x11r7/xlib_libXaw/Config.in
@@ -5,6 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXPM
 	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XLIB_LIBXP
 	help
 	  X.Org Xaw library
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 1f559c7..5e95ae0 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -8,7 +8,7 @@ XLIB_LIBXAW_VERSION = 1.0.11
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAW_INSTALL_STAGING = YES
-XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
+XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto
 XLIB_LIBXAW_CONF_OPT = --disable-docs
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXp/Config.in b/package/x11r7/xlib_libXp/Config.in
deleted file mode 100644
index 532d8ac..0000000
--- a/package/x11r7/xlib_libXp/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXP
-	bool "libXp"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXAU
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_PRINTPROTO
-	help
-	  X.Org Xp library
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
deleted file mode 100644
index 9b2e4de..0000000
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXp -- X.Org Xp library
-#
-################################################################################
-
-XLIB_LIBXP_VERSION = 1.0.1
-XLIB_LIBXP_SOURCE = libXp-$(XLIB_LIBXP_VERSION).tar.bz2
-XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXP_INSTALL_STAGING = YES
-XLIB_LIBXP_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xproto_printproto
-XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(autotools-package))
