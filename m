From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Sep 2014 12:08:06 +0200
Subject: [Buildroot] [PATCH] xdriver_xf86-video-ast: Bump version to 1.0.1,
	add dependencies
In-Reply-To: <1410084487-6023-1-git-send-email-bernd.kuhls@t-online.de>
References: <1410084487-6023-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1410084487-6023-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ast/Config.in                 |    2 ++
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk |    3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-ast/Config.in b/package/x11r7/xdriver_xf86-video-ast/Config.in
index b2a0bc8..5dfe95e 100644
--- a/package/x11r7/xdriver_xf86-video-ast/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ast/Config.in
@@ -1,4 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST
 	bool "xf86-video-ast"
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  No description available
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index a212375..d040ccd 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AST_VERSION = 0.99.9
+XDRIVER_XF86_VIDEO_AST_VERSION = 1.0.1
 XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AST_LICENSE = MIT
 XDRIVER_XF86_VIDEO_AST_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_AST_DEPENDENCIES = xproto_fontsproto xproto_xproto xserver_xorg-server
 
 $(eval $(autotools-package))
-- 
1.7.10.4
