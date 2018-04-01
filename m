From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:06:37 +0200
Subject: [Buildroot] [git commit] boot/*/Config.in: re-wrap help text
Message-ID: <20180401060642.A84D87FC5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f65a435e4595f1f6c9a1ff2715d2241d20f9213b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... to follow the convention <tab><2 spaces><62 chars>.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap/Config.in  |  6 ++++--
 boot/at91bootstrap3/Config.in | 10 ++++++----
 boot/uboot/Config.in          | 43 ++++++++++++++++++++++---------------------
 3 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 96cfdbc7e9..0f6430fd8d 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -4,9 +4,11 @@ config BR2_TARGET_AT91BOOTSTRAP
 	help
 	  AT91Bootstrap is a first level bootloader for the Atmel AT91
 	  devices. It integrates algorithms for:
-	  - Device initialization such as clock configuration, PIO settings...
+	  - Device initialization such as clock configuration, PIO
+	    settings...
 	  - Peripheral drivers such as PIO, PMC or SDRAMC...
-	  - Physical media algorithm such as DataFlash, NandFlash, NOR Flash...
+	  - Physical media algorithm such as DataFlash, NandFlash, NOR
+	    Flash...
 
 if	BR2_TARGET_AT91BOOTSTRAP
 
diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index bdc1e775a8..614363c9a6 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -4,9 +4,11 @@ config BR2_TARGET_AT91BOOTSTRAP3
 	help
 	  AT91Bootstrap is a first level bootloader for the Atmel AT91
 	  devices. It integrates algorithms for:
-	  - Device initialization such as clock configuration, PIO settings...
+	  - Device initialization such as clock configuration, PIO
+	    settings...
 	  - Peripheral drivers such as PIO, PMC or SDRAMC...
-	  - Physical media algorithm such as DataFlash, NandFlash, NOR Flash...
+	  - Physical media algorithm such as DataFlash, NandFlash, NOR
+	    Flash...
 
 if BR2_TARGET_AT91BOOTSTRAP3
 
@@ -20,8 +22,8 @@ config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
 	help
-	  This option allows Buildroot to get the AT91 Bootstrap 3 source
-	  code from a Git repository.
+	  This option allows Buildroot to get the AT91 Bootstrap 3
+	  source code from a Git repository.
 
 endchoice
 
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d96e7f687f..19cf12a073 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -11,14 +11,14 @@ choice
 config BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 	bool "Legacy"
 	help
-	  Select this option if you use an old U-Boot (older than 2015.04),
-	  so that we use the old build system.
+	  Select this option if you use an old U-Boot (older than
+	  2015.04), so that we use the old build system.
 
 config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	bool "Kconfig"
 	help
-	  Select this option if you use a recent U-Boot version (2015.04 or
-	  newer), so that we use the Kconfig build system.
+	  Select this option if you use a recent U-Boot version (2015.04
+	  or newer), so that we use the Kconfig build system.
 
 endchoice
 
@@ -27,9 +27,9 @@ config BR2_TARGET_UBOOT_BOARDNAME
 	string "U-Boot board name"
 	help
 	  One of U-Boot supported boards to be built.
-	  This will be suffixed with _config to meet U-Boot standard naming.
-	  See boards.cfg in U-Boot source code for the list of available
-	  configurations.
+	  This will be suffixed with _config to meet U-Boot standard
+	  naming. See boards.cfg in U-Boot source code for the list of
+	  available configurations.
 endif
 
 choice
@@ -79,8 +79,8 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION != ""  # legacy
 	help
-	  Revision to use in the typical format used by Git/Mercurial/Subversion
-	  E.G. a sha id, a tag, branch, ..
+	  Revision to use in the typical format used by
+	  Git/Mercurial/Subversion E.G. a sha id, a tag, branch, ..
 
 endif
 
@@ -229,25 +229,25 @@ config BR2_TARGET_UBOOT_FORMAT_NAND
 	bool "u-boot.nand (Freescale i.MX28)"
 	depends on BR2_arm
 	help
-	  This is Freescale i.MX28 BootStream format (.sb), with a header
-	  for booting from a NAND flash.
+	  This is Freescale i.MX28 BootStream format (.sb), with a
+	  header for booting from a NAND flash.
 
 	  U-boot includes an mxsboot tool to generate this format,
 	  starting from 2011.12.
 
-	  There are two possibilities when preparing an image writable to
-	  NAND flash:
-	  1) The NAND was not written at all yet or the BCB (Boot Control
-	  Blocks) is broken. In this case, the NAND image 'u-boot.nand'
-	  needs to written.
+	  There are two possibilities when preparing an image writable
+	  to NAND flash:
+	  1) The NAND was not written at all yet or the BCB (Boot
+	  Control Blocks) is broken. In this case, the NAND image
+	  'u-boot.nand' needs to written.
 	  2) The NAND flash was already written with a good BCB. This
 	  applies after 'u-boot.nand' was correctly written. There is no
-	  need to write the BCB again. In this case, the bootloader can be
-	  upgraded by writing 'u-boot.sb'.
+	  need to write the BCB again. In this case, the bootloader can
+	  be upgraded by writing 'u-boot.sb'.
 
 	  To satisfy both cases, the 'u-boot.nand' image obtained from
-	  mxsboot as well as the U-Boot make target 'u-boot.sb' are copied
-	  to the binaries directory.
+	  mxsboot as well as the U-Boot make target 'u-boot.sb' are
+	  copied to the binaries directory.
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
@@ -295,7 +295,8 @@ config BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME
 	depends on BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	help
 	  In case the U-Boot binary for the target platform is not among
-	  the default names, one or more custom names can be listed here.
+	  the default names, one or more custom names can be listed
+	  here.
 	  Use space to separate multiple names.
 	  Example:
 	  u-boot_magic.bin
