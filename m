From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon, 25 Feb 2019 08:52:45 +0800
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: fix meson cpu_family
 format
Message-ID: <20190225005245.1954-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

meson requires a custom cpu_family format
https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index a637299476..886fcf7205 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -64,7 +64,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
-	    -e "s%@TARGET_ARCH@%$$(ARCH)%g" \
+	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
 	    -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
-- 
2.17.1
