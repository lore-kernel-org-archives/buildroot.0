From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] target: get rid of unused
	BR2_COPYTO / BR2_TARGET_ATMEL_COPYTO
Message-ID: <20100623092835.0EB7D81886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b10197dcf2ca1d6afbdf8f131560a3a0a8b9c72d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                                 |    7 ----
 configs/arm_toolchain_defconfig           |    2 -
 configs/at91rm9200df_defconfig            |    2 -
 configs/at91rm9200df_ext_bare_defconfig   |    2 -
 configs/at91rm9200df_ext_defconfig        |    2 -
 configs/at91sam9260dfc_defconfig          |    2 -
 configs/at91sam9260dfc_ext_bare_defconfig |    2 -
 configs/at91sam9260dfc_ext_defconfig      |    2 -
 configs/at91sam9260pf_defconfig           |    1 -
 configs/at91sam9261ek_defconfig           |    2 -
 configs/at91sam9261ek_ext_bare_defconfig  |    2 -
 configs/at91sam9261ek_ext_defconfig       |    2 -
 configs/at91sam9263ek_defconfig           |    2 -
 configs/at91sam9263ek_ext_bare_defconfig  |    2 -
 configs/at91sam9263ek_ext_defconfig       |    2 -
 configs/at91sam9g20dfc_defconfig          |    2 -
 configs/at91sam9g20dfc_ext_bare_defconfig |    2 -
 configs/at91sam9g20dfc_ext_defconfig      |    2 -
 configs/atngw100-base_defconfig           |    2 -
 configs/atngw100_defconfig                |    2 -
 configs/atstk1005_defconfig               |    2 -
 configs/atstk100x_defconfig               |    2 -
 configs/i386_defconfig                    |    1 -
 configs/i686_defconfig                    |    1 -
 configs/integrator926_defconfig           |    1 -
 configs/integrator926_huge_defconfig      |    1 -
 docs/buildroot.html                       |   12 -------
 target/Makefile.in                        |   48 -----------------------------
 target/device/Atmel/Config.in             |    7 ----
 target/device/Atmel/Makefile.in           |    6 ---
 30 files changed, 0 insertions(+), 125 deletions(-)

diff --git a/Config.in b/Config.in
index f5eb859..2554c58 100644
--- a/Config.in
+++ b/Config.in
@@ -81,13 +81,6 @@ config BR2_DL_DIR
 
 	  The default is $(TOPDIR)/dl
 
-config BR2_COPYTO
-	string "Copy result to..."
-	default ""
-	help
-	  Setting this variable will (eventually) override 
-	  any other copyto configurations in buildroot.
-
 config BR2_STAGING_DIR
 	string "Toolchain and header file location?"
 	default "$(BASE_DIR)/staging"
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 2fc6744..4c1e2c2 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_AT91BOOTSTRAP is not set
 # BR2_TARGET_KWIKBYTE is not set
 
@@ -139,7 +138,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 18fdf69..0d453b6 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_TARGET_DATAFLASHBOOT=y
 BR2_TARGET_DATAFLASHBOOT_AT91RM9200=y
 # BR2_TARGET_DATAFLASHBOOT_AT91SAM9261 is not set
@@ -144,7 +143,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index b7e4c51..1622cc7 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_DATAFLASHBOOT is not set
 # BR2_TARGET_KWIKBYTE is not set
 
@@ -139,7 +138,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index bfe5bf2..7245b8a 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_DATAFLASHBOOT is not set
 # BR2_TARGET_AT91BOOT_DATAFLASH is not set
 # BR2_TARGET_AT91BOOT_DATAFLASHCARD is not set
@@ -150,7 +149,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 89b5ed4..3de2aea 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -116,7 +116,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
 # BR2_TARGET_AT91BOOT_DATAFLASH is not set
@@ -157,7 +156,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index d5c8837..f1939cc 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_AT91BOOTSTRAP is not set
 # BR2_TARGET_KWIKBYTE is not set
 
@@ -139,7 +138,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index dcc086c..e66a541 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
 # BR2_TARGET_AT91BOOT_DATAFLASH is not set
@@ -158,7 +157,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index b45271c..b8ab5ac 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -618,7 +618,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
 # BR2_TARGET_UBOOT is not set
 BR2_TARGET_AT91BOOTSTRAP=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 2c3894b..b8b5d60 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -118,7 +118,6 @@ BR2_TARGET_AT91SAM9261EK_SPIMODE0=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_DATAFLASHBOOT is not set
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="$(BOARD_NAME)"
@@ -160,7 +159,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 56b1357..e116f44 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -119,7 +119,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_DATAFLASHBOOT is not set
 # BR2_TARGET_AT91BOOTSTRAP is not set
 # BR2_TARGET_KWIKBYTE is not set
