From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:33:48 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/freescale-imx/imx-gpu-viv: install Vendor ICDs file (Vivante.icd)
Message-ID: <20201227082348.1D15880DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=067b7faa895f59ed63ec87a608dd57d50d9c1a56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Without this file, the clinfo binary provided by the package doesn't
detect the opencl support.

Fixes:
https://github.com/boundarydevices/buildroot-external-boundary/issues/5

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b37cd79daf874e0af7931510821444af2ff0ed51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 646d4e3673..194afbf3e0 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -118,6 +118,7 @@ define IMX_GPU_VIV_INSTALL_TARGET_CMDS
 	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
 	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
 	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
+	$(INSTALL) -D -m 0644 $(@D)/gpu-core/etc/Vivante.icd $(TARGET_DIR)/etc/OpenCL/vendors/Vivante.icd
 	for lib in EGL GAL GLESv2 VDK; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
 			case $$f in \
