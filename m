From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 16:30:47 +0100
Subject: [Buildroot] [PATCH 1/2] mesa3d-headers: fix installation of dri.pc
Message-ID: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/usr/lib/pkg-config/ is not the correct installation path for .pc files,
it should be in /usr/lib/pkgconfig/

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
-- 
2.7.4
