From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: add support for P5600 cores
Message-ID: <20161015112248.140C27FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73e16457469f18d755c115a77c193c8cdeee00ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 73be3c9..897c944 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -55,6 +55,10 @@ config BR2_mips_m5101
 	bool "M5101"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+config BR2_mips_p5600
+	bool "P5600"
+	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R5
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
@@ -123,6 +127,7 @@ config BR2_GCC_TARGET_ARCH
 	default "interaptiv"	if BR2_mips_interaptiv
 	default "m5100"		if BR2_mips_m5100
 	default "m5101"		if BR2_mips_m5101
+	default "p5600"		if BR2_mips_p5600
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
 	default "mips64r5"	if BR2_mips_64r5
