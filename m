From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Jan 2013 19:22:49 +0100
Subject: [Buildroot] [git commit] cairo: add missing dependency on
	xlib_libXext
Message-ID: <20130119182312.F32969A3B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95a5ed51ba1fdfed72739a4c05c57bf3f8d17a90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The X.org backend of Cairo now requires xlib_libXext. See
http://permalink.gmane.org/gmane.comp.lib.cairo/23385.

Fixes:

 http://autobuild.buildroot.org/results/795404665ec74a7ac929fdf8caf1397c9c54d80d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/Config.in |    1 +
 package/cairo/cairo.mk  |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 89bd315..9a177a7 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index ab0615c..83c82c0 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -51,7 +51,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	CAIRO_CONF_OPT += --enable-xlib --enable-xcb --with-x
-	CAIRO_DEPENDENCIES += xlib_libX11
+	CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
 	CAIRO_CONF_OPT += --disable-xlib --disable-xcb --without-x
 endif
