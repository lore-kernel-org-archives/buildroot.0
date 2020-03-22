From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 11:16:48 +0100
Subject: [Buildroot] [git commit] package/libsoup: add optional dependency
 for gobject-introspection
Message-ID: <20200322103103.23FAC83D72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22baac54ef5ffaf17f563c86f85bbf031a3a643a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, explicitly set --with-introspection in
the configure options and add a dependency for gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
