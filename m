From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 17:46:42 +0100
Subject: [Buildroot] [git commit branch/next] arch/avr32: decommission for
	real
Message-ID: <20150214164752.68AC780454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80be8753d5bacc865ceeee26c55bf4b0c2940e10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have absolutely zero reference to the avr32 architecture, we
can now really decommission the symbol.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in       |   19 -------------------
 arch/Config.in.avr32 |   11 -----------
 2 files changed, 0 insertions(+), 30 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 1719fe6..16ad8be 100644
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
-	depends on BR2_BROKEN
-	help
-	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
-	  Atmel.
-	  http://www.atmel.com/
-	  http://en.wikipedia.org/wiki/Avr32
-
 config BR2_bfin
 	bool "Blackfin"
 	help
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
