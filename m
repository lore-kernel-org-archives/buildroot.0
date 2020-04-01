From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:33 -0700
Subject: [Buildroot] [PATCH 11/12] package/rygel: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-11-aduskett@gmail.com>
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
 package/rygel/rygel.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index c43030d69f..21c8ebee6a 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -33,6 +33,13 @@ ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
 RYGEL_DEPENDENCIES += gdk-pixbuf
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+RYGEL_CONF_OPTS += --enable-introspection
+RYGEL_DEPENDENCIES += gobject-introspection
+else
+RYGEL_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1),y)
 RYGEL_CONF_OPTS += \
 	--with-media-engine=gstreamer \
-- 
2.25.1
