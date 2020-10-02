From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:39:52 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/pkg-meson.mk: fix
 generation of pkg_config_static prop
Message-ID: <20201002085305.8F5D77FE54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df290ba86df67c6b36e2c226c1f594997836d641
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

fixes following in the generated cross-complation.conf file:
pkg_config_static = '$(if $(BR2_STATIC_LIBS),true,false)'

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 78da84eca9a4a5d584369b10792253a80c37a8f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index c3fe6df5d0..3a34ba703b 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -195,7 +195,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
 	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
 	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
-	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
+	    -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
 	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
