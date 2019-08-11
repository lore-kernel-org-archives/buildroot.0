From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Aug 2019 14:56:50 +0200
Subject: [Buildroot] [PATCH/next v8 09/12] package/mesa3d: select kmsro for
 etnaviv
In-Reply-To: <20190811125653.17731-1-bernd.kuhls@t-online.de>
References: <20190811125653.17731-1-bernd.kuhls@t-online.de>
Message-ID: <20190811125653.17731-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

Quote from mesa3d meson.build:
"kmsro driver requires one or more renderonly drivers
(vc4, etnaviv, freedreno)".

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v8: no changes
v7: no changes
v6: no changes
v5: no changes
v4: no changes

 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 5b36175bc6..27ab0dce22 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -96,6 +96,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Mesa driver for Vivante GPUs.
-- 
2.20.1
