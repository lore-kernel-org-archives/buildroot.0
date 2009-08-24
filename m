From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] webkit: select cairo PNG feature
Message-ID: <20090824202957.C6A5A7774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=26e37dd3c48878ed351092e171840591e2c7e1b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Webkit currently depends on libgtk2, which itself depends on
Cairo. However, the dependency of libgtk2 is only on
BR2_PACKAGE_CAIRO, BR2_PACKAGE_CAIRO_PS and
BR2_PACKAGE_CAIRO_PDF. While this might be enough for libgtk2 to build
and work, Webkit makes direct use of the PNG functionnalities of
Cairo. If this functionnality is not available in Cairo, the Webkit
build complains that cairo_surface_write_to_png_stream() is not
defined.

Therefore, we make sure that WebKit selects BR2_PACKAGE_CAIRO_PNG.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index ecf8694..3c669a5 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ENCHANT
 	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_CAIRO_PNG
 	help
 	  WebKit is an open source, standards compliant web browser engine.
 
-- 
1.6.3.3
