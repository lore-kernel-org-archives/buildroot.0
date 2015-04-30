From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 30 Apr 2015 17:12:20 +0200
Subject: [Buildroot] [PATCH v7 05/13] gpu-viv-bin-mx6q: add version in
	libraries symlinks
In-Reply-To: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
Message-ID: <1430406748-8493-6-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create libraries symbolic links with version numbers.

This now matches what is done in Yocto:
https://github.com/Freescale/meta-fsl-arm/blob/dizzy/recipes-graphics/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.inc#L165

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 2ca5e7e..d2288fe 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -36,13 +36,17 @@ endef
 # Make sure these commands are idempotent.
 define GPU_VIV_BIN_MX6Q_BUILD_CMDS
 	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
-	for lib in EGL GAL VIVANTE GLESv2; do \
-		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
-			$(@D)/usr/lib/lib$${lib}.so; \
-	done
 	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
 	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
 	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1.2.0
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1
+	ln -sf libEGL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libEGL.so.1.0
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2
+	ln -sf libGLESv2-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGLESv2.so.2.0.0
+	ln -sf libVIVANTE-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libVIVANTE.so
+	ln -sf libGAL-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so $(@D)/usr/lib/libGAL.so
 endef
 
 ifeq ($(GPU_VIV_BIN_MX6Q_LIB_TARGET),fb)
-- 
1.9.1
