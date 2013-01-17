From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jan 2013 22:57:30 +0100
Subject: [Buildroot] [PATCH 2/2] cairo: add missing dependency on
	xlib_libXext
In-Reply-To: <1358459850-15495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358459850-15495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358459850-15495-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The X.org backend of Cairo now requires xlib_libXext. See
http://permalink.gmane.org/gmane.comp.lib.cairo/23385.

Fixes:

 http://autobuild.buildroot.org/results/795404665ec74a7ac929fdf8caf1397c9c54d80d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
