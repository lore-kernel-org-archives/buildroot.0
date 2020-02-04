From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  4 Feb 2020 15:44:12 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/mesa3d: update vc4 help text
In-Reply-To: <20200204144412.6666-1-ps.report@gmx.net>
References: <20200204144412.6666-1-ps.report@gmx.net>
Message-ID: <20200204144412.6666-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mesa3d/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1351d1cd97..9389a6132e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -244,8 +244,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
-	  Driver for Broadcom VC4 (rpi2/3) GPUs.
-	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
+	  Driver for Broadcom VC4 (rpi2/3/4) GPUs (needs kmsro).
+	  It requires a recent enough mainline/raspberrypi kernel with
+	  drm vc4 (CONFIG_DRM_VC4) support enabled, for rpi4 additional
+	  v3d support is required.
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	bool "Gallium virgl driver"
-- 
2.25.0
