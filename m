From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:32:46 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: is an
 libopencl provider
Message-ID: <20201226171542.2C75988DA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f296b7ac5917bcbc0389d93856201066d0bb97fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The imx-gpu-viv install libOpenCL.so.1.2 library and cl.h header,
so declare it as a libopencl provider.

With this support we can select the clinfo package provided by
Buildroot instead of the one provided by imx-gpu-viv package.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in      | 4 ++++
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index a2deaf2e12..753a71ee00 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENCL
 	select BR2_PACKAGE_HAS_LIBOPENVG
 	help
 	  Userspace libraries for Vivante GPU on i.MX platforms
@@ -74,6 +75,9 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "imx-gpu-viv"
 
+config BR2_PACKAGE_PROVIDES_LIBOPENCL
+	default "imx-gpu-viv"
+
 config BR2_PACKAGE_PROVIDES_LIBOPENVG
 	default "imx-gpu-viv"
 
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index a248da6069..9d69acb7ae 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -18,7 +18,7 @@ IMX_GPU_VIV_LICENSE = NXP Semiconductor Software License Agreement
 IMX_GPU_VIV_LICENSE_FILES = EULA COPYING
 IMX_GPU_VIV_REDISTRIBUTE = NO
 
-IMX_GPU_VIV_PROVIDES = libegl libgles libopenvg
+IMX_GPU_VIV_PROVIDES = libegl libgles libopencl libopenvg
 IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
