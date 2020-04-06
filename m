From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:21 +0200
Subject: [Buildroot] [git commit] package/libgtk3: enable
 gobject-introspection support
Message-ID: <20200406202227.4FC6781D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9dca17bb5be618fbe11c751a93e4beddd0c669b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgtk3/libgtk3.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 7df4426fa6..dbb975dbfd 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -20,7 +20,6 @@ LIBGTK3_CONF_ENV = \
 
 LIBGTK3_CONF_OPTS = \
 	--disable-glibtest \
-	--disable-introspection \
 	--enable-explicit-deps=no
 HOST_LIBGTK3_CONF_OPTS = --disable-introspection
 
@@ -43,6 +42,13 @@ else
 LIBGTK3_CONF_OPTS += --disable-x11-backend
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGTK3_CONF_OPTS += --enable-introspection
+LIBGTK3_DEPENDENCIES += gobject-introspection
+else
+LIBGTK3_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 LIBGTK3_DEPENDENCIES += wayland wayland-protocols libxkbcommon
 LIBGTK3_CONF_OPTS += --enable-wayland-backend
