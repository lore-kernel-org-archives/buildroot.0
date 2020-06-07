From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 08:57:06 +0200
Subject: [Buildroot] [git commit branch/trash] package/librsvg: add
 gobject-introspection support
Message-ID: <20200607065638.2756F8453F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7402a7ae7e63b956b6ca2b2f517c1b238f24bb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/trash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/librsvg/librsvg.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 470910d94c..e124fdd5d3 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -10,7 +10,7 @@ LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
+LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
 	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
@@ -19,5 +19,12 @@ HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libgli
 LIBRSVG_LICENSE = LGPL-2.0+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBRSVG_CONF_OPTS += --enable-introspection
+LIBRSVG_DEPENDENCIES += gobject-introspection
+else
+LIBRSVG_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
