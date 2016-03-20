From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 18:10:59 +0100
Subject: [Buildroot] [git commit] package/mesa3d: depends on
	BR2_TOOLCHAIN_HAS_SYNC_1
Message-ID: <20160320171239.CB92D818B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7429785873c6572db7440d1be26fab011c5d670a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/399/399d76ac70c3933604067e2c6dcb4086b50acfff/
http://autobuild.buildroot.net/results/70c/70cd299600985d7cf00c5b449f7e75284160551a/
http://autobuild.buildroot.net/results/b4a/b4ab89c3628dd648683e25f9e3c6238f13871aba/
http://autobuild.buildroot.net/results/33d/33d6dc8e1f57b5a02b07c50e5cefa272c6d992fc/
http://autobuild.buildroot.net/results/7f3/7f32a9577ee2e50af38d4f60de50d938792b66a3/
http://autobuild.buildroot.net/results/c98/c98b74d1d1342ca18fb161d010e94d45462ac6f1/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in                           | 2 ++
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 9057746..a7aa297 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	bool "mesa3d"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
@@ -169,3 +170,4 @@ endif # BR2_PACKAGE_MESA3D
 comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
index baf7ca4..fb64d06 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	bool "xf86-video-imx-viv"
 	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM
@@ -29,3 +30,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 comment "xf86-video-imx-viv depends on imx-gpu-viv with X11 output"
 	depends on BR2_arm
 	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1
