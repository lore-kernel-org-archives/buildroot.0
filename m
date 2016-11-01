From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue,  1 Nov 2016 17:09:59 +0100
Subject: [Buildroot] [PATCH 2/8] imx-vpu: bump to version 5.4.35
In-Reply-To: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
References: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
Message-ID: <20161101161005.13302-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
Coverity fixes for resources leaks, null dereference, string overflows
and checking return.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/b138b5b0

Implicitly tested through gstreamer as the plugins rely on it:
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
       matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index 67ebaf2..b3d617d 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	2e670ef2337a5dbe6c32fa07128ad9aad32afdbf472c23d44133245ec6a66d46  imx-vpu-5.4.33.bin
+sha256	e1d6550426dfc59e4fd0352f1d312ea7eff5dcf18974f923ed7a85007cb40e27  imx-vpu-5.4.35.bin
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 09ff5a8..0b464d8 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.33
+IMX_VPU_VERSION = 5.4.35
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
-- 
2.9.3
