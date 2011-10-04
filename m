From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 4 Oct 2011 11:47:52 -0500
Subject: [Buildroot] [PATCH v2] Rename package/libsigc to
	package/libsigc2
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DC56AC8@AUSP01VMBX24.collaborationhost.net>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56AC8@AUSP01VMBX24.collaborationhost.net>
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC56DCC@AUSP01VMBX24.collaborationhost.net>
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
diff --git a/package/libsigc/Config.in b/package/libsigc2/Config.in
similarity index 89%
rename from package/libsigc/Config.in
rename to package/libsigc2/Config.in
index 93fa3f4..433d0b7 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc2/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_LIBSIGC
-	bool "libsigc++"
+config BR2_PACKAGE_LIBSIGC2
+	bool "libsigc++ 2.2"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libsigc++ implements a typesafe callback system for standard C++.
diff --git a/package/libsigc2/libsigc2.mk b/package/libsigc2/libsigc2.mk
new file mode 100644
index 0000000..036ac6a
--- /dev/null
+++ b/package/libsigc2/libsigc2.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libsigc++ 2.2
+#
+#############################################################
+LIBSIGC2_VERSION = 2.2.8
+LIBSIGC2_SOURCE = libsigc++-$(LIBSIGC2_VERSION).tar.bz2
+LIBSIGC2_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
+LIBSIGC2_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
