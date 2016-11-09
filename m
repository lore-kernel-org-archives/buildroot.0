From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:41:07 +0100
Subject: [Buildroot] [git commit] MIPS: remove M5100 core
Message-ID: <20161109214237.1726F819EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84bd58d5bb06bfedb88e8abca53ec5b88ae9b29f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a microcontroller class (MCU) core which is not suitable for
running Linux.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips                    | 5 -----
 package/gcc/Config.in.host             | 5 ++---
 toolchain/toolchain-external/Config.in | 2 +-
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 1021a57..21f0a8d 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -47,10 +47,6 @@ config BR2_mips_interaptiv
 	bool "interAptiv"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R2
-config BR2_mips_m5100
-	bool "M5100"
-	depends on !BR2_ARCH_IS_64
-	select BR2_MIPS_CPU_MIPS32R5
 config BR2_mips_m5101
 	bool "M5101"
 	depends on !BR2_ARCH_IS_64
@@ -146,7 +142,6 @@ config BR2_GCC_TARGET_ARCH
 	default "mips32r5"	if BR2_mips_32r5
 	default "mips32r6"	if BR2_mips_32r6
 	default "interaptiv"	if BR2_mips_interaptiv
-	default "m5100"		if BR2_mips_m5100
 	default "m5101"		if BR2_mips_m5101
 	default "m6201"		if BR2_mips_m6201
 	default "p5600"		if BR2_mips_p5600
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 446df4d..f46656c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -64,9 +64,8 @@ choice
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# Unsupported MIPS cores
-		depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && \
-			!BR2_mips_m5101 && !BR2_mips_m6201 && !BR2_mips_i6400 && \
-			!BR2_mips_p6600
+		depends on !BR2_mips_interaptiv && !BR2_mips_m5101 && \
+			!BR2_mips_m6201 && !BR2_mips_i6400 && !BR2_mips_p6600
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5324599..22f760b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -530,7 +530,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 		BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && !BR2_mips_m5101
+	depends on !BR2_mips_interaptiv && !BR2_mips_m5101
 	# Unsupported for MIPS R6
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
