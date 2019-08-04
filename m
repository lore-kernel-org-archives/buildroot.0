From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 20:54:16 +0200
Subject: [Buildroot] [PATCH v6 09/10] package/mesa3d: select kmsro for
 etnaviv
In-Reply-To: <20190804185417.6562-1-bernd.kuhls@t-online.de>
References: <20190804185417.6562-1-bernd.kuhls@t-online.de>
Message-ID: <20190804185417.6562-9-bernd.kuhls@t-online.de>
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
v6: no changes
v5: no changes
v4: no changes

 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e82bdc5e0d..afbf4a8cf5 100644
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
