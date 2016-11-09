From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:41:51 +0100
Subject: [Buildroot] [git commit] MIPS: rename M5101 core to M5150
Message-ID: <20161109214237.24AAD81D68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2bae3b523aedd3ccf798c492f525660c4943770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

m5101 is the -march option for GCC, but the real core name is M5150.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips                    | 6 +++---
 package/gcc/Config.in.host             | 2 +-
 toolchain/toolchain-external/Config.in | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 21f0a8d..29a967d 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -47,8 +47,8 @@ config BR2_mips_interaptiv
 	bool "interAptiv"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
-config BR2_mips_m5101
-	bool "M5101"
+config BR2_mips_m5150
+	bool "M5150"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
 config BR2_mips_m6201
@@ -142,7 +142,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips32r5"	if BR2_mips_32r5
 	default "mips32r6"	if BR2_mips_32r6
 	default "interaptiv"	if BR2_mips_interaptiv
-	default "m5101"		if BR2_mips_m5101
+	default "m5101"		if BR2_mips_m5150
 	default "m6201"		if BR2_mips_m6201
 	default "p5600"		if BR2_mips_p5600
 	default "mips32r2"	if BR2_mips_xburst
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index f46656c..eb1479a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -64,7 +64,7 @@ choice
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# Unsupported MIPS cores
-		depends on !BR2_mips_interaptiv && !BR2_mips_m5101 && \
+		depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
 			!BR2_mips_m6201 && !BR2_mips_i6400 && !BR2_mips_p6600
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 22f760b..476b37b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -530,7 +530,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 		BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv && !BR2_mips_m5101
+	depends on !BR2_mips_interaptiv && !BR2_mips_m5150
 	# Unsupported for MIPS R6
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
