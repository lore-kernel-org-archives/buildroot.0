From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:03 +0200
Subject: [Buildroot] [git commit] package/libgtk2: enable
 gobject-introspection support
Message-ID: <20200406202227.44C268D32F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68fbfa2fcadff58d495e9dbde4e47c8537928bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgtk2/libgtk2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 710e6e47db..9b7d39a532 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -35,6 +35,13 @@ LIBGTK2_CONF_OPTS += \
 LIBGTK2_DEPENDENCIES += \
 	fontconfig xlib_libX11 xlib_libXext xlib_libXrender
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGTK2_CONF_OPTS += --enable-introspection
+LIBGTK2_DEPENDENCIES += gobject-introspection
+else
+LIBGTK2_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 LIBGTK2_CONF_OPTS += --enable-xinerama
 LIBGTK2_DEPENDENCIES += xlib_libXinerama
