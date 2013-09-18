From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 00:22:16 +0200
Subject: [Buildroot] [git commit] gpu-viv-bin-mx6q: select libXdamage and
	libXext when xorg enabled
Message-ID: <20130918222319.0711B9B737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44bf55f216c3541126f5d576beaa0dedf90ce071
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |    2 ++
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index e80eae4..a3c2057 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
 	select BR2_PACKAGE_HAS_OPENGL_EGL
 	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	depends on BR2_arm # Only relevant for i.MX6
 	 # Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 1b9684a..c48d108 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -21,6 +21,7 @@ GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 
 # DirectFB is not supported (wrong version)
 ifeq ($(BR2_PACKAGE_XORG7),y)
+GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
 GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
 else
 GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
