From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 15 Oct 2016 12:26:12 +0100
Subject: [Buildroot] [PATCH] openblas: use MIPS specific cores for P5600 and
	I6400
Message-ID: <20161015112612.40379-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openblas/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 1fbed1c..de26ab3 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -27,10 +27,10 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PPC440"       if BR2_powerpc_440
 	default "PPC440FP2"    if BR2_powerpc_440fp
 	# P5600 is built with MSA support which is only available in Codescape toolchains
-	default "P5600"        if BR2_MIPS_CPU_MIPS32R2 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
+	default "P5600"        if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	default "SICORTEX"     if BR2_MIPS_CPU_MIPS64
 	# I6400 is built with MSA support which is only available in Codescape toolchains
-	default "I6400"        if BR2_MIPS_CPU_MIPS64R6 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
+	default "I6400"        if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	default "SPARC"        if BR2_sparc
 	# Cortex-A15 always have a VFPv4
 	default "CORTEXA15"    if (BR2_cortex_a15 && BR2_ARM_EABIHF)
-- 
2.10.0
