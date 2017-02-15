From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:26:58 +0100
Subject: [Buildroot] [git commit] mesa3d-headers: fix installation of dri.pc
Message-ID: <20170215202740.33654821D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=990d2715fec8ccd974a1adc9a11c7d193594e147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/usr/lib/pkg-config/ is not the correct installation path for .pc files,
it should be in /usr/lib/pkgconfig/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 2c62c48..7ae5966 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -47,7 +47,7 @@ define MESA3D_HEADERS_INSTALL_DRI_PC
 	$(INSTALL) -D -m 0644 $(@D)/include/GL/internal/dri_interface.h \
 		$(STAGING_DIR)/usr/include/GL/internal/dri_interface.h
 	$(INSTALL) -D -m 0644 $(@D)/src/mesa/drivers/dri/dri.pc \
-		$(STAGING_DIR)/usr/lib/pkg-config/dri.pc
+		$(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
 endef
 
 endif # Xorg
