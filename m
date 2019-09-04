From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  4 Sep 2019 19:50:30 +0200
Subject: [Buildroot] [PATCH v12 04/13] package/mesa3d: Only one swrast
 provider can be built
In-Reply-To: <20190904175039.29279-1-bernd.kuhls@t-online.de>
References: <20190904175039.29279-1-bernd.kuhls@t-online.de>
Message-ID: <20190904175039.29279-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

https://cgit.freedesktop.org/mesa/mesa/commit/?id=de24d61765011ed4bfc169b8ad8cf67e86b1f3bd

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 77ac0469e9..1f5f221337 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -173,11 +173,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	bool "Gallium swrast driver"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
+comment "Gallium swrast: Only one swrast provider can be built"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_arm || BR2_aarch64
-- 
2.20.1
