From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:32:21 +0200
Subject: [Buildroot] [git commit] package/mesa3d: select LIBDRM_FREEDRENO
 for freedreno
Message-ID: <20200411082714.493EF8E4C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e49db51dc4a18df4a6aa6c590e0adb678df3f7fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mesa3d freedreno driver is not usable without the corresponding
libdrm support for this platform, so select LIBDRM_FREEDRENO.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 6f78da174c..dd512d9b76 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -112,6 +112,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	bool "Gallium freedreno driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
 	  Mesa driver for Freedreno GPUs.
