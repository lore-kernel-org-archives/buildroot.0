From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  9 Feb 2020 11:34:41 -0700
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add missing depends and
 driver name to r100 driver
Message-ID: <20200209183441.130187-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Propagate libdrm dependencies.

Add r100 to menu name to differentiate from r200 dri driver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ff39652508..788705544d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -355,7 +355,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	  Support for Nvidia-based GPUs.
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	bool "DRI radeon driver"
+	bool "DRI radeon r100 driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	help
-- 
2.20.1
