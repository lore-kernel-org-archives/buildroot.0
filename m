From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:29 -0700
Subject: [Buildroot] [PATCH 07/12] package/gconf: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-7-aduskett@gmail.com>
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
 package/gconf/gconf.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
index 60ced95e18..c468d1433c 100644
--- a/package/gconf/gconf.mk
+++ b/package/gconf/gconf.mk
@@ -13,4 +13,11 @@ GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2 \
 GCONF_LICENSE = LGPL-2.0+
 GCONF_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GCONF_CONF_OPTS += --enable-introspection
+GCONF_DEPENDENCIES += gobject-introspection
+else
+GCONF_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1
