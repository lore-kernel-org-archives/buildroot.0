From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 23 Dec 2020 16:33:24 +0100
Subject: [Buildroot] [PATCH 2/3] package/freescale-imx/imx-gpu-viv: install
 Vendor ICDs file (Vivante.icd)
In-Reply-To: <20201223153325.12302-1-romain.naour@smile.fr>
References: <20201223153325.12302-1-romain.naour@smile.fr>
Message-ID: <20201223153325.12302-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this file, the clinfo binary provided by the package doesn't
detect the opencl support.

Fixes:
https://github.com/boundarydevices/buildroot-external-boundary/issues/5

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index fca8a4d447..06c74869cd 100644
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
-- 
2.21.3
