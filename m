From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 11:16:52 +0100
Subject: [Buildroot] [git commit] package/gupnp: add optional dependency for
 gobject-introspection
Message-ID: <20200322103103.39F6783D74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=018fcafb54a838353c14a05320a612f4ab9333d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, explicitly set --enable-introspection in
the configure options and add a dependency for gobject-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gupnp/gupnp.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 27486b09fa..75bbfa8d1d 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -12,6 +12,12 @@ GUPNP_LICENSE = LGPL-2.0+
 GUPNP_LICENSE_FILES = COPYING
 GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
-GUPNP_CONF_OPTS = --disable-introspection
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GUPNP_CONF_OPTS += --enable-introspection
+GUPNP_DEPENDENCIES += gobject-introspection
+else
+GUPNP_CONF_OPTS += --disable-introspection
+endif
 
 $(eval $(autotools-package))
