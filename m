From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:43 +0200
Subject: [Buildroot] [PATCH 20/30] libglu: new package
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <2bd14ca42a43cb609b85d87348444b780dabe98a.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in        |  1 +
 package/libglu/Config.in | 10 ++++++++++
 package/libglu/libglu.mk | 17 +++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/libglu/Config.in
 create mode 100644 package/libglu/libglu.mk

diff --git a/package/Config.in b/package/Config.in
index 4115002..b31e7a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -590,6 +590,7 @@ source "package/libexif/Config.in"
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
index 0000000..038d281
--- /dev/null
+++ b/package/libglu/libglu.mk
@@ -0,0 +1,17 @@
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
+# upstream does not distribute a autoconf?ed configure script
+LIBGLU_AUTORECONF = YES
+LIBGLU_DEPENDENCIES = libgl
+
+$(eval $(autotools-package))
-- 
1.8.3.2
