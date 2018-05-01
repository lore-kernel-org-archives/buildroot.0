From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:56:02 +0200
Subject: [Buildroot] [git commit] package/mesa3d: RadeonSI needs
 libdrm-radeon and libdrm-amdgpu
Message-ID: <20180501205730.108EE8B3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3764f8773b89babeb86dd9d5b6b8bccdd77d2c8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
checking for EXPAT... yes
checking for RADEON... no
configure: error: Package requirements (libdrm >= 2.4.71 libdrm_radeon >= 2.4.71)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Micha?? Kalbarczyk <michal@gamecodehq.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1984e4f11c..32337a36a4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -122,6 +122,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
+	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
