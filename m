From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:32:45 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: install
 Vendor ICDs file (Vivante.icd)
Message-ID: <20201226171542.1758E80F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b37cd79daf874e0af7931510821444af2ff0ed51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this file, the clinfo binary provided by the package doesn't
detect the opencl support.

Fixes:
https://github.com/boundarydevices/buildroot-external-boundary/issues/5

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 0bb923a2f4..a248da6069 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -108,6 +108,7 @@ define IMX_GPU_VIV_INSTALL_TARGET_CMDS
 	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
 	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
 	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
+	$(INSTALL) -D -m 0644 $(@D)/gpu-core/etc/Vivante.icd $(TARGET_DIR)/etc/OpenCL/vendors/Vivante.icd
 	for lib in EGL GAL GLESv2 VDK; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
 			case $$f in \
