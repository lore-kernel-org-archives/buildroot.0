From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Apr 2012 21:08:58 +0200
Subject: [Buildroot] [git commit] gdk-pixbuf: cleanup
Message-ID: <20120414192947.DC37A96ABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d4d2086351c1e85ad3571380511640426a40206
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need for empty line before help text, and AUTOTARGETS handle
--disable-largefile.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdk-pixbuf/Config.in     |    1 -
 package/gdk-pixbuf/gdk-pixbuf.mk |    4 ----
 2 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 8b9cc3f..28a0f12 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
-
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
 	  and the GLib, to integrate well with GNOME applications.
 
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index de80706..8dc1c47 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -16,10 +16,6 @@ GDK_PIXBUF_CONF_ENV = \
 
 GDK_PIXBUF_CONF_OPT = --disable-glibtest
 
-ifneq ($(BR2_LARGEFILE),y)
-GDK_PIXBUF_CONF_OPT += --disable-largefile
-endif
-
 ifneq ($(BR2_PACKAGE_LIBPNG),y)
 GDK_PIXBUF_CONF_OPT += --without-libpng
 else
