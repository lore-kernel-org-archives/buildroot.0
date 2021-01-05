From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  5 Jan 2021 08:51:05 +0100
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.24
Message-ID: <20210105075105.874876-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/0001-no-gtk-doc.patch              | 2 +-
 package/libgtk3/0002-fix-introspection-check.patch | 2 +-
 package/libgtk3/0003-disable-atk-bridge.patch      | 6 +++---
 package/libgtk3/Config.in                          | 2 +-
 package/libgtk3/libgtk3.hash                       | 6 +++---
 package/libgtk3/libgtk3.mk                         | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/libgtk3/0001-no-gtk-doc.patch b/package/libgtk3/0001-no-gtk-doc.patch
index 6dede7348..db15c6cba 100644
--- a/package/libgtk3/0001-no-gtk-doc.patch
+++ b/package/libgtk3/0001-no-gtk-doc.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/gtk-doc.make
 +++ b/gtk-doc.make
-@@ -267,7 +267,7 @@
+@@ -299,7 +299,7 @@
  #
  # Require gtk-doc when making dist
  #
diff --git a/package/libgtk3/0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
index 4c2806d81..90f5facbb 100644
--- a/package/libgtk3/0002-fix-introspection-check.patch
+++ b/package/libgtk3/0002-fix-introspection-check.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1621,7 +1621,10 @@
+@@ -1685,7 +1685,10 @@
  # GObject introspection
  ##################################################
 
diff --git a/package/libgtk3/0003-disable-atk-bridge.patch b/package/libgtk3/0003-disable-atk-bridge.patch
index c92174f40..42de83b5b 100644
--- a/package/libgtk3/0003-disable-atk-bridge.patch
+++ b/package/libgtk3/0003-disable-atk-bridge.patch
@@ -7,7 +7,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1349,11 +1349,7 @@
+@@ -1364,11 +1364,7 @@
  # Check for Accessibility Toolkit flags
  ########################################
 
@@ -23,7 +23,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 --- a/gtk/a11y/gtkaccessibility.c
 +++ b/gtk/a11y/gtkaccessibility.c
 @@ -37,10 +37,6 @@
- #include <gtk/gtkcombobox.h>
+ #include <gtk/gtktogglebutton.h>
  #include <gtk/gtkaccessible.h>
 
 -#ifdef GDK_WINDOWING_X11
@@ -33,7 +33,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
  static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
                                           guint                  n_param_values,
                                           const GValue          *param_values,
-@@ -987,9 +983,5 @@
+@@ -988,9 +984,5 @@
    _gtk_accessibility_override_atk_util ();
    do_window_event_initialization ();
 
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 8a59fc31e..093aacac5 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_LIBGTK3
 	help
 	  The GTK+ version 3 graphical user interface library
 
-	  http://www.gtk.org/
+	  https://www.gtk.org/
 
 if BR2_PACKAGE_LIBGTK3
 
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index dd902624c..22cf16dad 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.24/gtk+-3.24.12.sha256sum
-sha256 1384eba5614fed160044ae0d32369e3df7b4f517b03f4b1f24d383e528f4be83  gtk+-3.24.12.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.24.sha256sum
+sha256  cc9d4367c55b724832f6b09ab85481738ea456871f0381768a6a99335a98378a  gtk+-3.24.24.tar.xz
 
 # Hash for license file:
-sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index dbb975dbf..f7345cf2e 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).12
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).24
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.27.0
