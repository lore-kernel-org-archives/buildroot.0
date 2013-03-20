From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:04 +0100
Subject: [Buildroot] [git commit] xproto_xf86rushproto: removed in X11R7.7
Message-ID: <20130324225201.742F39A9F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e31f61dcfdc031abe7ac1bc62cf5a94c39c76c9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xproto_xf86rushproto/Config.in       |    4 ----
 .../xproto_xf86rushproto/xproto_xf86rushproto.mk   |   13 -------------
 3 files changed, 0 insertions(+), 18 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 57b16ed..73803a8 100644
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
