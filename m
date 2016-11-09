From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:42:12 +0100
Subject: [Buildroot] [git commit] MIPS: rename M6201 core to M6250
Message-ID: <20161109214237.343D7819EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5b3fa3ae4f1cbeac6ab19ee763c7118ab3b1d80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

m6201 is the -march option for GCC, but the real core name is
M6250.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips        | 6 +++---
 package/gcc/Config.in.host | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 29a967d..ce41e9e 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -51,8 +51,8 @@ config BR2_mips_m5150
 	bool "M5150"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
-config BR2_mips_m6201
-	bool "M6201"
+config BR2_mips_m6250
+	bool "M6250"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R6
 config BR2_mips_p5600
@@ -143,7 +143,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips32r6"	if BR2_mips_32r6
 	default "interaptiv"	if BR2_mips_interaptiv
 	default "m5101"		if BR2_mips_m5150
-	default "m6201"		if BR2_mips_m6201
+	default "m6201"		if BR2_mips_m6250
 	default "p5600"		if BR2_mips_p5600
 	default "mips32r2"	if BR2_mips_xburst
 	default "mips64"	if BR2_mips_64
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index eb1479a..0a63e6a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -65,7 +65,7 @@ choice
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# Unsupported MIPS cores
 		depends on !BR2_mips_interaptiv && !BR2_mips_m5150 && \
-			!BR2_mips_m6201 && !BR2_mips_i6400 && !BR2_mips_p6600
+			!BR2_mips_m6250 && !BR2_mips_i6400 && !BR2_mips_p6600
 		# musl mips64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
@@ -76,7 +76,7 @@ choice
 		depends on !BR2_arc
 		depends on !BR2_microblaze
 		# Unsupported MIPS cores
-		depends on !BR2_mips_m6201 && !BR2_mips_p6600
+		depends on !BR2_mips_m6250 && !BR2_mips_p6600
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 endchoice
