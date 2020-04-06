From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:35:22 +0200
Subject: [Buildroot] [git commit] package/json-glib: enable
 gobject-introspection support
Message-ID: <20200406202227.57C7581D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4ed7dd4503ef7ed4ea955130a3d6b1e572e8331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt -Dintrospection=true.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/json-glib/json-glib.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 7405b28b2e..accdb4f888 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -17,7 +17,12 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2
 
-JSON_GLIB_CONF_OPTS = -Dintrospection=false
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+JSON_GLIB_CONF_OPTS += -Dintrospection=true
+JSON_GLIB_DEPENDENCIES += gobject-introspection
+else
+JSON_GLIB_CONF_OPTS += -Dintrospection=false
+endif
 
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
