From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:41:07 +0100
Subject: [Buildroot] [git commit] cairo: always enable XCB support when X
	backend is enabled
Message-ID: <20130112215437.30798996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5d2f36367f02f8df4deae952ba3fbc8b1b3f2da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cairo depends on xlib_libX11 for its Xlib backend. But xlib_libX11
depends on XCB, so the XCB support can always be built into Cairo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/cairo.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
