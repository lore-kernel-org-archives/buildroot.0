From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 20:23:31 +0200
Subject: [Buildroot] [git commit branch/next] gdk-pixbuf: build x11 support,
	if appropriate
Message-ID: <20120811183029.6BFEF97168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d27d40b0de526b4d395210067ae36a0513a29a77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If libX11 is available, then gdk-pixbuf can be built with X11 support.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
