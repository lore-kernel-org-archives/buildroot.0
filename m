From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 20:08:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_oclock: bump version to
	1.0.3, add hash
Message-ID: <1429380501-14759-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_oclock/Config.in        |    2 ++
 package/x11r7/xapp_oclock/xapp_oclock.hash |    2 ++
 package/x11r7/xapp_oclock/xapp_oclock.mk   |    4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xapp_oclock/xapp_oclock.hash

diff --git a/package/x11r7/xapp_oclock/Config.in b/package/x11r7/xapp_oclock/Config.in
index 00cd413..d461910 100644
--- a/package/x11r7/xapp_oclock/Config.in
+++ b/package/x11r7/xapp_oclock/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_XAPP_OCLOCK
 	bool "oclock"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XPROTO_KBPROTO
 	help
 	  round X clock
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.hash b/package/x11r7/xapp_oclock/xapp_oclock.hash
new file mode 100644
index 0000000..ad54499
--- /dev/null
+++ b/package/x11r7/xapp_oclock/xapp_oclock.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2012-February/001820.html
+sha256	54f5fb85f5828705683f457e559fb18753332db15ae82da561b0ae5a63915091	oclock-1.0.3.tar.bz2
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index d3949de..18506e0 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XAPP_OCLOCK_VERSION = 1.0.1
+XAPP_OCLOCK_VERSION = 1.0.3
 XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
 XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_OCLOCK_LICENSE = MIT
 XAPP_OCLOCK_LICENSE_FILES = COPYING
-XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
+XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libxkbfile
 
 $(eval $(autotools-package))
-- 
1.7.10.4
