From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Aug 2017 11:57:51 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: vc4 backend is an EGL provider
Message-ID: <20170813095751.24516-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ad41b1cd2a..13c118ee68 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -102,6 +102,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Driver for Broadcom VC4 (rpi2/3) GPUs.
 	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
-- 
2.11.0
