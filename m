From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Aug 2014 23:56:29 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: fix comment about i965 DRI
	driver
Message-ID: <1409435789-24181-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The help entry for the i965 DRI driver states that it supports alll
Intel GPUs. That's not true, as at least the i915 series is not handled
by this driver, but by a separate one.

Fix the help text accordingly; remove the useless second part of the
help text (which does not mean much for Buildroot.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c1be9e3..57d3c1f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -81,7 +81,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
-	  Supports all Intel GPUs.  This version is most supported by Intel.
+	  Support for i965-based Intel GPUs.
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	bool "DRI radeon driver"
-- 
1.9.1
