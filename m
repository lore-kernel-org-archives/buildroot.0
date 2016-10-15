From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:17 +0200
Subject: [Buildroot] [git commit] MIPS: target architecture variants select
	the appropriate CPU ISA
Message-ID: <20161015112247.5405381F55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f62cbd75b7f56d1842c9d59e6779b0e869d164f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 5e97fd0..8771cd5 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -26,21 +26,27 @@ choice
 config BR2_mips_32
 	bool "mips 32"
 	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32
 config BR2_mips_32r2
 	bool "mips 32r2"
 	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R2
 config BR2_mips_32r6
 	bool "mips 32r6"
 	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R6
 config BR2_mips_64
 	bool "mips 64"
 	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64
 config BR2_mips_64r2
 	bool "mips 64r2"
 	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64R2
 config BR2_mips_64r6
 	bool "mips 64r6"
 	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64R6
 endchoice
 
 
