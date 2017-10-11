From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 11 Oct 2017 17:42:11 +0200
Subject: [Buildroot] [PATCH 2/2] mesa3d: VC4 change dependency to
	arm_cpu_has_neon OR aarch64
In-Reply-To: <20171011154211.2651-1-olivier.schonken@gmail.com>
References: <20171011154211.2651-1-olivier.schonken@gmail.com>
Message-ID: <20171011154211.2651-2-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Neon is compulsory on aarch64.
This is needed to enable building VC4 gallium driver for Rpi3 using
aarch64.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 787e266bdd..dd5d0d4385 100644
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
-- 
2.11.0
