From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xlib_libXprintUtil: removed in X11R7.7
Message-ID: <20130324225200.557239A9F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c7eb6ca23b6b17357059688b47c150a06310dac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xapp_xdbedizzy/Config.in             |    1 -
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk     |    2 +-
 package/x11r7/xapp_xedit/Config.in                 |    1 -
 package/x11r7/xapp_xedit/xapp_xedit.mk             |    2 +-
 package/x11r7/xapp_xlogo/Config.in                 |    1 -
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |    2 +-
 package/x11r7/xapp_xmore/Config.in                 |    1 -
 package/x11r7/xapp_xmore/xapp_xmore.mk             |    2 +-
 package/x11r7/xlib_libXprintUtil/Config.in         |    8 --------
 .../x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |   13 -------------
 11 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 42ecea3..954bb23 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -38,7 +38,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXmu/Config.in
 		source package/x11r7/xlib_libXp/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
-		source package/x11r7/xlib_libXprintUtil/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
 		source package/x11r7/xlib_libXres/Config.in
diff --git a/package/x11r7/xapp_xdbedizzy/Config.in b/package/x11r7/xapp_xdbedizzy/Config.in
index 5cba398..fc51fee 100644
--- a/package/x11r7/xapp_xdbedizzy/Config.in
+++ b/package/x11r7/xapp_xdbedizzy/Config.in
@@ -2,6 +2,5 @@ config BR2_PACKAGE_XAPP_XDBEDIZZY
 	bool "xdbedizzy"
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXP
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	help
 	  X.Org xdbedizzy application
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index bab2151..870d1d7 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -7,6 +7,6 @@
 XAPP_XDBEDIZZY_VERSION = 1.0.2
 XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
 XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp xlib_libXprintUtil
+XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp 
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
index 98e230d..5a70459 100644
--- a/package/x11r7/xapp_xedit/Config.in
+++ b/package/x11r7/xapp_xedit/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XAPP_XEDIT
 	bool "xedit"
 	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	help
 	  simple text editor for X
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index f69d122..3e26f36 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -7,6 +7,6 @@
 XAPP_XEDIT_VERSION = 1.2.0
 XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XEDIT_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil
+XAPP_XEDIT_DEPENDENCIES = xlib_libXaw 
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlogo/Config.in b/package/x11r7/xapp_xlogo/Config.in
index 04f779d..aacb75f 100644
--- a/package/x11r7/xapp_xlogo/Config.in
+++ b/package/x11r7/xapp_xlogo/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XAPP_XLOGO
 	bool "xlogo"
 	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 674b943..73de828 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -7,7 +7,7 @@
 XAPP_XLOGO_VERSION = 1.0.4
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
 XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
+XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXrender \
 			  xlib_libXft host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmore/Config.in b/package/x11r7/xapp_xmore/Config.in
index 23fd147..80c3950 100644
--- a/package/x11r7/xapp_xmore/Config.in
+++ b/package/x11r7/xapp_xmore/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XAPP_XMORE
 	bool "xmore"
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  plain text display program for the X Window System
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index c77c3dd..e5c54b0 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -7,6 +7,6 @@
 XAPP_XMORE_VERSION = 1.0.1
 XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXaw
+XAPP_XMORE_DEPENDENCIES = xlib_libXaw
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXprintUtil/Config.in b/package/x11r7/xlib_libXprintUtil/Config.in
deleted file mode 100644
index 1f397f4..0000000
--- a/package/x11r7/xlib_libXprintUtil/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	bool "libXprintUtil"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXP
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_PRINTPROTO
-	help
-	  X.Org XprintUtil library
diff --git a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
deleted file mode 100644
index 8e76686..0000000
--- a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libXprintUtil -- X.Org XprintUtil library
-#
-################################################################################
-
-XLIB_LIBXPRINTUTIL_VERSION = 1.0.1
-XLIB_LIBXPRINTUTIL_SOURCE = libXprintUtil-$(XLIB_LIBXPRINTUTIL_VERSION).tar.bz2
-XLIB_LIBXPRINTUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXPRINTUTIL_INSTALL_STAGING = YES
-XLIB_LIBXPRINTUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXt xproto_printproto
-
-$(eval $(autotools-package))
