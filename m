From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 15 Mar 2016 11:28:29 +0000
Subject: [Buildroot] [PATCH 1/2] Disable gcc-4.8.x + binutils-2.26 + MIPS
	combination
Message-ID: <1458041310-65003-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the same reason as we disabled it for binutils-2.25 before.

See 2fda0dd7d491e6e926ace1cd09ad2fb241356232 for details.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gcc/Config.in.host | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4845708..513899e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -42,8 +42,9 @@ choice
 		depends on !BR2_cortex_a12 && !BR2_cortex_a17
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_power8
-		# gcc-4.8.x + binutils-2.25 is broken for MIPS
-		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
+		# gcc-4.8.x + binutils >= 2.25 is broken for MIPS
+		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && \
+			   (BR2_BINUTILS_VERSION_2_25_X || BR2_BINUTILS_VERSION_2_26_X))
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		select BR2_GCC_NEEDS_MPC
-- 
2.4.10
