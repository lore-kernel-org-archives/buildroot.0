From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:04 +0100
Subject: [Buildroot] [git commit] xapp_xinit: removed in X11R7.7
Message-ID: <20130324225201.C4EE79A9F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96182fac06916e642184da40a1b3589d6aa293dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/x11r7/Config.in                |    1 -
 package/x11r7/xapp_xdm/Config.in       |    1 -
 package/x11r7/xapp_xdm/xapp_xdm.mk     |    2 +-
 package/x11r7/xapp_xinit/Config.in     |   10 ----------
 package/x11r7/xapp_xinit/xapp_xinit.mk |   12 ------------
 5 files changed, 1 insertions(+), 25 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 73803a8..fba49b3 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -103,7 +103,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xgamma/Config.in
 		source package/x11r7/xapp_xgc/Config.in
 		source package/x11r7/xapp_xhost/Config.in
-		source package/x11r7/xapp_xinit/Config.in
 		source package/x11r7/xapp_xinput/Config.in
 		source package/x11r7/xapp_xinput-calibrator/Config.in
 		source package/x11r7/xapp_xkbcomp/Config.in
diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index c962993..477cd77 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XAPP_XDM
 	bool "xdm"
 	# Runtime dependency: can't start an X server unless there is one
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XAPP_XINIT
 	select BR2_PACKAGE_XAPP_SESSREG
 	select BR2_PACKAGE_XAPP_XRDB
 	select BR2_PACKAGE_XLIB_LIBX11
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 16b6aa9..1c74708 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -8,7 +8,7 @@ XAPP_XDM_VERSION = 1.1.11
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
 XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
-XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
+XAPP_XDM_DEPENDENCIES = xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
 XAPP_XDM_CONF_OPT = --with-utmp-file=/var/adm/utmpx \
 		    --with-wtmp-file=/var/adm/wtmpx
 
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
