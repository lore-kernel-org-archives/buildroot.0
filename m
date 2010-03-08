From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete
	xproxymanagementprotocol
Message-ID: <20100308133622.18579776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4c73f103b0b8c8d6c3efbebf7dc262217d4611c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                            |    1 -
 .../xproto_xproxymanagementprotocol/Config.in      |    5 -----
 .../xproto_xproxymanagementprotocol.mk             |   14 --------------
 3 files changed, 0 insertions(+), 20 deletions(-)
 delete mode 100644 package/x11r7/xproto_xproxymanagementprotocol/Config.in
 delete mode 100644 package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index e9c868b..68c6f54 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -313,7 +313,6 @@ endmenu
 		source package/x11r7/xproto_xf86vidmodeproto/Config.in
 		source package/x11r7/xproto_xineramaproto/Config.in
 		source package/x11r7/xproto_xproto/Config.in
-		source package/x11r7/xproto_xproxymanagementprotocol/Config.in
 	endmenu
 	menu "X11R7 Utilities"
 		source package/x11r7/xutil_makedepend/Config.in
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/Config.in b/package/x11r7/xproto_xproxymanagementprotocol/Config.in
deleted file mode 100644
index 885a70b..0000000
--- a/package/x11r7/xproto_xproxymanagementprotocol/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
-	bool "xproxymanagementprotocol"
-	help
-	  xproxymanagementprotocol 1.0.2
-	  X.Org PM protocol headers
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
deleted file mode 100644
index 202278c..0000000
--- a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_xproxymanagementprotocol -- X.Org PM protocol headers
-#
-################################################################################
-
-XPROTO_XPROXYMANAGEMENTPROTOCOL_VERSION = 1.0.2
-XPROTO_XPROXYMANAGEMENTPROTOCOL_SOURCE = xproxymanagementprotocol-$(XPROTO_XPROXYMANAGEMENTPROTOCOL_VERSION).tar.bz2
-XPROTO_XPROXYMANAGEMENTPROTOCOL_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XPROXYMANAGEMENTPROTOCOL_AUTORECONF = NO
-XPROTO_XPROXYMANAGEMENTPROTOCOL_INSTALL_STAGING = YES
-XPROTO_XPROXYMANAGEMENTPROTOCOL_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xproxymanagementprotocol))
-- 
1.6.3.3
