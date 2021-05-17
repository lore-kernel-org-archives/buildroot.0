From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 May 2021 19:06:08 +0200
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: drop
 BR2_PACKAGE_LVM2_APP_LIBRARY
Message-ID: <20210517170609.810302-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lvm2 app library is not needed to build devicemapper filesystem driver

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker-engine/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 357101f280..911cbfe428 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -34,9 +34,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
-	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	select BR2_PACKAGE_LVM2
-	select BR2_PACKAGE_LVM2_APP_LIBRARY
 	help
 	  Build the devicemapper filesystem driver for Docker.
 
-- 
2.30.2
