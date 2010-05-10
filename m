From: Paul Jones <Paul.Jones@iwtech.com.au>
Date: Mon, 10 May 2010 15:02:42 +1000
Subject: [Buildroot] [PATCH] Bump xvkbd to 3.2
Message-ID: <3B941116898CDA489B91563DEF88F4B620339A@iwt-server.iwt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


And fix dependencies while we're at it.

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 package/xvkbd/Config.in |    1 +
 package/xvkbd/xvkbd.mk  |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in index
888367a..8a4b847 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XVKBD
 	bool "xvkbd"
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  on-screen keyboard for X
 
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk index
8f02021..b7da396 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -3,7 +3,7 @@
 # xvkbd
 #
 #############################################################
-XVKBD_VERSION = 2.8
+XVKBD_VERSION = 3.2
 XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz  XVKBD_SITE =
http://homepage3.nifty.com/tsato/xvkbd
 XVKBD_AUTORECONF = NO
@@ -15,7 +15,7 @@ XVKBD_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX)
LD=$(TARGET_CC) \
 
 XVKBD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XVKBD_DEPENDENCIES = xserver_xorg-server
+XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package,xvkbd))
 
--
1.6.4.4
