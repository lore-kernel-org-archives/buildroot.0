From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:27 -0700
Subject: [Buildroot] [PATCH 05/12] package/json-glib: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt -Dintrospection=true.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
 
-- 
2.25.1
