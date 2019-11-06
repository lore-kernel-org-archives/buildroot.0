From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  6 Nov 2019 16:25:23 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: really generate the global
 cross-compilation.conf
Message-ID: <20191106152523.16543-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ccc9e05990a44d8db5825c07ed61d405ebb40caa ("package/meson:
install cross-compilation.conf during toolchain install") moved the
logic to generate the global cross-compilation.conf from
package/meson/meson.mk to package/pkg-meson.mk. While doing so, it
renamed the macro from HOST_MESON_INSTALL_CROSS_CONF to
PKG_MESON_INSTALL_CROSS_CONF, but the registration of this hook in
TOOLCHAIN_POST_INSTALL_STAGING_HOOKS was not changed accordingly: it
is still registering HOST_MESON_INSTALL_CROSS_CONF.

Due to this, the global cross-compilation.conf file was no longer
generated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index b11bc3a7c0..e7eea2aa58 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -205,4 +205,4 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
 
-TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
+TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
-- 
2.21.0
