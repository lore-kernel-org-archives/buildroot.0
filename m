From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Apr 2014 21:42:59 +0200
Subject: [Buildroot] [PATCH v6 5/8] [v2] libglu: new package
In-Reply-To: <1398627782-1939-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398627782-1939-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1398627782-1939-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: included hints by Thomas
    http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/82058

 package/Config.in        |    1 +
 package/libglu/Config.in |   10 ++++++++++
 package/libglu/libglu.mk |   16 ++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/libglu/Config.in
 create mode 100644 package/libglu/libglu.mk

diff --git a/package/Config.in b/package/Config.in
index 863e3d9..57b4dd7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -589,6 +589,7 @@ source "package/libexif/Config.in"
 source "package/libgail/Config.in"
 source "package/libgeotiff/Config.in"
 source "package/libglade/Config.in"
+source "package/libglu/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
 source "package/libqrencode/Config.in"
diff --git a/package/libglu/Config.in b/package/libglu/Config.in
new file mode 100644
index 0000000..de8e1ef
--- /dev/null
+++ b/package/libglu/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBGLU
+	bool "libglu"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Mesa OpenGL Utility library
+
+	  http://cgit.freedesktop.org/mesa/glu/
+
+comment "libglu needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
new file mode 100644
index 0000000..f4c47a0
--- /dev/null
+++ b/package/libglu/libglu.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libglu
+#
+################################################################################
+
+LIBGLU_VERSION = 9.0.0
+LIBGLU_SITE = http://cgit.freedesktop.org/mesa/glu/snapshot
+LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.gz
+LIBGLU_LICENSE = SGI-B-2.0
+LIBGLU_LICENSE_FILES = include/GL/glu.h
+LIBGLU_INSTALL_STAGING = YES
+LIBGLU_AUTORECONF = YES
+LIBGLU_DEPENDENCIES = libgl
+
+$(eval $(autotools-package))
-- 
1.7.10.4
