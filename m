From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Feb 2015 23:34:20 +0100
Subject: [Buildroot] [PATCH 01/12] arch: kill avr32
In-Reply-To: <cover.1423866603.git.yann.morin.1998@free.fr>
References: <cover.1423866603.git.yann.morin.1998@free.fr>
Message-ID: <26bedb8c0497ac792a6bf89554e4178901d98d77.1423866603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

avr32 was slated for removal in 2015.02. Make it so!

This patch only definitively hides the symbol. When all references
to it are eradicated (to come in followup patches), we'll eventually
kill the symbol altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .defconfig     |  1 -
 arch/Config.in | 30 +++++++++++++++---------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/.defconfig b/.defconfig
index 77ab11a..585be55 100644
--- a/.defconfig
+++ b/.defconfig
@@ -6,7 +6,6 @@ BR2_HAVE_DOT_CONFIG=y
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
-# BR2_avr32 is not set
 # BR2_cris is not set
 # BR2_ia64 is not set
 BR2_i386=y
diff --git a/arch/Config.in b/arch/Config.in
index 890e7e2..6c8f328 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -53,21 +53,6 @@ config BR2_aarch64
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
 	  http://en.wikipedia.org/wiki/ARM
 
-config BR2_avr32
-	bool "AVR32"
-	select BR2_SOFT_FLOAT
-	# This architecture is obsolete and complicated to maintain to
-	# do the lack of upstream support in the major toolchain
-	# components. If you're interested by AVR32, contact the
-	# Buildroot community. Otherwise, its support will be removed
-	# by the 2015.02 release.
-	depends on BR2_DEPRECATED_SINCE_2014_08
-	help
-	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
-	  Atmel.
-	  http://www.atmel.com/
-	  http://en.wikipedia.org/wiki/Avr32
-
 config BR2_bfin
 	bool "Blackfin"
 	help
@@ -209,6 +194,21 @@ config BR2_xtensa
 
 endchoice
 
+config BR2_avr32
+	bool
+	select BR2_SOFT_FLOAT
+	# This architecture is obsolete and complicated to maintain to
+	# do the lack of upstream support in the major toolchain
+	# components. If you're interested by AVR32, contact the
+	# Buildroot community. Otherwise, its support will be removed
+	# by the 2015.02 release.
+	depends on BR2_DEPRECATED_SINCE_2014_08
+	help
+	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
+	  Atmel.
+	  http://www.atmel.com/
+	  http://en.wikipedia.org/wiki/Avr32
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
1.9.1
