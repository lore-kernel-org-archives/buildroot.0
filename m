From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 25 Sep 2019 21:05:56 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/mesa3d: add OSMesa classic
 needs dri swrast"
In-Reply-To: <20190925190556.5956-1-bernd.kuhls@t-online.de>
References: <20190925190556.5956-1-bernd.kuhls@t-online.de>
Message-ID: <20190925190556.5956-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 1ad2c7f678b91635ab8499b67824951d003a1bce.

See upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=19.2&id=b816edcbf40abca1e3d68b1a706f5670b3fcf4d7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 403693770c..99b3818235 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -299,14 +299,10 @@ comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
 	bool "OSMesa (classic) library"
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	help
 	  The OSMesa classic API provides functions for
 	  making off-screen renderings.
 
-comment "OSMesa classic requires dri (classic) swrast"
-	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
-
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "OpenGL API Support"
-- 
2.20.1
