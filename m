From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Mon,  3 Feb 2020 22:31:51 +0300
Subject: [Buildroot] [PATCH v2 3/7] availability control for vpu in i.MX
 families
In-Reply-To: <20200203193155.12657-1-tuzakli.refik@gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
Message-ID: <20200203193155.12657-3-tuzakli.refik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 package/freescale-imx/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 586e67ea72..60a43646fc 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -95,9 +95,14 @@ source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-m4fwloader/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
+if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 source "package/freescale-imx/imx-vpu/Config.in"
+source "package/freescale-imx/imx-vpuwrap/Config.in"
+endif
+if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
+endif
 if BR2_PACKAGE_FREESCALE_IMX_HAS_DPU
 source "package/freescale-imx/imx-dpu-g2d/Config.in"
 endif
-- 
2.17.1
