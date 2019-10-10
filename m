From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:21:28 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabresd_qt5: Move from mdev
 to eudev
Message-ID: <20191010203129.BC8368CA03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca6f9504dd3825fe4fbd0b4a4b3eea4261032d03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit cf66a67112cd706d2e7 ("package/glmark2: drm support needs udev")
udev is needed when the drm flavor is used.

Move from mdev to eudev in order to fix the following glmark2
build failure:

Unknown flavor: . Supported flavors are dispmanx-glesv2, drm-gl,
drm-glesv2, mir-gl, mir-glesv2, wayland-gl, wayland-glesv2, win32-gl,
win32-glesv2, x11-gl, x11-glesv2

Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6-sabresd_qt5_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 4616f57eae..a2925bd056 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -95,4 +95,4 @@ BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS=y
 BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS=y
 
 # For automatic kernel module loading
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
