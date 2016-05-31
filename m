From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 31 May 2016 12:13:17 +0100
Subject: [Buildroot] [PATCH v2 next 6/7] Disable gcc-4.8 + binutils >= 2.25
	+ MIPS combination
Message-ID: <1464693198-16523-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 2fda0dd7d491e6e926ace1cd09ad2fb241356232 disabled the gcc-4.8 +
binutils-2.25 + MIPS combination. But now that we have BINUTILS_AT_LEAST
options we can use them in order to disable all combinations for future
versions of binutils.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gcc/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 61d3dbe..4e45029 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -42,8 +42,8 @@ choice
 		depends on !BR2_cortex_a12 && !BR2_cortex_a17
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_power8
-		# gcc-4.8.x + binutils-2.25 is broken for MIPS
-		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
+		# gcc-4.8.x + binutils >= 2.25 is broken for MIPS
+		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25)
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		select BR2_GCC_NEEDS_MPC
-- 
2.7.3
