From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri,  8 Nov 2019 09:41:10 -0800
Subject: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
In-Reply-To: <20191108174112.28183-1-vgupta@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
Message-ID: <20191108174112.28183-2-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This corresponds to -mcu=hs38 with mpy-option=9 (64-bit multiplier)

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/Config.in.arc | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index c65bb01f1f4f..284951b82cee 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -11,13 +11,19 @@ config BR2_arc750d
 config BR2_arc770d
 	bool "ARC 770D"
 
-config BR2_archs38
+config BR2_archs
 	bool "ARC HS38"
 	help
 	  Generic ARC HS capable of running Linux, i.e. with MMU,
-	  caches and multiplier. Also it corresponds to the default
+	  caches and 32-bit multiplier. Also it corresponds to the default
 	  configuration in older GNU toolchain versions.
 
+config BR2_archs38
+	bool "ARC HS38 with 64-bit mpy"
+	help
+	  Fully featured ARC HS capable of running Linux, i.e. with MMU,
+	  caches and 64-bit multiplier.
+
 	  If you're not sure which version of ARC HS core you  build for
 	  keep this one.
 
@@ -43,7 +49,7 @@ endchoice
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	default y if BR2_arc770d || BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -60,13 +66,14 @@ config BR2_ENDIAN
 config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
 	default "arc700" if BR2_arc770d
-	default "archs"	 if BR2_archs38
+	default "archs"	 if BR2_archs
+	default "hs38"	 if BR2_archs38
 	default "hs38_linux"	 if BR2_archs38_full
 	default "hs4x_rel31"	 if BR2_archs4x_rel31
 
 config BR2_READELF_ARCH_NAME
 	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	default "ARCv2"		if BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 choice
 	prompt "MMU Page Size"
@@ -86,7 +93,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	depends on BR2_arc770d || BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -96,7 +103,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	depends on BR2_arc770d || BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 endchoice
 
-- 
2.20.1
