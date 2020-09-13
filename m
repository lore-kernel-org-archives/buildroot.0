From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:50:34 +0200
Subject: [Buildroot] [git commit] package/cairo: enable gobject for host
Message-ID: <20200913134546.A6F4380FEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=127213e7e9486c03fe8a805bea876b60ec20467e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gobject is needed for host-librsvg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
