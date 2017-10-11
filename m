From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 21:59:02 +0200
Subject: [Buildroot] [git commit] mesa3d: allow the VC4 driver to be
	selected on AArch64
Message-ID: <20171011195242.7C54081172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e31b62c117cf7ac421d2640ab2966134e3536884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Neon is compulsory on AArch64, and BR2_ARM_CPU_HAS_NEON is false on
AArch64. Therefore, this change is needed to enable building VC4
gallium driver for Rpi3 using AArch64.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 787e266..dd5d0d4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -99,7 +99,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
-	depends on BR2_ARM_CPU_HAS_NEON
+	depends on BR2_ARM_CPU_HAS_NEON || BR2_aarch64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
