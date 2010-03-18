From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 18 Mar 2010 15:38:59 -0500
Subject: [Buildroot] [PATCH] cleanup defconfig's due to removal of -mm
	options
Message-ID: <0D753D10438DA54287A00B02708426976368AC7578@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The defconfig's should be checked for bitrot soon.  For now
we might as well get rid of the MM stuff.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 3d98b0f..1c5f652 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -968,8 +968,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -995,8 +993,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 1dea062..cd16196 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -893,8 +893,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -920,8 +918,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 1b4094e..2b658f5 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -983,8 +983,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -1010,8 +1008,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 14bdc7a..29c4620 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -902,8 +902,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -929,8 +927,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 9598085..5b1d57d 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -1034,8 +1034,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -1061,8 +1059,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index e7da95a..dff2c35 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -990,8 +990,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -1017,8 +1015,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 145700d..a025456 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -1031,8 +1031,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -1058,8 +1056,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 15b4d3b..f991e78 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -952,8 +952,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -979,8 +977,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index a6ef10c..e97eace 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -898,8 +898,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -925,8 +923,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 96d9793..1692247 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -901,8 +901,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -928,8 +926,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 6fbc0de..ed628d1 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -780,8 +780,6 @@ BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_THIS_VERSION="2.6.29"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_29=y
 # BR2_LINUX_2_6_28 is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 7a6cba4..a087641 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -794,8 +794,6 @@ BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_PATCH_LEVEL="2"
 BR2_KERNEL_THIS_VERSION="2.6.29"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_29=y
@@ -821,8 +819,6 @@ BR2_KERNEL_ADD_LATEST_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 # BR2_KERNEL_ARCH_PATCH_ENABLED is not set
 BR2_LINUX_BSP_PATCH=""
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 309ac08..25ae903 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -814,8 +814,6 @@ BR2_KERNEL_PATCH_LEVEL="13"
 BR2_KERNEL_NEXT_VERSION="2.6.28"
 BR2_KERNEL_THIS_VERSION="2.6.27"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 # BR2_LINUX_2_6_28 is not set
@@ -841,8 +839,6 @@ BR2_KERNEL_ADD_LATEST_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
 # BR2_ARCH_AVR32_2_6_28_2 is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index b4abff9..2bb011a 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -911,8 +911,6 @@ BR2_KERNEL_PATCH_LEVEL="13"
 BR2_KERNEL_NEXT_VERSION="2.6.28"
 BR2_KERNEL_THIS_VERSION="2.6.27"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 # BR2_LINUX_2_6_28 is not set
@@ -938,8 +936,6 @@ BR2_KERNEL_ADD_LATEST_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
 # BR2_ARCH_AVR32_2_6_28_2 is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 97067c4..38e466d 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -741,8 +741,6 @@ BR2_KERNEL_LATEST_2_6_22="19"
 BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_29 is not set
 # BR2_LINUX_2_6_28 is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index a3a2683..b34aca2 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -741,8 +741,6 @@ BR2_KERNEL_LATEST_2_6_22="19"
 BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_29 is not set
 # BR2_LINUX_2_6_28 is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 2d2579b..012ba7f 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -746,8 +746,6 @@ BR2_KERNEL_LATEST_2_6_22="19"
 BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_28 is not set
 # BR2_LINUX_2_6_27 is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 380e2e1..139dd46 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -722,8 +722,6 @@ BR2_KERNEL_LATEST_2_6_22="19"
 BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_28 is not set
 # BR2_LINUX_2_6_27 is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 608eb86..60cd334 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -696,8 +696,6 @@ BR2_KERNEL_CURRENT_VERSION="2.6.24.4"
 BR2_KERNEL_NEXT_VERSION="2.6.25"
 BR2_KERNEL_THIS_VERSION="2.6.24"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_24=y
 # BR2_LINUX_2_6_23 is not set
