From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:26:39 +0200
Subject: [Buildroot] [PATCHv2 05/12]
 configs:minnowboard_max-graphical_defconfig: re-enable GLX support
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421172646.3340666-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig loses mesa3d-demo and glmark2 package since commit
5cb821d5635626b7327d5d704555c412e5ed5a1f that introduced an
explicit option to enable GLX support.

This fixes the new defconfig check.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
This patch should be backported to 2020.02.x and 2019.11.x.
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
-- 
2.25.3
