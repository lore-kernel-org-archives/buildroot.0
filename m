From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 23:09:05 +0200
Subject: [Buildroot] [git commit] mesa3d: make Etnaviv arch-independent
Message-ID: <20171021210224.3D58980577@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4e234e2d396becfd9ba29ab541d19737ebe7c2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Vivante GPU could be a part of SoC along with any CPU architecture
thus get rid of nonsense dependency.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dd5d0d4..9249b1d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -56,7 +56,6 @@ comment "Gallium drivers"
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
-	depends on BR2_arm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
