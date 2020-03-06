From: Howard Mitchell <hm@hmbedded.co.uk>
Date: Fri,  6 Mar 2020 09:25:04 +0000
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: get glxgears working for
 v3d/vc4 minimal builds
In-Reply-To: <20200306092504.30340-1-hm@hmbedded.co.uk>
References: <20200306092504.30340-1-hm@hmbedded.co.uk>
Message-ID: <20200306092504.30340-2-hm@hmbedded.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently a minimal build for rpi2/3/4 (i.e. only v3d and/or vc4
selected, no dri drivers selected) results in working X11 except that
glxgears shows a blank window. This commit effectively results in the
following conf options being added: -Dglx-direct=true -Ddri3=true

Signed-off-by: Howard Mitchell <hm@hmbedded.co.uk>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 3950170533..59b8f60773 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -274,6 +274,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	help
 	  Driver for Broadcom VC4 (rpi2/3) GPUs.
 	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
-- 
2.17.1
