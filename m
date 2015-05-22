From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 07:58:51 +0200
Subject: [Buildroot] [git commit] gdk-pixbuf: fix static build with libtiff
Message-ID: <20150522065628.7856D81E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=435dfee047746fc7fe995d28d32167031fb707b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ce6/ce61d5aaf5dfdda92fcecb08a30b6093926d6f01/
http://autobuild.buildroot.net/results/76b/76b550da06fe547716f089e46d96a1406043268a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 0977d92..eb30215 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -33,7 +33,9 @@ endif
 ifneq ($(BR2_PACKAGE_TIFF),y)
 GDK_PIXBUF_CONF_OPTS += --without-libtiff
 else
-GDK_PIXBUF_DEPENDENCIES += tiff
+GDK_PIXBUF_DEPENDENCIES += tiff host-pkgconf
+GDK_PIXBUF_CONF_ENV += \
+	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs libtiff-4)'
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
