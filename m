From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 3 Oct 2011 12:06:08 -0500
Subject: [Buildroot] [PATCH] Rename package/libsigc to package/libsigc2
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC56AC8@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the libsigc package to libsigc2 so that the older 1.2 version
of libsigc++ can also be added to packages/.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/package/Config.in b/package/Config.in
index 8b9c816..d77c29f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -351,7 +351,7 @@ source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libnspr/Config.in"
 source "package/liboil/Config.in"
-source "package/libsigc/Config.in"
+source "package/libsigc2/Config.in"
 source "package/orc/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
deleted file mode 100644
index 93fa3f4..0000000
--- a/package/libsigc/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LIBSIGC
-	bool "libsigc++"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  libsigc++ implements a typesafe callback system for standard C++.
-	  It allows you to define signals and to connect those signals to
-	  any callback function, either global or a member function,
-	  regardless of whether it is static or virtual.
-
-	  http://libsigc.sourceforge.net/
-
-comment "libsigc++ requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
deleted file mode 100644
index 4c443eb..0000000
--- a/package/libsigc/libsigc.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-#############################################################
-#
-# libsigc++
-#
-#############################################################
-LIBSIGC_VERSION = 2.2.8
-LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
-LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
-LIBSIGC_INSTALL_STAGING = YES
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/libsigc2/Config.in b/package/libsigc2/Config.in
new file mode 100644
index 0000000..cae8da1
--- /dev/null
+++ b/package/libsigc2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBSIGC
+	bool "libsigc++ 2.2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libsigc++ implements a typesafe callback system for standard C++.
+	  It allows you to define signals and to connect those signals to
+	  any callback function, either global or a member function,
+	  regardless of whether it is static or virtual.
+
+	  http://libsigc.sourceforge.net/
+
+comment "libsigc++ requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsigc2/libsigc2.mk b/package/libsigc2/libsigc2.mk
new file mode 100644
index 0000000..72fff07
--- /dev/null
+++ b/package/libsigc2/libsigc2.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libsigc++ 2.2
+#
+#############################################################
+LIBSIGC_VERSION = 2.2.8
+LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
+LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
+LIBSIGC_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
