From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  8 Apr 2020 13:51:31 -0300
Subject: [Buildroot] [PATCH 2/5] package/mesa3d: Select LIBDRM_FREEDRENO for
 freedreno
In-Reply-To: <20200408165134.18337-1-festevam@gmail.com>
References: <20200408165134.18337-1-festevam@gmail.com>
Message-ID: <20200408165134.18337-2-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mesa3d freedreno driver is not usable without the corresponding
libdrm support for this platform, so select LIBDRM_FREEDRENO.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 6f78da174c..dd512d9b76 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -112,6 +112,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	bool "Gallium freedreno driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
 	  Mesa driver for Freedreno GPUs.
-- 
2.17.1
