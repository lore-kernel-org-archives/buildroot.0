From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 10:48:48 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/docker-engine:
 devicemapper driver does not need liblvm2app
Message-ID: <20210520090953.8E3AA886C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1690ddde4d78773ac54dd2d86af48cb3991e4102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

lvm2 app library is not needed to build devicemapper filesystem driver

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: tweak title]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 378e9f4b11631725937d343ed58a091536575d65)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 85a4bc6a0f..4fa3b5a8c3 100644
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
 
