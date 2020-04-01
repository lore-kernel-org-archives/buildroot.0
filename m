From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:23 -0700
Subject: [Buildroot] [PATCH 01/12] package/libsecret: enable
 gobject-introspection support
Message-ID: <20200401002134.1779241-1-aduskett@gmail.com>
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
 package/libsecret/libsecret.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index b48d2e7086..f87df47097 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -15,11 +15,17 @@ LIBSECRET_CONF_OPTS = \
 	--disable-manpages \
 	--disable-strict \
 	--disable-coverage \
-	--enable-introspection=no \
 	--enable-vala=no
 LIBSECRET_LICENSE = LGPL-2.1+
 LIBSECRET_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBSECRET_CONF_OPTS += --enable-introspection=yes
+LIBSECRET_DEPENDENCIES += gobject-introspection
+else
+LIBSECRET_CONF_OPTS += --enable-introspection=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSECRET_DEPENDENCIES += libgcrypt
 LIBSECRET_CONF_OPTS += --enable-gcrypt \
-- 
2.25.1
