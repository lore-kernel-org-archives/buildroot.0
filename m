From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 16 Jan 2021 13:09:48 -0300
Subject: [Buildroot] [PATCH] package/mesa3d: select EXPAT for freedreno
Message-ID: <20210116160948.1364227-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select expat when building the freedreno driver to fix the
following error:

Run-time dependency expat found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency expat
Downloading expat source from https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2
<urlopen error unknown url type: https>
A fallback URL could be specified using source_fallback_url key in the wrap file

output/build/mesa3d-20.3.2/meson.build:1366:2: ERROR: could not get https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2 is the internet available?

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 45eb62b701a7..773fbfde220e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -119,6 +119,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+	select BR2_PACKAGE_EXPAT
 	help
 	  Mesa driver for Freedreno GPUs.
 
-- 
2.25.1
