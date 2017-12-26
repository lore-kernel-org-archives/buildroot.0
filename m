From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Dec 2017 00:39:03 +0100
Subject: [Buildroot] [PATCH 3/4] legacy: drop 2013.02 entries
In-Reply-To: <cover.1514331522.git.yann.morin.1998@free.fr>
References: <cover.1514331522.git.yann.morin.1998@free.fr>
Message-ID: <e3d11088ac90f55963cb96c004116d153391df47.1514331522.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we release 2018.02 at the end of this cycle, those entries will
have been removed for more than five years, so we can drop them now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy | 67 --------------------------------------------------------
 1 file changed, 67 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4efce8015b..bff85637c9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3063,73 +3063,6 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
 	help
 	  Now covers the whole Realtek 87xx familly: 8712/8723.
 
-###############################################################################
-comment "Legacy options removed in 2013.02"
-
-config BR2_sa110
-	bool "sa110 ARM target switched to strongarm"
-	select BR2_LEGACY
-	select BR2_strongarm
-	help
-	  The SA110 is the same as a generic StrongARM, it just differs
-	  in speed, peripherals and cache.
-
-config BR2_sa1100
-	bool "sa1100 ARM target switched to strongarm"
-	select BR2_LEGACY
-	select BR2_strongarm
-	help
-	  The SA1100 is the same as a generic StrongARM, it just differs
-	  in speed, peripherals and cache.
-
-config BR2_PACKAGE_GDISK
-	bool "gdisk has been replaced by gptfdisk"
-	select BR2_LEGACY
-	select BR2_PACKAGE_GPTFDISK
-	help
-	  The option has been renamed BR2_PACKAGE_GPTFDISK.
-
-config BR2_PACKAGE_GDISK_GDISK
-	bool "gdisk tool from gdisk has been replaced by gdisk in gptfdisk"
-	select BR2_LEGACY
-	select BR2_PACKAGE_GPTFDISK
-	select BR2_PACKAGE_GPTFDISK_GDISK
-	help
-	  The option has been renamed BR2_PACKAGE_GPTFDISK_GDISK.
-
-config BR2_PACKAGE_GDISK_SGDISK
-	bool "sgdisk tool from gdisk has been replaced by sgdisk in gptfdisk"
-	select BR2_LEGACY
-	select BR2_PACKAGE_GPTFDISK
-	select BR2_PACKAGE_GPTFDISK_SGDISK
-	help
-	  The option has been renamed BR2_PACKAGE_GPTFDISK_SGDISK.
-
-config BR2_PACKAGE_GDB_HOST
-	bool "gdb for the host option has been renamed"
-	select BR2_PACKAGE_HOST_GDB
-	select BR2_LEGACY
-	help
-	  Due to the conversion of gdb to the package infrastructure,
-	  the BR2_PACKAGE_GDB_HOST option has been renamed
-	  BR2_PACKAGE_HOST_GDB.
-
-config BR2_PACKAGE_DIRECTB_DITHER_RGB16
-	bool "DirectFB RGB16 dithering option has been renamed"
-	select BR2_PACKAGE_DIRECTFB_DITHER_RGB16
-	select BR2_LEGACY
-	help
-	  The option has been renamed
-	  BR2_PACKAGE_DIRECTFB_DITHER_RGB16.
-
-config BR2_PACKAGE_DIRECTB_TESTS
-	bool "DirectFB Tests option has been renamed"
-	select BR2_PACKAGE_DIRECTFB_TESTS
-	select BR2_LEGACY
-	help
-	  The option has been renamed
-	  BR2_PACKAGE_DIRECTFB_TESTS.
-
 endmenu
 
 endif # !SKIP_LEGACY
-- 
2.11.0
