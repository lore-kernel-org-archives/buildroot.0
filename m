From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:39:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mesa3d: add
 missing depends and driver name to r100 driver
Message-ID: <20201010203809.E1BC0875AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e9e5bbc80353318ae3ee9b71a85a7156ef8d328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Propagate libdrm dependencies.

Add r100 to menu name to differentiate from r200 dri driver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a3aac6d84713db7e6d2683eabf965eae21ce48bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 2d6aa3565c..475a984285 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -370,7 +370,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	  Support for Nvidia-based GPUs.
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	bool "DRI radeon driver"
+	bool "DRI radeon r100 driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	help
