From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 22:00:16 +0100
Subject: [Buildroot] [git commit] cairo: Build with GLESv2 and VG backends
	if possible
Message-ID: <20131219210657.0CAA99C109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5582d5c707b552ca9a6cf0fa26d4a81b6b9bcd4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cairo/cairo.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 347bb75..aa03a27 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -54,6 +54,20 @@ else
 	CAIRO_CONF_OPT += --disable-directfb
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
+	CAIRO_CONF_OPT += --enable-glesv2
+	CAIRO_DEPENDENCIES += libgles
+else
+	CAIRO_CONF_OPT += --disable-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
+	CAIRO_CONF_OPT += --enable-vg
+	CAIRO_DEPENDENCIES += libopenvg
+else
+	CAIRO_CONF_OPT += --disable-vg
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	CAIRO_CONF_OPT += --enable-xlib --enable-xcb --with-x
 	CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
