From: Gary Bisson <bisson.gary@gmail.com>
Date: Sun,  5 Oct 2014 15:09:58 -0700
Subject: [Buildroot] [PATCH] imx-vpu: add VPU firmware selection
Message-ID: <1412546998-16238-1-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the imx-vpu package needs the firmware to be loaded into the VPU it
makes sense to have the latter package selected by default.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/freescale-imx/imx-vpu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
index cf5ab5f..8a95416 100644
--- a/package/freescale-imx/imx-vpu/Config.in
+++ b/package/freescale-imx/imx-vpu/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IMX_VPU
 	bool "imx-vpu"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
+	select BR2_PACKAGE_FIRMWARE_IMX
 	help
 	  Library of userspace helpers specific for the Freescale i.MX
 	  platform. It wraps the kernel interfaces for the i.MX platform
-- 
2.1.1
