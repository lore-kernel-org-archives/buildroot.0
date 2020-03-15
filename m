From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 10:24:54 -0700
Subject: [Buildroot] [PATCH 1/5] package/libsoup: add optional dependency
 for gobject-introspection
Message-ID: <20200315172459.881615-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, explicitly set --with-introspection in
the configure options and add a dependency for gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsoup/libsoup.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 95bd682010..07c9d787bd 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -16,6 +16,13 @@ LIBSOUP_CONF_OPTS = --disable-glibtest --enable-vala=no --with-gssapi=no
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
 	libglib2 libxml2 sqlite host-intltool
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBSOUP_CONF_OPTS += --with-introspection
+LIBSOUP_DEPENDENCIES += gobject-introspection
+else
+LIBSOUP_CONF_OPTS += --without-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
 LIBSOUP_CONF_OPTS += --with-gnome
 else
-- 
2.24.1
