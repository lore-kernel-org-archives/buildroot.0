From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:51 +0100
Subject: [Buildroot] [PATCH 011/120] xproto_xf86rushproto: removed in X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-12-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/Config.in                                   |    1 -
 package/x11r7/xproto_xf86rushproto/Config.in              |    4 ----
 .../x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk    |   13 -------------
 3 files changed, 18 deletions(-)
 delete mode 100644 package/x11r7/xproto_xf86rushproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 6ef9cfe..ad59ff5 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -245,7 +245,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_xf86bigfontproto/Config.in
 		source package/x11r7/xproto_xf86dgaproto/Config.in
 		source package/x11r7/xproto_xf86driproto/Config.in
-		source package/x11r7/xproto_xf86rushproto/Config.in
 		source package/x11r7/xproto_xf86vidmodeproto/Config.in
 		source package/x11r7/xproto_xineramaproto/Config.in
 		source package/x11r7/xproto_xproto/Config.in
diff --git a/package/x11r7/xproto_xf86rushproto/Config.in b/package/x11r7/xproto_xf86rushproto/Config.in
deleted file mode 100644
index 961c31f..0000000
--- a/package/x11r7/xproto_xf86rushproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86RUSHPROTO
-	bool "xf86rushproto"
-	help
-	  X.Org XF86Rush protocol headers
diff --git a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
deleted file mode 100644
index 1609430..0000000
--- a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_xf86rushproto -- X.Org XF86Rush protocol headers
-#
-################################################################################
-
-XPROTO_XF86RUSHPROTO_VERSION = 1.1.2
-XPROTO_XF86RUSHPROTO_SOURCE = xf86rushproto-$(XPROTO_XF86RUSHPROTO_VERSION).tar.bz2
-XPROTO_XF86RUSHPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86RUSHPROTO_INSTALL_STAGING = YES
-XPROTO_XF86RUSHPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-- 
1.7.10.4