@@ -142,7 +141,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 1046cbc..7e0e84f 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -119,7 +119,6 @@ BR2_TARGET_AT91SAM9261EK_SPIMODE0=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_DATAFLASHBOOT is not set
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="$(BOARD_NAME)"
@@ -161,7 +160,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index bd63da5..de2a12d 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91SAM9263EK=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="$(BOARD_NAME)"
 # BR2_TARGET_AT91BOOT_DATAFLASH is not set
@@ -158,7 +157,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index d9ffae6..4efc758 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -119,7 +119,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_AT91BOOTSTRAP is not set
 # BR2_TARGET_KWIKBYTE is not set
 
@@ -141,7 +140,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 2a57166..d757aaa 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -119,7 +119,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="$(BOARD_NAME)"
 # BR2_TARGET_AT91BOOT_DATAFLASH is not set
@@ -160,7 +159,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index e03e7a2..ffe4636 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91SAM9G20DFC=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9g20ek"
 # BR2_TARGET_AT91BOOT_DATAFLASH is not set
@@ -158,7 +157,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index c2f60bb..22676b7 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 # BR2_TARGET_AT91BOOTSTRAP is not set
 # BR2_TARGET_KWIKBYTE is not set
 
@@ -139,7 +138,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 82b7960..2cf2839 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -117,7 +117,6 @@ BR2_TARGET_AT91_ADVANCED_INFO=y
 # Secondary locations
 #
 BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
 # BR2_TARGET_AT91BOOT_DATAFLASH is not set
@@ -158,7 +157,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 1c0a058..b839703 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -68,7 +68,6 @@ BR2_TARGET_AVR32_ATNGW100_BASE=y
 #
 # Secondary locations
 #
-BR2_TARGET_ATMEL_COPYTO=""
 # BR2_TARGET_VALKA is not set
 
 #
@@ -92,7 +91,6 @@ BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 8003c4c..a70a9f9 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -59,7 +59,6 @@ BR2_TARGET_AVR32_ATNGW100=y
 #
 # Secondary locations
 #
-BR2_TARGET_ATMEL_COPYTO=""
 # BR2_TARGET_VALKA is not set
 
 #
@@ -79,7 +78,6 @@ BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 BR2_STAGING_DIR="$(BASE_DIR)/staging"
 
 #
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 54f6e11..ab8b369 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -67,7 +67,6 @@ BR2_TARGET_AVR32_ATSTK1005=y
 #
 # Secondary locations
 #
-BR2_TARGET_ATMEL_COPYTO=""
 BR2_KERNEL_ARCH_PATCH_VERSION="2.6.27.6"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
 # BR2_TARGET_VALKA is not set
@@ -90,7 +89,6 @@ BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 859794b..0a718de 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -68,7 +68,6 @@ BR2_TARGET_AVR32_ATSTK1002=y
 #
 # Secondary locations
 #
-BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_KERNEL_ARCH_PATCH_VERSION="2.6.27.6"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
 # BR2_TARGET_VALKA is not set
@@ -91,7 +90,6 @@ BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 82b77c3..4f8a290 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -92,7 +92,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 5aa20c4..7a9d025 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -92,7 +92,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 067dab0..b7f0c1d 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -88,7 +88,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index e0c1873..e4c15fd 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -88,7 +88,6 @@ BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
-BR2_COPYTO=""
 
 #
 # Mirrors and Download locations
diff --git a/docs/buildroot.html b/docs/buildroot.html
index 71bd72b..bd74c07 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -302,9 +302,6 @@ or
     to the Busybox configuration file</li>
     <li><code>LINUX26_KCONFIG=&lt;path/to/.config&gt;</code>, path
     to the Linux kernel configuration file</li>
-    <li><code>BUILDROOT_COPYTO</code>, an additional location to which
-    the binary images of the root filesystem, kernel, etc. built by
-    Buildroot are copied</li>
     <li><code>BUILDROOT_DL_DIR</code> to override the directory in
     which Buildroot stores/retrieves downloaded files</li>
     </ul>
@@ -321,15 +318,6 @@ $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
 $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 </pre>
 
-    <p>If you want the result of your build to be copied to another directory
-    like /tftpboot for downloading to a board using tftp, then you
-    can use BUILDROOT_COPYTO to specify your location</p>
-    <p>Typically, this is set in your ~/.bashrc file
-
-<pre>
-$ export BUILDROOT_COPYTO=/tftpboot
-</pre>
-
     <h2><a name="custom_targetfs" id="custom_targetfs"></a>Customizing the
     generated target filesystem</h2>
 
