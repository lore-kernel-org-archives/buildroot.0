From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 10:51:05 -0300
Subject: [Buildroot] [PATCH] configs/minnowboard_max-graphical: fix build
 due to missing glxproto.h
Message-ID: <20191012135105.26722-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Commit 5cb821d5635 added a new option to enable GLX support in mesa3d.
Update the defconfig accordingly.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/318105208

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
The defconfig was edited by hand to reduce the turmoild that would
result from using "make savedefconfig"
---
 configs/minnowboard_max-graphical_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 921dae310f..1d043240ad 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -41,6 +41,7 @@ BR2_PACKAGE_MESA3D_DEMOS=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
+BR2_PACKAGE_MESA3D_OPENGL_GLX=y
 
 # Framebuffer (just for testing purposes)
 BR2_PACKAGE_FB_TEST_APP=y
-- 
2.18.1
