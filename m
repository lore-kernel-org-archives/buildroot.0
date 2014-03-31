From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:24 +0200
Subject: [Buildroot] [PATCH 11/16] libglu: new package
In-Reply-To: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396296389-28821-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in        |    1 +
 package/libglu/Config.in |   10 ++++++++++
 package/libglu/libglu.mk |   19 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/libglu/Config.in
 create mode 100644 package/libglu/libglu.mk

diff --git a/package/Config.in b/package/Config.in
index 3550935..3240188 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -584,6 +584,7 @@ source "package/libexif/Config.in"
 source "package/libgail/Config.in"
 source "package/libgeotiff/Config.in"
 source "package/libglade/Config.in"
+source "package/libglu/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
 source "package/libqrencode/Config.in"
diff --git a/package/libglu/Config.in b/package/libglu/Config.in
new file mode 100644
index 0000000..042a0c3
--- /dev/null
+++ b/package/libglu/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBGLU
+	bool "libglu"
+	depends on BR2_PACKAGE_MESA3D
+	help
+	  Mesa OpenGL Utility library
+
+	  http://cgit.freedesktop.org/mesa/glu/
+
+comment "libglu depends on mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
new file mode 100644
index 0000000..3e5aafa
--- /dev/null
+++ b/package/libglu/libglu.mk
@@ -0,0 +1,19 @@
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
+LIBGLU_DEPENDENCIES = mesa3d
+
+LIBGLU_CONF_OPT = \
+	--disable-osmesa
+
+$(eval $(autotools-package))
-- 
1.7.10.4
