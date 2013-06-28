From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Fri, 28 Jun 2013 20:52:36 +0200
Subject: [Buildroot] [PATCH 3/4] package/libsvg-cairo: new package
In-Reply-To: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
References: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1372445557-15546-3-git-send-email-c.schoenert@gmail.com>
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
 package/libsvg-cairo/Config.in       |   10 ++++++++++
 package/libsvg-cairo/libsvg-cairo.mk |   15 +++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libsvg-cairo/Config.in
 create mode 100644 package/libsvg-cairo/libsvg-cairo.mk

diff --git a/package/Config.in b/package/Config.in
index 7f5714d..ecf0fea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -462,6 +462,7 @@ source "package/libqrencode/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvg/Config.in"
+source "package/libsvg-cairo/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/opencv/Config.in"
diff --git a/package/libsvg-cairo/Config.in b/package/libsvg-cairo/Config.in
new file mode 100644
index 0000000..2101df3
--- /dev/null
+++ b/package/libsvg-cairo/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBSVG_CAIRO
+	bool "libsvg-cairo"
+	select BR2_PACKAGE_CAIRO_SVG
+	help
+	  Libsvg-cairo provides the ability to render SVG content from
+	  files or buffers. All rendering is performed using the cairo
+	  rendering library.
+
+	  http://www.t2-project.org/packages/libsvg-cairo.html
+
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
new file mode 100644
index 0000000..f10d57f
--- /dev/null
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libsvg-cairo
+#
+################################################################################
+
+LIBSVG_CAIRO_VERSION         = 0.1.6
+LIBSVG_CAIRO_SOURCE          = libsvg-cairo-$(LIBSVG_CAIRO_VERSION).tar.gz
+LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots/
+LIBSVG_CAIRO_DEPENDENCIES    = cairo libsvg
+LIBSVG_CAIRO_INSTALL_STAGING = YES
+LIBSVG_CAIRO_LICENSE         = LGPLv2
+LIBSVG_CAIRO_LICENSE_FILES   = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
