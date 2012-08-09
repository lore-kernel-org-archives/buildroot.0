From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  9 Aug 2012 12:00:09 +0100
Subject: [Buildroot] [PATCH] gdk-pixbuf: build x11 support, if appropriate
Message-ID: <1344510009-18476-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

If libX11 is available, then gdk-pixbuf can be built with X11 support.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 751f499..0d9e206 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -34,6 +34,11 @@ else
 GDK_PIXBUF_DEPENDENCIES += tiff
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+GDK_PIXBUF_CONF_OPT += --with-x11
+GDK_PIXBUF_DEPENDENCIES += xlib_libX11
+endif
+
 GDK_PIXBUF_DEPENDENCIES += \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
-- 
1.7.9.5
