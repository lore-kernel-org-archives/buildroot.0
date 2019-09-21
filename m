From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 20:49:02 +0200
Subject: [Buildroot] [git commit] package/mesa3d: select kmsro for etnaviv
Message-ID: <20190921185429.D9EA98EFD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa58c14cc6a8b900a3baf7b6ffeffaa9c3fc3a0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quote from mesa3d meson.build:
"kmsro driver requires one or more renderonly drivers
(vc4, etnaviv, freedreno)".

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dbd359fec8..16d81daa51 100644
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
