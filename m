From: =?iso-8859-1?Q?Thomas_Lorblanch=E8s?= <zlika_ese@hotmail.com>
Date: Wed, 25 Sep 2019 19:27:25 +0000
Subject: [Buildroot] [PATCH 1/1] package/librsvg: optionally build the SVG
 GDK pixbuf plugin
Message-ID: <AM6PR06MB4690B1B7292E982CA63B049E96870@AM6PR06MB4690.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable generation of libpixbufloader-svg.so if gdk-pixbuf is enabled

Signed-off-by: Thomas Lorblanch?s <zlika_ese@hotmail.com>
---
 package/librsvg/librsvg.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 4f563ce6db..746b339bdd 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -9,7 +9,10 @@ LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).20
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
+LIBRSVG_CONF_OPTS = --disable-tools --enable-introspection=no
+ifneq ($(BR2_PACKAGE_GDK_PIXBUF),y)
+LIBRSVG_CONF_OPTS += --disable-pixbuf-loader
+endif
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
 	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
-- 
2.11.0
