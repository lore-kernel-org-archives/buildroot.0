From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Sep 2012 21:27:13 +0200
Subject: [Buildroot] [git commit] xlsclient: unbreak build
Message-ID: <20120923193051.55A0E99649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90f908f21e4f7b1b7dd0c4c44515db67f441dcc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/4cb357a99de9e2c2940fbdfccb314aaef5891b6b

xlsclient nowadays needs libxcb and xcb-util, and update to 1.1.1, as
1.1.0 tarball was missing strnlen.h.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xlsclients/Config.in          |    2 ++
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xlsclients/Config.in b/package/x11r7/xapp_xlsclients/Config.in
index f8f6132..a934af4 100644
--- a/package/x11r7/xapp_xlsclients/Config.in
+++ b/package/x11r7/xapp_xlsclients/Config.in
@@ -2,5 +2,7 @@ config BR2_PACKAGE_XAPP_XLSCLIENTS
 	bool "xlsclients"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL
 	help
 	  X.Org xlsclients application
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 28ca4ee..259fab5 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLSCLIENTS_VERSION = 1.1.0
+XAPP_XLSCLIENTS_VERSION = 1.1.1
 XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu
+XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu libxcb xcb-util
 
 $(eval $(autotools-package))