diff --git a/target/Makefile.in b/target/Makefile.in
index 8feb564..83dc4a5 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -1,54 +1,6 @@
 BR2_PACKAGE_LINUX_FORMAT:=$(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT))
 BR2_PACKAGE_LINUX_KCONFIG:=$(call qstrip,$(BR2_PACKAGE_LINUX_KCONFIG))
 
-
-# COPY_FILE absolute_path_to_file, target_directory, filename
-ifneq ($(call qstrip,$(BUILDROOT_COPYTO)),)	# Use shell definition
-define COPY_FILE
-	@echo "BUILDROOT_COPYTO: Copy to $(BUILDROOT_COPYTO)/$(strip $(3))" ; \
-	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
-	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
-		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
-	fi ; \
-	mkdir -p $(BUILDROOT_COPYTO) || echo "Could not create $(BUILDROOT_COPYTO)" ; \
-	if [ -d $(BUILDROOT_COPYTO) -o  -w $(BUILDROOT_COPYTO) ] ; then \
-		cp $(1) $(BUILDROOT_COPYTO)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
-	fi
-endef
-COPYTO=$(call qstrip,$(BUILDROOT_COPYTO))
-else
-ifneq ($(call qstrip,$(BR2_COPYTO)),)	# Global override
-define COPY_FILE
-	@echo "BR2_COPYTO: Copy to $(BR2_COPYTO)/$(strip $(3))" ; \
-	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
-	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
-		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
-	fi ; \
-	if [ "$(call qstrip,$(BR2_COPYTO))X" != "X" ] ; then \
-		mkdir -p $(BR2_COPYTO)  || echo "Could not create $(BR2_COPYTO)" ; \
-		if [ -d $(BR2_COPYTO) -o -w $(BR2_COPYTO) ] ; then \
-			cp $(1) $(BR2_COPYTO)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
-		fi ; \
-	fi
-endef
-COPYTO=$(call qstrip,$(BR2_COPYTO))
-else	# Package specific copyto, or empty
-define COPY_FILE
-	@echo "Copy to $(2)/$(strip $(3))" ; \
-	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
-	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
-		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
-	fi ; \
-	if [ "$(call qstrip,$(2))X" != "X" ] ; then \
-		mkdir -p $(2) || echo "Could not create $(2)" ; \
-		if [ -d $(2) -o  -w $(2) ] ; then \
-			cp $(1) $(2)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
-		fi ; \
-	fi
-endef
-endif
-endif
-
 # make sure to put everything that is board-specific before the tarroot targets
 include target/generic/Makefile.in
 
diff --git a/target/device/Atmel/Config.in b/target/device/Atmel/Config.in
index 870c537..1433af4 100644
--- a/target/device/Atmel/Config.in
+++ b/target/device/Atmel/Config.in
@@ -50,13 +50,6 @@ config BR2_AT91_LINUXPATCH_SITE
 	help
 	    Main download location for AT91 Linux stuff
 
-config BR2_TARGET_ATMEL_COPYTO
-	string "also copy the image to..."
-	depends on BR2_TARGET_AT91 || BR2_TARGET_AVR32
-	default "/tftpboot"
-	help
-	  Copies the resulting image to a secondary location.
-
 config BR2_BOARD_PATH
 	string "Atmel board repository"
 	depends on BR2_TARGET_AT91 || BR2_TARGET_AVR32
diff --git a/target/device/Atmel/Makefile.in b/target/device/Atmel/Makefile.in
index 6de54d7..38060aa 100644
--- a/target/device/Atmel/Makefile.in
+++ b/target/device/Atmel/Makefile.in
@@ -14,12 +14,6 @@ ifeq ($(BR2_avr32),y)
 KERNEL_HEADERS_PATCH_DIR=target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2
 endif
 
-ifneq ($(COPYTO),)
-TARGET_ATMEL_COPYTO:=$(call qstrip,$(BR2_COPYTO))
-else
-TARGET_ATMEL_COPYTO:=$(call qstrip,$(BR2_TARGET_ATMEL_COPYTO))
-endif
-
 # These are set by Config.in
 DOWNLOAD_LINUX26_VERSION:= $(call qstrip,$(BR2_DOWNLOAD_LINUX26_VERSION))
 ifeq ($(DOWNLOAD_LINUX26_VERSION),)
-- 
1.7.1
