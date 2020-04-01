From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:25 -0700
Subject: [Buildroot] [PATCH 03/12] package/libgtk2: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.25.1
