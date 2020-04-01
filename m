From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:31 -0700
Subject: [Buildroot] [PATCH 09/12] package/libgee: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-9-aduskett@gmail.com>
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
 package/libgee/libgee.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 81fd354fe8..4b2581e171 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -13,4 +13,11 @@ LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGEE_CONF_OPTS += --enable-introspection
+LIBGEE_DEPENDENCIES += gobject-introspection
+else
+LIBGEE_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
-- 
2.25.1
