From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 19:27:44 +0100
Subject: [Buildroot] [git commit] imx-gpu-viv: bump to version 5.0.11.p8.6
Message-ID: <20161101182816.CAE3780DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8700d722942bcc68947dc100b908281cc5ee7f7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug Fixes for P8.6 Graphics includes:

3D: MGS-2239 Destroy EGL window surface and makecurrent new surface
cause segmentation fault
3D: MGS-2237 [6Q-SDB] FB met GPU STATE DUMP when testing ES30
Conformance 100%
3D: MGS-2101 EGLImage created with an OpenVG parent image always returns
EGL_BAD_ACCESS
3D: MGS-2086 Met GPU dump when do driver test under dvfs stress test
3D: MGS-2150 optimized vertex copy for attribute upload
3D: MGS-2100 CubeMap sub-texture copy disappears when small size and
small x/y offset
3D: MA-8321 testTextureViewStress200Hz fail on kk4.4.3_2.0.1 with GPU
5.0.11p8
3D: MA-8302 testOpenGlEsVersion fail on kk4.4.3_2.0.1 with GPU 5.0.11p8
3D: MA-8300 Fix antutu3.0.3 2D/3D performance downgrade
3D: MA-8104 fix Antutu6.x benchmark 3D not supported issue
3D: MA-8110 Change NOTIFY_OK to NOTIFY_DONE in task_notify_func.
3D: MGS-1851 fix the integer id resource leak
3D: MGS-1845 refine es11 extension
3D: MGS-1717 display no output when use gplay to do loopback test
Compiler: MGS-1948 Fix UBO in shader can not support by new bsp release.
2D-VG: MGS-2154 VG kernel driver Allocate and Free wrong memory type
2D-VG: MGS-2089 fix gc355 vg freeze with interrupt signal
2D-VG: MGS-2084 fix vg pbuffer memory leak
2D-VG: MGS-1756 Portability issue: OpenVG includes "malloc.h" instead of
"stdlib.h" for malloc() function
2D: MA-8378 Refine g2d and gpu helper functions.
2D: MGS-1847 fix G2D build broken with g2dBUILD_FOR_VIVANTE=1
General: MGS-2243 Fix high impact Coverity issue in GPU kernel driver
General: MGS-2233 fix gpu axi bus error with process kill operations
General: MGS-2188 Fix misleading indents causing errors in gcc6
General: MGS-1624 QNX - port gmem_info tool
General: MGS-1630-1 5.0.11.p8 driver can't pass build with kernel 4.1 on
Android M6.0

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/de26bc15

This package has been tested with both X11 and Framebuffer backends:
 # cd /usr/share/examples/viv_samples/vdk/
 # apitrace trace --api egl ./tutorial7
 # gmem_info
 ... display memory use per PID ...
 #??apitrace replay tutorial7.trace
 #??eglretrace tutorial7.trace

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index f94d3148..6c526c5 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1 +1 @@
-sha256	8f79ce562d8ac1efb0a2af403b405541f98c55ae1631a18a3d7fad3224dfb44b  imx-gpu-viv-5.0.11.p8.4-hfp.bin
+sha256	caaabd59a259e29aa5b7f9d1d7f3fe71cff9336ba44904485d258baef276351f  imx-gpu-viv-5.0.11.p8.6-hfp.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index c7b1d9c..961f574 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_VERSION = 5.0.11.p8.4-hfp
+IMX_GPU_VIV_VERSION = 5.0.11.p8.6-hfp
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
 
