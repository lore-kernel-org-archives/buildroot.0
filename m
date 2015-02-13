From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Feb 2015 23:34:31 +0100
Subject: [Buildroot] [PATCH 12/12] arch/avr32: decommission for real
In-Reply-To: <cover.1423866603.git.yann.morin.1998@free.fr>
References: <cover.1423866603.git.yann.morin.1998@free.fr>
Message-ID: <11ccc5cb61715123a995c19b9fc279a4ae2c78ad.1423866603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have absolutely zero reference to the avr32 architecture, we
can now really decommission the symbol.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in       | 19 -------------------
 arch/Config.in.avr32 | 11 -----------
 2 files changed, 30 deletions(-)
 delete mode 100644 arch/Config.in.avr32

diff --git a/arch/Config.in b/arch/Config.in
index 6c8f328..16ad8be 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -194,21 +194,6 @@ config BR2_xtensa
 
 endchoice
 
-config BR2_avr32
-	bool
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
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
@@ -328,10 +313,6 @@ if BR2_aarch64
 source "arch/Config.in.aarch64"
 endif
 
-if BR2_avr32
-source "arch/Config.in.avr32"
-endif
-
 if BR2_bfin
 source "arch/Config.in.bfin"
 endif
diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
deleted file mode 100644
index fc1f4f6..0000000
--- a/arch/Config.in.avr32
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_ARCH
-	default "avr32"
-
-config BR2_ENDIAN
-	default "BIG"
-
-config BR2_GCC_TARGET_ARCH
-	default "ap"
-
-config BR2_ARCH_HAS_ATOMICS
-	default y
-- 
1.9.1
