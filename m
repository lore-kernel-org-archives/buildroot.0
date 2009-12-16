From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Dec 2009 20:02:19 +0100
Subject: [Buildroot] [git commit master] defconfigs: use new default
	location for STAGING_DIR
Message-ID: <20091216190433.314B077792@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=13975944738104ce7394f9f2bf22fca19887285f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Grant Edwards <grant.b.edwards@gmail.com>

Use the new default STAGING_DIR location (output/staging) in all the
defconfigs for clarity.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/arm_toolchain_defconfig           |    2 +-
 configs/at91rm9200df_defconfig            |    2 +-
 configs/at91rm9200df_ext_bare_defconfig   |    2 +-
 configs/at91rm9200df_ext_defconfig        |    2 +-
 configs/at91sam9260dfc_defconfig          |    2 +-
 configs/at91sam9260dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9260dfc_ext_defconfig      |    2 +-
 configs/at91sam9260pf_defconfig           |    2 +-
 configs/at91sam9261ek_defconfig           |    2 +-
 configs/at91sam9261ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9261ek_ext_defconfig       |    2 +-
 configs/at91sam9263ek_defconfig           |    2 +-
 configs/at91sam9263ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9263ek_ext_defconfig       |    2 +-
 configs/at91sam9g20dfc_defconfig          |    2 +-
 configs/at91sam9g20dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9g20dfc_ext_defconfig      |    2 +-
 configs/atngw100-base_defconfig           |    2 +-
 configs/atngw100_defconfig                |    2 +-
 configs/atstk1005_defconfig               |    2 +-
 configs/atstk100x_defconfig               |    2 +-
 configs/i386_defconfig                    |    2 +-
 configs/i686_defconfig                    |    2 +-
 configs/integrator926_defconfig           |    2 +-
 configs/integrator926_huge_defconfig      |    2 +-
 configs/kb9202_defconfig                  |    2 +-
 configs/v100sc2_defconfig                 |    2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index e7f9358..f044e51 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -156,7 +156,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="/usr/local/$(ARCH)/gcc-$(BR2_GCC_VERSION)-uclibc"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 76408c0..3d98b0f 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -161,7 +161,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 8025782..84f6b7e 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -156,7 +156,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 2965ffe..1dea062 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -167,7 +167,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 4e50465..1b4094e 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -174,7 +174,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index b4d349a..d99cfa2 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -156,7 +156,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 70a00dc..14bdc7a 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -175,7 +175,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index 2cdabd0..c668e03 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -70,7 +70,7 @@ BR2_SOURCEFORGE_MIRROR="easynews"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX="wchar"
 BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 69b19e4..9598085 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -177,7 +177,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 662667b..4c534a7 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -159,7 +159,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 06cb986..e7da95a 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -178,7 +178,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index e8f84f8..145700d 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -175,7 +175,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 60ebfeb..185372c 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -158,7 +158,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 1668d23..15b4d3b 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -177,7 +177,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 451b29a..a6ef10c 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -175,7 +175,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index c503a29..3feef30 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -156,7 +156,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index f8dbe9d..96d9793 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -175,7 +175,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index d89daa1..6fbc0de 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -109,7 +109,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 6e244eb..7a6cba4 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -109,7 +109,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index ffca235..309ac08 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -107,7 +107,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 0b75e47..b4abff9 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -108,7 +108,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index b94f4f3..97067c4 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -109,7 +109,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 51720b1..a3a2683 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -109,7 +109,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index a595621..2d2579b 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -105,7 +105,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index d4cf501..380e2e1 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -105,7 +105,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 3b6b615..608eb86 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -113,7 +113,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 6b56972..336953e 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -84,7 +84,7 @@ BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 #
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # BR2_FPU_SUFFIX is not set
 BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
-- 
1.6.3.3
