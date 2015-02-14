From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 14 Feb 2015 11:16:22 +0100
Subject: [Buildroot] [PATCH] package/mono-gtksharp: new package
Message-ID: <1423908982-23475-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds gtksharp package for mono.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

Changes: I superseeded previous patch to adhere the package naming, so
gtksharp becames mono-gtksharp.

 package/Config.in                      |  5 +++++
 package/mono-gtksharp/Config.in        |  7 +++++++
 package/mono-gtksharp/mono-gtksharp.mk | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/mono-gtksharp/Config.in
 create mode 100644 package/mono-gtksharp/mono-gtksharp.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..fbba20c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -464,6 +464,11 @@ menu "Lua libraries/modules"
 endmenu
 endif
 	source "package/mono/Config.in"
+if BR2_PACKAGE_MONO
+menu "Mono libraries/modules"
+	source "package/mono-gtksharp/Config.in"
+endmenu
+endif
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/mono-gtksharp/Config.in b/package/mono-gtksharp/Config.in
new file mode 100644
index 0000000..b3f16f0
--- /dev/null
+++ b/package/mono-gtksharp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MONO_GTKSHARP
+	bool "gtk#"
+	depends on BR2_PACKAGE_LIBGTK3
+	help
+	  Gtk# is a .NET language binding for the GTK+ toolkit.
+
+	  http://www.mono-project.com/docs/gui/gtksharp/
diff --git a/package/mono-gtksharp/mono-gtksharp.mk b/package/mono-gtksharp/mono-gtksharp.mk
new file mode 100644
index 0000000..58412eb
--- /dev/null
+++ b/package/mono-gtksharp/mono-gtksharp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gtksharp
+#
+################################################################################
+
+MONO_GTKSHARP_VERSION_MAJOR = 2.99
+MONO_GTKSHARP_VERSION = $(MONO_GTKSHARP_VERSION_MAJOR).3
+MONO_GTKSHARP_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP_VERSION_MAJOR)/
+MONO_GTKSHARP_SOURCE = gtk-sharp-$(MONO_GTKSHARP_VERSION).tar.xz
+MONO_GTKSHARP_LICENSE = LGPLv2
+MONO_GTKSHARP_LICENSE_FILES = COPYING
+MONO_GTKSHARP_INSTALL_STAGING = YES
+MONO_GTKSHARP_DEPENDENCIES = mono libgtk3
+
+$(eval $(autotools-package))
-- 
1.9.1
