From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:48 -0000
Subject: [Buildroot] [git commit] arch/Config.in.arc: introduce the ARC
 optimized hs38 variant
Message-ID: <20191202083932.5F7047FF3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f115b521a4c5715fae1c32a96fff90a102a59af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This corresponds to -mcu=hs38 with mpy-option=9 (64-bit multiplier)

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arc | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index c65bb01f1f..fdfafda31c 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -15,11 +15,17 @@ config BR2_archs38
 	bool "ARC HS38"
 	help
 	  Generic ARC HS capable of running Linux, i.e. with MMU,
-	  caches and multiplier. Also it corresponds to the default
-	  configuration in older GNU toolchain versions.
+	  caches and 32-bit multiplier. Also it corresponds to the
+	  default configuration in older GNU toolchain versions.
 
-	  If you're not sure which version of ARC HS core you  build for
-	  keep this one.
+config BR2_archs38_64mpy
+	bool "ARC HS38 with 64-bit mpy"
+	help
+	  Fully featured ARC HS capable of running Linux, i.e. with
+	  MMU, caches and 64-bit multiplier.
+
+	  If you're not sure which version of ARC HS core you build
+	  for use this one.
 
 config BR2_archs38_full
 	bool "ARC HS38 with Quad MAC & FPU"
@@ -43,7 +49,7 @@ endchoice
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -61,12 +67,13 @@ config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
 	default "arc700" if BR2_arc770d
 	default "archs"	 if BR2_archs38
+	default "hs38"	 if BR2_archs38_64mpy
 	default "hs38_linux"	 if BR2_archs38_full
 	default "hs4x_rel31"	 if BR2_archs4x_rel31
 
 config BR2_READELF_ARCH_NAME
 	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
 
 choice
 	prompt "MMU Page Size"
@@ -86,7 +93,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -96,7 +103,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
 
 endchoice
 
