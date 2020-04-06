From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:25 +0200
Subject: [Buildroot] [git commit] package/gconf: enable
 gobject-introspection support
Message-ID: <20200406202227.6B22781D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0609aeed7c249f75f9446d57c644f1cba93dd615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
