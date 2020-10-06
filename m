From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 22:18:30 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add missing depends and
 driver name to r100 driver
Message-ID: <20201006200801.378B88EE1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3aac6d84713db7e6d2683eabf965eae21ce48bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Propagate libdrm dependencies.

Add r100 to menu name to differentiate from r200 dri driver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a12ed641a6..5b9fbc64cc 100644
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
