From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 22:12:28 +0100
Subject: [Buildroot] [git commit] package/pkg-meson: fix meson cpu_family
 format
Message-ID: <20190225211020.6F9CD8E385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e4b82b996101fca02624d29c7c6cfd5bdf7fbc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

meson requires a custom cpu_family format
https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
