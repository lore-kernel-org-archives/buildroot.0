From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 20:38:35 +0100
Subject: [Buildroot] [git commit] Legacy: order the options
	reverse-chronologically.
Message-ID: <20130205204624.9A50D99365@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cd9121c77d9f052c3e047bd18b319cbda6f54bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes sure that the most interesting ones are at the top.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |   55 +++++++++++++++++++++++++++++------------------------
 1 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 70958c3..90a7b67 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -42,7 +42,36 @@ endif
 
 
 #
-# Legacy options from 2012.08
+# Legacy options since 2012.11
+#
+
+config BR2_PACKAGE_XSERVER_xorg
+	bool "X.org modular server"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+	help
+	  The option has been renamed
+	  BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR.
+
+config BR2_PACKAGE_XSERVER_tinyx
+	bool "KDrive / TinyX server"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	help
+	  The option has been renamed
+	  BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE.
+
+config BR2_PACKAGE_PTHREAD_STUBS
+	bool "pthread-stubs option has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
+	help
+	  For consistency reason, the pthread-stubs package has been
+	  renamed to xlib_libpthread-stubs.
+
+
+#
+# Legacy options since 2012.08
 #
 
 config BR2_PACKAGE_GETTEXT_STATIC
@@ -67,28 +96,4 @@ config BR2_PACKAGE_INPUT_TOOLS_EVTEST
 	help
 	  The evtest program from input-tools is now a separate package.
 
-config BR2_PACKAGE_PTHREAD_STUBS
-	bool "pthread-stubs option has been renamed"
-	select BR2_LEGACY
-	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
-	help
-	  For consistency reason, the pthread-stubs package has been
-	  renamed to xlib_libpthread-stubs.
-
-config BR2_PACKAGE_XSERVER_xorg
-	bool "X.org modular server"
-	select BR2_LEGACY
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
-	help
-	  The option has been renamed
-	  BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR.
-
-config BR2_PACKAGE_XSERVER_tinyx
-	bool "KDrive / TinyX server"
-	select BR2_LEGACY
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
-	help
-	  The option has been renamed
-	  BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE.
-
 endmenu
