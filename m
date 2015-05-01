From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:57:18 +0200
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: remove useless build
	time deps
Message-ID: <20150501205734.38D6481DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e739689ecbecc15b2f7fb7ed6f3d0b5dc609694
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gpu-viv-bin-mx6q is provided as binary package, there is no build
time dependencies.

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |    4 ++--
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index c770346..9611379 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -33,8 +33,8 @@ choice
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
 	bool "X11"
 	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE # Runtime dependency
+	select BR2_PACKAGE_XLIB_LIBXEXT # Runtime dependency
 
 comment "X11 backend needs Xorg package"
 	depends on !BR2_PACKAGE_XORG7
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index f96087b..6221ee5 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -22,7 +22,6 @@ GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
 
 # DirectFB is not supported (wrong version)
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
-GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
 GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
 else
 GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
