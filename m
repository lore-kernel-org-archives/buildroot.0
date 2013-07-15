From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jul 2013 23:11:04 +0200
Subject: [Buildroot] [git commit] package/libsvg-cairo: new package
Message-ID: <20130715211528.C0BA29A34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dba2bef10a9f4bf666d9053f6b3e0d0ecec752c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libsvg-cairo provides the ability to render SVG content from files or
buffers. All rendering is performed using the cairo rendering library.

[Peter: license is LGPLv2.1+]
Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/libsvg-cairo/Config.in       |   11 +++++++++++
 package/libsvg-cairo/libsvg-cairo.mk |   14 ++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

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
index 0000000..a168180
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
+LIBSVG_CAIRO_LICENSE         = LGPLv2.1+
+LIBSVG_CAIRO_LICENSE_FILES   = COPYING
+
+$(eval $(autotools-package))
