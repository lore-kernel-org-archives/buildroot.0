From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 23:03:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 configs:minnowboard_max-graphical_defconfig: re-enable GLX support
Message-ID: <20200507214107.946AF90F65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afad679486f24d86bc8a3305e5ba729756c5cb90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This defconfig loses mesa3d-demo and glmark2 package since commit
5cb821d5635626b7327d5d704555c412e5ed5a1f that introduced an
explicit option to enable GLX support.

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ffedbd1c531812804668a5b1ea1772f737f2f996)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/minnowboard_max-graphical_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 33630c6b09..910c324e25 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -42,6 +42,7 @@ BR2_PACKAGE_MESA3D_DEMOS=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
+BR2_PACKAGE_MESA3D_OPENGL_GLX=y
 
 # Framebuffer (just for testing purposes)
 BR2_PACKAGE_FB_TEST_APP=y
