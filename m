From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:26 +0100
Subject: [Buildroot] [PATCH 14/28] cairo: always enable XCB support when X
	backend is enabled
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2b49f5dfdca60ca1ef60d3b62e05221ca96285b7.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cairo depends on xlib_libX11 for its Xlib backend. But xlib_libX11
depends on XCB, so the XCB support can always be built into Cairo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 41e876a..6cf910a 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -48,10 +48,10 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	CAIRO_CONF_OPT += --enable-xlib --with-x
+	CAIRO_CONF_OPT += --enable-xlib --enable-xcb --with-x
 	CAIRO_DEPENDENCIES += xlib_libX11
 else
-	CAIRO_CONF_OPT += --disable-xlib --without-x
+	CAIRO_CONF_OPT += --disable-xlib --disable-xcb --without-x
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
-- 
1.7.9.5
