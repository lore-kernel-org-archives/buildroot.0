From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:49 +0100
Subject: [Buildroot] [PATCH 009/120] xproto_fontcacheproto: removed in
	X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-10-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/Config.in                                  |    1 -
 package/x11r7/xproto_fontcacheproto/Config.in            |    4 ----
 .../x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk |   14 --------------
 3 files changed, 19 deletions(-)
 delete mode 100644 package/x11r7/xproto_fontcacheproto/Config.in
 delete mode 100644 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 62c54df..10ed29c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -229,7 +229,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_dmxproto/Config.in
 		source package/x11r7/xproto_dri2proto/Config.in
 		source package/x11r7/xproto_fixesproto/Config.in
-		source package/x11r7/xproto_fontcacheproto/Config.in
 		source package/x11r7/xproto_fontsproto/Config.in
 		source package/x11r7/xproto_glproto/Config.in
 		source package/x11r7/xproto_inputproto/Config.in
diff --git a/package/x11r7/xproto_fontcacheproto/Config.in b/package/x11r7/xproto_fontcacheproto/Config.in
deleted file mode 100644
index daa6c7f..0000000
--- a/package/x11r7/xproto_fontcacheproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_FONTCACHEPROTO
-	bool "fontcacheproto"
-	help
-	  X.Org Fontcache protocol headers
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
deleted file mode 100644
index 97af75a..0000000
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_fontcacheproto -- X.Org Fontcache protocol headers
-#
-################################################################################
-
-XPROTO_FONTCACHEPROTO_VERSION = 0.1.3
-XPROTO_FONTCACHEPROTO_SOURCE = fontcacheproto-$(XPROTO_FONTCACHEPROTO_VERSION).tar.bz2
-XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
-XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
1.7.10.4
