From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Oct 2019 22:26:52 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabresd_qt5: Select the KMSRO
 gallium driver
Message-ID: <20191019202133.28EEE82A39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5db9d1e92f526a90de72742558517c8d568b3009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After migrating to Mesa 19.2 the imx-drm_dri.so is no longer installed
unless the kmsro gallium driver is selected, so explicitly select
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO to fix the problem.

Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/imx6-sabresd_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index ded8cd0252..7a541951ae 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -48,6 +48,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # GL driver
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 
