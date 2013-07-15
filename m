From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon, 15 Jul 2013 21:52:38 +0200
Subject: [Buildroot] [PATCH] package/libsvg-cairo: new package
Message-ID: <1373917958-838-1-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Libsvg-cairo provides the ability to render SVG content from files or
buffers. All rendering is performed using the cairo rendering library.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/Config.in                    |    1 +
 package/libsvg-cairo/Config.in       |   11 +++++++++++
 package/libsvg-cairo/libsvg-cairo.mk |   14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libsvg-cairo/Config.in
 create mode 100644 package/libsvg-cairo/libsvg-cairo.mk

diff --git a/package/Config.in b/package/Config.in
index 6d5ff01..aac31bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -465,6 +465,7 @@ source "package/libqrencode/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvg/Config.in"
+source "package/libsvg-cairo/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/opencv/Config.in"
diff --git a/package/libsvg-cairo/Config.in b/package/libsvg-cairo/Config.in
new file mode 100644
index 0000000..9577c69
--- /dev/null
+++ b/package/libsvg-cairo/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSVG_CAIRO
+	bool "libsvg-cairo"
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_SVG
+	select BR2_PACKAGE_LIBSVG
+	help
+	  Libsvg-cairo provides the ability to render SVG content from
+	  files or buffers. All rendering is performed using the cairo
+	  rendering library.
+
+	  http://cairographics.org
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
new file mode 100644
index 0000000..a41e859
--- /dev/null
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libsvg-cairo
+#
+################################################################################
+
+LIBSVG_CAIRO_VERSION         = 0.1.6
+LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots/
+LIBSVG_CAIRO_DEPENDENCIES    = cairo libsvg
+LIBSVG_CAIRO_INSTALL_STAGING = YES
+LIBSVG_CAIRO_LICENSE         = LGPLv2+
+LIBSVG_CAIRO_LICENSE_FILES   = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
