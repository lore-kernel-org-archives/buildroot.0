From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:04 +0200
Subject: [Buildroot] [PATCH 084/100] xscreensaver: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-85-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xscreensaver/Config.in       | 1 -
 package/xscreensaver/xscreensaver.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 5213ce3..032eab2 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_XSCREENSAVER
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  XScreenSaver is the standard screen saver collection shipped on most
 	  Linux and Unix systems running the X11 Window System.
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 77c37a9..34b1163 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -12,7 +12,7 @@ XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 
 XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) host-intltool
+	$(TARGET_NLS_DEPENDENCIES) host-intltool
 
 # otherwise we end up with host include/library dirs passed to the
 # compiler/linker
-- 
2.9.4
