From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 20:39:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/glmark2: needs gbm from mesa3d
In-Reply-To: <20200104193919.91589-1-bernd.kuhls@t-online.de>
References: <20200104193919.91589-1-bernd.kuhls@t-online.de>
Message-ID: <20200104193919.91589-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building glmark2 with BR2_PACKAGE_PROVIDES_LIBEGL="sunxi-mali-mainline"
does not provide libgbm so lets depend on EGL support from mesa3d.

Fixes:
http://autobuild.buildroot.net/results/5d8/5d89dde9a290c16453535d7aeafcb1e3e8cb5ad1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/glmark2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 09cd51f2cf..c4fe3bf9c2 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_ANY
 config BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
 	bool
 	default y
-	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_UDEV
 	# libpthread-stubs -> libdrm
-- 
2.20.1
