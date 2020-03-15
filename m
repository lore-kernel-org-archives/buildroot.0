From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 10:24:58 -0700
Subject: [Buildroot] [PATCH 5/5] package/gupnp-av: add optional dependency
 for gobject-introspection
In-Reply-To: <20200315172459.881615-1-aduskett@gmail.com>
References: <20200315172459.881615-1-aduskett@gmail.com>
Message-ID: <20200315172459.881615-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, explicitly set --enable-introspection in
the configure options and add a dependency for gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gupnp-av/gupnp-av.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index c670ab6d43..55436d0e53 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -13,4 +13,11 @@ GUPNP_AV_LICENSE_FILES = COPYING
 GUPNP_AV_INSTALL_STAGING = YES
 GUPNP_AV_DEPENDENCIES = host-pkgconf libglib2 libxml2 gupnp
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GUPNP_AV_CONF_OPTS += --enable-introspection
+GUPNP_AV_DEPENDENCIES += gobject-introspection
+else
+GUPNP_AV_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
-- 
2.24.1
