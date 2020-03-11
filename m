From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Wed, 11 Mar 2020 10:59:30 +0000
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: Fix
 cross-compilation.conf
Message-ID: <20200311105930.21564-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$$(STAGING_DIR) -> $(STAGING_DIR) in PKG_MESON_INSTALL_CROSS_CONF.

$$ resulted in `$(STAGING_DIR)` in the file instead of the expanded
value.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 642b715938..416129f6fe 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -193,7 +193,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    -e 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g' \
 	    -e 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g' \
 	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
-	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
+	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
 	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
-- 
2.20.1
