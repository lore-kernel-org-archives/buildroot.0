From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Fri, 25 Dec 2020 10:54:06 +0000
Subject: [Buildroot] [PATCH 1/1] pkg-meson: Strip binaries on install
Message-ID: <20201225105407.2796089-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Strips binaries on install by adding `-Dstrip=true` to the default
configuration options.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/pkg-meson.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 3a34ba703b..7890219b20 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -88,6 +88,7 @@ define $(2)_CONFIGURE_CMDS
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
+		-Dstrip=true \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
@@ -105,6 +106,7 @@ define $(2)_CONFIGURE_CMDS
 		--localstatedir=$$(HOST_DIR)/var \
 		--default-library=shared \
 		--buildtype=release \
+		-Dstrip=true \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
-- 
2.27.0
