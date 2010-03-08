From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete xphelloworld
Message-ID: <20100308133702.0F159776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed81e387ff9fe67c79cf6e1d2463a4e971b8cc21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xapp_xphelloworld/Config.in          |    9 ---------
 .../x11r7/xapp_xphelloworld/xapp_xphelloworld.mk   |   13 -------------
 3 files changed, 0 insertions(+), 23 deletions(-)
 delete mode 100644 package/x11r7/xapp_xphelloworld/Config.in
 delete mode 100644 package/x11r7/xapp_xphelloworld/xapp_xphelloworld.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 21d2003..84519ff 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -156,7 +156,6 @@ endmenu
 		source package/x11r7/xapp_xmh/Config.in
 		source package/x11r7/xapp_xmodmap/Config.in
 		source package/x11r7/xapp_xmore/Config.in
-		source package/x11r7/xapp_xphelloworld/Config.in
 		source package/x11r7/xapp_xplsprinters/Config.in
 		source package/x11r7/xapp_xpr/Config.in
 		source package/x11r7/xapp_xprehashprinterlist/Config.in
diff --git a/package/x11r7/xapp_xphelloworld/Config.in b/package/x11r7/xapp_xphelloworld/Config.in
deleted file mode 100644
index 843b41b..0000000
--- a/package/x11r7/xapp_xphelloworld/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XAPP_XPHELLOWORLD
-	bool "xphelloworld"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  xphelloworld 1.0.1
-	  X.Org xphelloworld application
diff --git a/package/x11r7/xapp_xphelloworld/xapp_xphelloworld.mk b/package/x11r7/xapp_xphelloworld/xapp_xphelloworld.mk
deleted file mode 100644
index fe44a8b..0000000
--- a/package/x11r7/xapp_xphelloworld/xapp_xphelloworld.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xphelloworld -- X.Org xphelloworld application
-#
-################################################################################
-
-XAPP_XPHELLOWORLD_VERSION = 1.0.1
-XAPP_XPHELLOWORLD_SOURCE = xphelloworld-$(XAPP_XPHELLOWORLD_VERSION).tar.bz2
-XAPP_XPHELLOWORLD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPHELLOWORLD_AUTORECONF = NO
-XAPP_XPHELLOWORLD_DEPENDENCIES = xlib_libXaw xlib_libXprintAppUtil xlib_libXprintUtil xlib_libXt
-
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xphelloworld))
-- 
1.6.3.3
