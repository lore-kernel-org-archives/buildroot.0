From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:52 +0100
Subject: [Buildroot] [PATCH 012/120] xapp_xinit: removed in X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-13-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/Config.in                |    1 -
 package/x11r7/xapp_xinit/Config.in     |   10 ----------
 package/x11r7/xapp_xinit/xapp_xinit.mk |   12 ------------
 3 files changed, 23 deletions(-)
 delete mode 100644 package/x11r7/xapp_xinit/Config.in
 delete mode 100644 package/x11r7/xapp_xinit/xapp_xinit.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index ad59ff5..ad4e4ff 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -102,7 +102,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xgamma/Config.in
 		source package/x11r7/xapp_xgc/Config.in
 		source package/x11r7/xapp_xhost/Config.in
-		source package/x11r7/xapp_xinit/Config.in
 		source package/x11r7/xapp_xinput/Config.in
 		source package/x11r7/xapp_xinput-calibrator/Config.in
 		source package/x11r7/xapp_xkbcomp/Config.in
diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
deleted file mode 100644
index aede5d9..0000000
--- a/package/x11r7/xapp_xinit/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XAPP_XINIT
-	bool "xinit"
-	# Runtime dependency: can't start an X server unless there is one
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
-	# Runtime dependency; mcookie is also in util-linux
-	select BR2_PACKAGE_MCOOKIE if !BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_XAPP_XAUTH
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  X Window System initializer
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
deleted file mode 100644
index fc9218d..0000000
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xinit -- X Window System initializer
-#
-################################################################################
-
-XAPP_XINIT_VERSION = 1.3.2
-XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
-XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
-
-$(eval $(autotools-package))
-- 
1.7.10.4
