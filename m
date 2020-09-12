From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Sep 2020 19:23:58 +0200
Subject: [Buildroot] [PATCH v2,1/3] package/cairo: enable gobject for host
Message-ID: <20200912172400.327527-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gobject is needed for host-librsvg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cairo/cairo.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index c6a3dad932..1d1ab108ef 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -41,7 +41,7 @@ HOST_CAIRO_CONF_OPTS = \
 	--enable-interpreter=no \
 	--disable-directfb \
 	--enable-ft \
-	--disable-gobject \
+	--enable-gobject \
 	--disable-glesv2 \
 	--disable-vg \
 	--disable-xlib \
@@ -58,6 +58,7 @@ HOST_CAIRO_CONF_OPTS = \
 HOST_CAIRO_DEPENDENCIES = \
 	host-freetype \
 	host-fontconfig \
+	host-libglib2 \
 	host-libpng \
 	host-pixman \
 	host-pkgconf
-- 
2.28.0
