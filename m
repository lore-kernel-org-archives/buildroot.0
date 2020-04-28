From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Apr 2020 06:22:12 -0600
Subject: [Buildroot] [PATCH 1/2] package/pkg-meson.mk: set correct pkgconfig
 for native dependencies
Message-ID: <20200428122213.63826-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sets the correct build.pkg_config_path for all meson packages so
that dependencies with native: true will properly use the the host
pkgconfig instead of the target pkgconfig.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-meson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 2ba10f30ed..0a4ab2194c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
+		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
-- 
2.20.1
