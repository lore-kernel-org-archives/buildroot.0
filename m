From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Jul 2010 23:30:50 +0200
Subject: [Buildroot] [PATCH 3/5] Unleash all of git's power: not only clones
In-Reply-To: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1278970252-23007-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Config.in                                 |    4 ++--
 configs/arm_toolchain_defconfig           |    2 +-
 configs/at91rm9200df_defconfig            |    2 +-
 configs/at91rm9200df_ext_bare_defconfig   |    2 +-
 configs/at91rm9200df_ext_defconfig        |    2 +-
 configs/at91sam9260dfc_defconfig          |    2 +-
 configs/at91sam9260dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9260dfc_ext_defconfig      |    2 +-
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
 27 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/Config.in b/Config.in
index 6adfe49..8b22c23 100644
--- a/Config.in
+++ b/Config.in
@@ -38,8 +38,8 @@ config BR2_BZR_UP
 	default "bzr up"
 
 config BR2_GIT
-	string "Git command to download source tree"
-	default "git clone"
+	string "Git command"
+	default "git"
 
 config BR2_ZCAT
 	string "zcat command"
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 4c1e2c2..602e271 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -133,7 +133,7 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 0d453b6..4fd633b 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -138,7 +138,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 1622cc7..a333acf 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -133,7 +133,7 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 7245b8a..3667205 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -144,7 +144,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 3de2aea..fbb72b4 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -151,7 +151,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index f1939cc..cd4020b 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -133,7 +133,7 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index e66a541..d1c4e57 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -152,7 +152,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index b8b5d60..a17ec0b 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -154,7 +154,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index e116f44..30b4c69 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -136,7 +136,7 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 7e0e84f..7e80c0f 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -155,7 +155,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index de2a12d..05f0366 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -152,7 +152,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 4efc758..4b1c716 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -135,7 +135,7 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index d757aaa..e3cecf4 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -154,7 +154,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index ffe4636..3108550 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -152,7 +152,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 22676b7..ac6273e 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -133,7 +133,7 @@ BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 2cf2839..a9c6d92 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -152,7 +152,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KER
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 8c3d80b..c90dbee 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -86,7 +86,7 @@ BR2_TARGET_AVR32_ATNGW100_BASE=y
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 763cad7..9f39fe8 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -73,7 +73,7 @@ BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
 BR2_BZR_CO="bzr co"
 BR2_BZR_UP="bzr up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index ab8b369..8188a77 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -84,7 +84,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_K
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 0a718de..96e6e9d 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -85,7 +85,7 @@ BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_K
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 69e6412..74606ac 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -87,7 +87,7 @@ BR2_TARGET_I686=y
 BR2_WGET="wget --passive-ftp"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index e4d4f98..4a4f2b3 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -87,7 +87,7 @@ BR2_TARGET_I686=y
 BR2_WGET="wget --passive-ftp"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 815d259..cb5a4e4 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -83,7 +83,7 @@ BR2_BOARD_PATH="target/device/ARMLTD/$(BR2_BOARD_NAME)"
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 9b68258..c58a7cb 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -83,7 +83,7 @@ BR2_BOARD_PATH="target/device/ARMLTD/$(BR2_BOARD_NAME)"
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 9300f28..1c22876 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -94,7 +94,7 @@ BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp -nd"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index c85a4d8..65ddcf6 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -65,7 +65,7 @@ BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
-BR2_GIT="git clone"
+BR2_GIT="git"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-- 
1.7.0.4
