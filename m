From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Sun,  2 Feb 2020 14:22:05 +0300
Subject: [Buildroot] [PATCH v1 2/2] package/freescale-imx/imx-gpu-viv: bump
 to version 6.4.0.p1.0
Message-ID: <20200202112205.17030-1-tuzakli.refik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  4 ++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 11 ++++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 2cbc36a185..9bc1db3c35 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,2 +1,2 @@
-sha256	dddadd164bede4793409ccfb636324dd73862c33458db66a5860f126bada25dc  imx-gpu-viv-6.2.4.p1.2-aarch32.bin
-sha256	27ed3f58681cef18f87ea20946cc89b2cef4848006064303d20583e6ed7aeec7  imx-gpu-viv-6.2.4.p1.2-aarch64.bin
+sha256	b5c94b56a9f7c84aa084603a6ca21b5f3941b400e4f6ee8558b58c9b9f1aab36  imx-gpu-viv-6.4.0.p1.0-aarch32.bin
+sha256	45852a5c3c61a9215a2ffb7387a6e1cce7ddac6f12513fc77459ad7e1f1b3a27  imx-gpu-viv-6.4.0.p1.0-aarch64.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index d2a9fad459..b080445d51 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.2.4.p1.2-aarch64
+IMX_GPU_VIV_VERSION = 6.4.0.p1.0-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.2.4.p1.2-aarch32
+IMX_GPU_VIV_VERSION = 6.4.0.p1.0-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
@@ -42,9 +42,10 @@ endef
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
 	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/gpu-core/usr/include/*/*.h
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
+	ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so
+	ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1
+	ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1.2
+	ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
 	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so
 	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1
 	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1.0
-- 
2.17.1
