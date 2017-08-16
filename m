From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:13:22 +0200
Subject: [Buildroot] [git commit] package/mesa3d: vc4 backend is an EGL
	provider
Message-ID: <20170816210712.70918821D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8ee37245ca66131dbb6b4e3bf94cfb0cb370d0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The VC4 GPU does not support full GL, it only provides EGL.

Currently, it is possible to build the VC4 backend without EGL support,
but that does not make sense in the slighest.

So, forcibly enable EGL with VC4, like is done for etnaviv and virgl.

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ad41b1c..13c118e 100644
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
