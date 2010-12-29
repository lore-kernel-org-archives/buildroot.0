From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Dec 2010 15:54:58 +0100
Subject: [Buildroot] [git commit master 1/1] xapp_xlogo: needs libXft and
	pkg-config
Message-ID: <20101229145533.C47BE81F53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=213f15be3d0e1934ce57f1aa58712c78aeddb2a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xlogo/Config.in     |    1 +
 package/x11r7/xapp_xlogo/xapp_xlogo.mk |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xlogo/Config.in b/package/x11r7/xapp_xlogo/Config.in
index 63a15fa..04f779d 100644
--- a/package/x11r7/xapp_xlogo/Config.in
+++ b/package/x11r7/xapp_xlogo/Config.in
@@ -3,5 +3,6 @@ config BR2_PACKAGE_XAPP_XLOGO
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  X Window System logo
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 3550c95..eb35a6d 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -8,6 +8,7 @@ XAPP_XLOGO_VERSION = 1.0.1
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
 XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOGO_AUTORECONF = NO
-XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender
+XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
+			  xlib_libXft host-pkg-config
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xlogo))
-- 
1.7.2.2
