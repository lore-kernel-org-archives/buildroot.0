From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 23:24:22 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.3.p1.0
Message-ID: <20201229220713.ED0A37F9E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8171aad89bc89c2d2f2377cb40d474856ce70016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Same version as NXP release 5.4.70-2.3.0
- EULA/COPYING: update to LA_OPT_NXP_Software_License v17
- backend libraries have moved to separated folders
  - can now be simply copied, no more symlink or -fb/wl/x11.so
- wayland backend was renamed from 'wl' to 'wayland'
- sed on headers for LINUX removed as packages now expected to use
pkgconfig files properly (just like fb fixup was removed)

Key Improvements (from NXP changelog):
- GLES CTS 3.2.6.1
- Vulkan 1.1.6
- OpenVX 1.2
- GPU & NPU accelerated ML support
- OpenCV 4.2
- Chromium v74
- Support for renderdoc 1.7
- Support for TFlite 2.2
- NNCTS 1.2
- Vulkan backend support for Unity

Fixes: afbeed5d17 ("package/freescale-imx/imx-gpu-viv: bump version to
6.4.3.p0.0")

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in        |  2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  8 ++---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 40 +++++-----------------
 3 files changed, 14 insertions(+), 36 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 753a71ee00..cca2689905 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -67,7 +67,7 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT
 	string
 	default "x11" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	default "fb" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
-	default "wl" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
+	default "wayland" if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "imx-gpu-viv"
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 8978a3a769..9c18103996 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	cdec43e45e840fe30e188e3b6f07c44b4a1ceafc315e605c8d278564db5fcbe9  imx-gpu-viv-6.4.3.p0.0-aarch32.bin
-sha256	b3bd03288106daf3a62d2301d09569292ef6a5c74c761cfa4e41dad85e4bf547  imx-gpu-viv-6.4.3.p0.0-aarch64.bin
-sha256	69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
-sha256	a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
+sha256	9960fadbc1ea919f8b1b5c1e2e38a52b7293b70c906518d7fff2ada4140c59ea  imx-gpu-viv-6.4.3.p1.0-aarch32.bin
+sha256	0505620c3851a980d2e08fee4b4fcd06eff92efac02d1646924bea86e4384ad4  imx-gpu-viv-6.4.3.p1.0-aarch64.bin
+sha256	9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
+sha256	72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 9d69acb7ae..6ae9aa7acc 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.3.p0.0-aarch64
+IMX_GPU_VIV_VERSION = 6.4.3.p1.0-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.3.p0.0-aarch32
+IMX_GPU_VIV_VERSION = 6.4.3.p1.0-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
@@ -29,7 +29,7 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 IMX_GPU_VIV_DEPENDENCIES += xlib_libXdamage xlib_libXext xlib_libXfixes
 endif
 
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),wl)
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
 IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
 endif
 
@@ -38,24 +38,13 @@ define IMX_GPU_VIV_EXTRACT_CMDS
 endef
 
 # Instead of building, we fix up the inconsistencies that exist
-# in the upstream archive here.
+# in the upstream archive here. We also remove unused backend files.
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
-	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/gpu-core/usr/include/*/*.h
-	$(if $(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11)$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),
-		ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so
-		ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1
-		ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1.2
-		ln -sf libGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGL.so.1.2.0
-	)
-	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so
-	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1
-	ln -sf libEGL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libEGL.so.1.0
-	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so
-	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2
-	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2.0.0
-	ln -sf libGAL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL.so
-	ln -sf libVDK-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVDK.so
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
+	for backend in fb x11 wayland; do \
+		$(RM) -r $(@D)/gpu-core/usr/lib/$$backend ; \
+	done
 endef
 
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
@@ -64,7 +53,7 @@ define IMX_GPU_VIV_FIXUP_PKGCONFIG
 endef
 endif
 
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),wl)
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
@@ -101,22 +90,11 @@ define IMX_GPU_VIV_INSTALL_GMEM_INFO
 endef
 endif
 
-# On the target, remove the unused libraries.
-# Note that this is _required_, else ldconfig may create symlinks
-# to the wrong library
 define IMX_GPU_VIV_INSTALL_TARGET_CMDS
 	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
 	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
 	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
 	$(INSTALL) -D -m 0644 $(@D)/gpu-core/etc/Vivante.icd $(TARGET_DIR)/etc/OpenCL/vendors/Vivante.icd
-	for lib in EGL GAL GLESv2 VDK; do \
-		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
-			case $$f in \
-				*-$(IMX_GPU_VIV_LIB_TARGET).so) : ;; \
-				*) $(RM) $$f ;; \
-			esac; \
-		done; \
-	done
 endef
 
 $(eval $(generic-package))
