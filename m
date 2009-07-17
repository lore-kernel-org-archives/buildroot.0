From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 18:03:11 +0200
Subject: [Buildroot] [PATCH 04/13] xorg: simplify dependencies on X.org
In-Reply-To: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cc76043bd4db8670abd822d46e4a37838dec575d.1247846597.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages used to depend on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7,
but this is useless since BR2_PACKAGE_XORG is a non-existing
configuration option. So, these depencies gets simplified to
BR2_PACKAGE_XORG7 only.

Some others were depending on BR2_PACKAGE_TINYX (which doesn't) exist
or BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tiny ||
BR2_PACKAGE_XSERVER_x11r7. Replace all that mess by a simple
dependency on BR2_PACKAGE_XORG7.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/blackbox/Config.in              |    2 +-
 package/dillo/Config.in                 |    2 +-
 package/docker/Config.in                |    2 +-
 package/fltk/Config.in                  |    2 +-
 package/games/ace_of_penguins/Config.in |    2 +-
 package/libgtk12/Config.in              |    2 +-
 package/libgtk2/Config.in               |    2 +-
 package/metacity/Config.in              |    2 +-
 package/midori/Config.in                |    2 +-
 package/rdesktop/Config.in              |    2 +-
 package/rxvt/Config.in                  |    2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index d6819b4..bf237c5 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Blackbox is a fast, lightweight window manager for the X
diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index f0682d9..5724691 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_DILLO
 	depends on BR2_PACKAGE_LIBGTK12
 	depends on BR2_PACKAGE_ZLIB
 	depends on BR2_PACKAGE_LIBPNG
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7
 	help
 	  Dillo is a small GTK+ based web browser written in C.
 
diff --git a/package/docker/Config.in b/package/docker/Config.in
index 1c89a79..02ef83c 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DOCKER
 	bool "docker"
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  a system tray dock for X
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index 120ee68..b0ffb4e 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FLTK
 	bool "fltk"
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7
 	help
 	  A cross-platform C++ GUI toolkit for UNIX/Linux (X11),
 	  Microsoft Windows, and MacOS X.
diff --git a/package/games/ace_of_penguins/Config.in b/package/games/ace_of_penguins/Config.in
index 3e1a9db..edbaf26 100644
--- a/package/games/ace_of_penguins/Config.in
+++ b/package/games/ace_of_penguins/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ACE_OF_PENGUINS
 	bool "ace_of_penguins"
 	select BR2_PACKAGE_LIBPNG
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7
 	help
 	  The Ace of Penguins is a set of Unix/X solitaire games based
 	  on the ones available for Windows but with a number of
diff --git a/package/libgtk12/Config.in b/package/libgtk12/Config.in
index e0f643f..01393f9 100644
--- a/package/libgtk12/Config.in
+++ b/package/libgtk12/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBGTK12
 	bool "libgtk12"
 	select BR2_PACKAGE_LIBGLIB12
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
+	depends on BR2_PACKAGE_XORG7
 	help
 	  The GTK+ graphical user interface library
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 19809f2..5c0482d 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_CAIRO_PDF
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX||BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
 	help
 	  The GTK+ version 2 graphical user interface library
 
diff --git a/package/metacity/Config.in b/package/metacity/Config.in
index b552f67..12c54d1 100644
--- a/package/metacity/Config.in
+++ b/package/metacity/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_METACITY
 	bool "metacity"
 	select BR2_PACKAGE_LIBGTK2
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7
 	help
 	  Metacity is a window manager for the X Window System.
diff --git a/package/midori/Config.in b/package/midori/Config.in
index eb960d4..fd1da35 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MIDORI
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7
 	help
 	  Midori is a lightweight web browser based on WebKit
 
diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index 9e0be5c..9ec6f8a 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
 	select BR2_PACKAGE_OPENSSL
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7
 	help
 	  rdesktop is an open source client for Windows NT Terminal
 	  Server and Windows 2000/2003 Terminal Services, capable of
diff --git a/package/rxvt/Config.in b/package/rxvt/Config.in
index 80aa717..f7196e7 100644
--- a/package/rxvt/Config.in
+++ b/package/rxvt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RXVT
 	bool "rxvt"
-	depends on BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx || BR2_PACKAGE_XSERVER_x11r7
+	depends on BR2_PACKAGE_XORG7
 	help
 	  A nice small colour vt102 X terminal emulator.
 
-- 
1.6.0.4
