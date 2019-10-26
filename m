From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 26 Oct 2019 12:08:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsvg: fix build with NLS
Message-ID: <20191026100851.21720-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9fb04aa7761845a58df14d460b4a7bbf426e19ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librsvg/librsvg.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 4f563ce6db..470910d94c 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -9,10 +9,12 @@ LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).20
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
+LIBRSVG_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
-	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
+	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
+	$(TARGET_NLS_DEPENDENCIES)
 HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango
 LIBRSVG_LICENSE = LGPL-2.0+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
-- 
2.23.0
