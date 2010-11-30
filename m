From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 29 Nov 2010 18:22:20 -0700
Subject: [Buildroot] [PATCH] Add libsigc++ package
Message-ID: <201011291822.20672.hartleys@visionengravers.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the libsigc++ library.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/package/Config.in b/package/Config.in
index 03e580a..1f6f7c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -322,6 +322,7 @@ source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
 source "package/libglib2/Config.in"
 source "package/liboil/Config.in"
+source "package/libsigc++/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/libsigc++/Config.in b/package/libsigc++/Config.in
new file mode 100644
index 0000000..8ec674c
--- /dev/null
+++ b/package/libsigc++/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBSIGC
+	bool "libsigc++"
+	help
+	  libsigc++ implements a typesafe callback system for standard C++.
+	  It allows you to define signals and to connect those signals to
+	  any callback function, either global or a member function,
+	  regardless of whether it is static or virtual.
+
+	  http://libsigc.sourceforge.net/
diff --git a/package/libsigc++/libsigc.mk b/package/libsigc++/libsigc.mk
new file mode 100644
index 0000000..640c803
--- /dev/null
+++ b/package/libsigc++/libsigc.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libsigc++
+#
+#############################################################
+LIBSIGC_VERSION = 2.2.8
+LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
+LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
+LIBSIGC_LIBTOOL_PATCH = NO
+LIBSIGC_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libsigc))
