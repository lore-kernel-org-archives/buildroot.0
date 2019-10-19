From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 19 Oct 2019 16:30:59 -0300
Subject: [Buildroot] [PATCH RESEND] configs/imx6-sabresd_qt5: Select the
 KMSRO gallium driver
Message-ID: <20191019193059.21532-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After migrating to Mesa 19.2 the imx-drm_dri.so is no longer installed
unless the kmsro gallium driver is selected, so explicitly select
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO to fix the problem.

Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---

 configs/imx6-sabresd_qt5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index a2925bd056..887e53dc21 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -48,6 +48,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # GL driver
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 
-- 
2.17.1
