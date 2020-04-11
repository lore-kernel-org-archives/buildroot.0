From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:32:02 +0200
Subject: [Buildroot] [git commit] package/mesa3d: do not select
 MESA3D_OPENGL_EGL for etnaviv
Message-ID: <20200411082714.2EB738E4DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b03d4203250a98fd0c8fd6e4eefa532d950d26b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Thomas, BR2_PACKAGE_MESA3D_OPENGL_EGL should not
be automatically selected by the etnaviv driver.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 16d77f42c2..6f78da174c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -106,7 +106,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
-	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Mesa driver for Vivante GPUs.
 
