From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 20:10:49 +0200
Subject: [Buildroot] [PATCH v14 4/8] package/mesa3d: select kmsro for etnaviv
In-Reply-To: <20190921181053.8999-1-bernd.kuhls@t-online.de>
References: <20190921181053.8999-1-bernd.kuhls@t-online.de>
Message-ID: <20190921181053.8999-5-bernd.kuhls@t-online.de>
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
index 54c083ed71..4b4c0972b6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -88,6 +88,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Mesa driver for Vivante GPUs.
-- 
2.20.1
