From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Sep 2019 14:37:04 +0200
Subject: [Buildroot] [PATCH v11 10/13] package/mesa3d: select kmsro for
 etnaviv
In-Reply-To: <20190901123707.19342-1-bernd.kuhls@t-online.de>
References: <20190901123707.19342-1-bernd.kuhls@t-online.de>
Message-ID: <20190901123707.19342-11-bernd.kuhls@t-online.de>
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
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index cd7d36d203..b34d5220ab 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -94,6 +94,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Mesa driver for Vivante GPUs.
-- 
2.20.1
