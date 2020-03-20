From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 20 Mar 2020 15:23:59 -0700
Subject: [Buildroot] [PATCH 2/2] package/libostree: add introspection support
In-Reply-To: <20200320222359.88689-1-aduskett@gmail.com>
References: <20200320222359.88689-1-aduskett@gmail.com>
Message-ID: <20200320222359.88689-2-aduskett@gmail.com>
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
 package/libostree/libostree.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index bdbe6b5aba..63e6bbfde3 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -30,6 +30,13 @@ else
 LIBOSTREE_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBOSTREE_CONF_OPTS += --enable-introspection
+LIBOSTREE_DEPENDENCIES += gobject-introspection
+else
+LIBOSTREE_CONF_OPTS += --disable-introspection
+endif
+
 # Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
 # and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
 # option yet, use the avahi-daemon and dbus config symbols to check for
-- 
2.25.1
