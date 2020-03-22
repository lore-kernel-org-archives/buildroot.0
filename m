From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 11:40:36 +0100
Subject: [Buildroot] [git commit] package/gupnp-av: add optional dependency
 for gobject-introspection
Message-ID: <20200322103103.43E8A83D72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7255cba489b4fff00c57a725674a199ce961cfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, explicitly set --enable-introspection in
the configure options and add a dependency for gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
