From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  9 Sep 2015 22:20:53 +0200
Subject: [Buildroot] [PATCH 04/14] imx-gpu-viv: bump version to 5.0.11 p4.5
In-Reply-To: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441830063-8190-5-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add the package hash file.

3.14.28-1.0.1 patch release has the following bug fixes:

MGS-554 [#1644] Fix the false alert with GPU commit dirty
MGS-528 [#ccc] Wayland does not free window memory until the application
exits
GRPH-56 [#ccc] Add environment variable to turn off memory fill
GRPH-55 [ccc] Add alpha channel for direct texture viv extension
MA-6540 [#1672] Fix native fence FD leak found by Android? CTS
MGS-663 [#1686] P4 release can't be built statically
MA-6527 [#1666] Fix android.webgl.cts.WebGLTest CTS failure
MGS-511-2 [#1593] Qt 3D app cannot run on i.MX 6SoloX board
MGS-658 [#ccc] Fix build warning of isInApiTraceMode for static link
Revert MGS-352 [#1453] Creating context on 5.x is slower than 4.x due to
process name
read
MGS-578 [#1657] GoogleEarth APK encounters a shader compile error
MGS-507 [#1323] RenderToTexture has distorted pictures on screen in DL
board
MGS-547 [#ccc] Add YVYU format test in g2d_overlay_test
MGS-547 [#1640] YVYU format gets wrong result when 2D is built
MGS-564 [#ccc] Resolve race condition in display frame sync
MGS-367 [#1589] "CTRL+C" to close the "tutorial7_es20" causes GPU to
hang
MGS-543 [#1604] Remove some unsupported extensions in gles10
MGS-436 [#ccc] Memory leak in glimagesink video loop playback
MA-6267 [#1600] Fix ES3.0 benchmark UBenchEnhanced can't run
MA-6208-1 [#1543] Fix build error
MA-6208 [#1543] Fix com.drawelements.deqp.gles3 CTS failure
MGS-511 [#1593] Qt 3D app cannot run on i.MX 6SoloX board
MGS-512 [#1493] Fix es30 conformance failures related to glReadPixels
MGS-502 [#ccc] libCLC failure
MGS-500 [#ccc] Disable apitrace for static build

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/8f74380a

This package has been tested with both X11 and Framebuffer backends:
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 3 +++
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
new file mode 100644
index 0000000..aa1bdee
--- /dev/null
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256	b5b9c8e216b2bc4281c2443e07eab90547de0abd705614756ed68c7ad2fcf97a  imx-gpu-viv-5.0.11.p4.5-sfp.bin
+sha256	0591b495cd1c2547ae007d405b90729e2fb90603a5728b39d1a99cb4e1cf1eb4  imx-gpu-viv-5.0.11.p4.5-hfp.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index ef2399f..aa1e3b6 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_BASE_VERSION = 5.0.11.p4.1
+IMX_GPU_VIV_BASE_VERSION = 5.0.11.p4.5
 ifeq ($(BR2_ARM_EABIHF),y)
 IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-hfp
 else
-- 
2.5.1
