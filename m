From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Jun 2019 19:25:32 +0200
Subject: [Buildroot] [PATCH v4 9/9] package/mesa3d: select kmsro for etnaviv
In-Reply-To: <20190629172532.26231-1-bernd.kuhls@t-online.de>
References: <20190629172532.26231-1-bernd.kuhls@t-online.de>
Message-ID: <20190629172532.26231-9-bernd.kuhls@t-online.de>
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
v4: no changes

 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 569628d28b..5dd3895956 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -97,6 +97,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Mesa driver for Vivante GPUs.
-- 
2.20.1
