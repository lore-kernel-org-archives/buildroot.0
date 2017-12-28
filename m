From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 10:06:54 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: drop 2013.02 entries
Message-ID: <20171228090718.51AC97FD6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7f49a9693d77d4e695bce407ea32c9aae592680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we release 2018.02 at the end of this cycle, those entries will
have been removed for more than five years, so we can drop them now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 67 --------------------------------------------------------
 1 file changed, 67 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4efce80..bff8563 100644
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
