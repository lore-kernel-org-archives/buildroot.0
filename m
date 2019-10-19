From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:22:28 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabresd_qt5: Remove the
 swrast option
Message-ID: <20191019221958.2DA0082B80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ac15c40ccbb78ca8041c1e352ffe456232de517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

i.MX6 has GPU in hardware, so we really don't need to
fallback to software rendering.

Remove the unneeded BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
option.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/imx6-sabresd_qt5_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 7a541951ae..8fbc2beb5b 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -49,7 +49,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 
 # Fonts
