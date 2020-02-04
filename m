From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 11:09:51 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.0.p1.0
Message-ID: <20200204095858.7FFC681486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8cf273f965c69b18b06f14828c66384302ed210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, we add hashes for the licenses files.

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  7 +++++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 13 ++++++++-----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 2cbc36a185..1a67b53ac5 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,2 +1,5 @@
-sha256	dddadd164bede4793409ccfb636324dd73862c33458db66a5860f126bada25dc  imx-gpu-viv-6.2.4.p1.2-aarch32.bin
-sha256	27ed3f58681cef18f87ea20946cc89b2cef4848006064303d20583e6ed7aeec7  imx-gpu-viv-6.2.4.p1.2-aarch64.bin
+# Locally calculated
+sha256	b5c94b56a9f7c84aa084603a6ca21b5f3941b400e4f6ee8558b58c9b9f1aab36  imx-gpu-viv-6.4.0.p1.0-aarch32.bin
+sha256	45852a5c3c61a9215a2ffb7387a6e1cce7ddac6f12513fc77459ad7e1f1b3a27  imx-gpu-viv-6.4.0.p1.0-aarch64.bin
+sha256	d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256	9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index d2a9fad459..646d4e3673 100644
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
@@ -42,9 +42,12 @@ endef
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
 	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/gpu-core/usr/include/*/*.h
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1
-	ln -sf libGL.so.1.2 $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
+	$(if $(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11)$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),
+		ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so
+		ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1
+		ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1.2
+		ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
+	)
 	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so
 	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1
 	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1.0
