From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 16:01:29 +0200
Subject: [Buildroot] [git commit] package/pkg-meson.mk: set correct
 pkgconfig for native dependencies
Message-ID: <20200501134643.C790B90D1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cff3a8bdfba92e9f61d0984df08f1ecd205c072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This sets the correct build.pkg_config_path for all meson packages so
that dependencies with native: true will properly use the the host
pkgconfig instead of the target pkgconfig.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
