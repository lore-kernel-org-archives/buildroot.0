From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 20:23:42 -0600
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: propagate missing
 libdrm-freedreno deps
Message-ID: <20200525022342.2216086-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libdrm freedreno depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be
as such we need to propagate those dependencies to mesa's gallium
freedreno driver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dd512d9b76..ecdbf9ce64 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -111,6 +111,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	bool "Gallium freedreno driver"
+	depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be # libdrm-freedreno
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
-- 
2.25.1
