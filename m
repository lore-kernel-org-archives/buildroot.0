From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  1 Jun 2014 08:58:38 -0300
Subject: [Buildroot] [PATCHv2 1/2] glibc: drop redundant arch depends
Message-ID: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are already in toolchain/toolchain-buildroot/Config.in and since
package/glibc/Config.in is filtered by BR2_TOOLCHAIN_USES_GLIBC there's
no need to duplicate this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/Config.in | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index d1ad3de..dbb1a19 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -3,13 +3,6 @@ if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 choice
 	prompt "glibc version"
 	default BR2_GLIBC_VERSION_2_18
-	# Architectures supported in mainline glibc
-	depends on BR2_arm         || BR2_armeb    || BR2_aarch64 || \
-		   BR2_i386        || BR2_mips     || BR2_mipsel  || \
-		   BR2_mips64      || BR2_mips64el || BR2_powerpc || \
-		   BR2_powerpc64   || BR2_powerpc64le || BR2_sh   || \
-		   BR2_sh64        || BR2_sparc    || BR2_x86_64  || \\
-		   BR2_microblaze
 
 config BR2_GLIBC_VERSION_2_18
 	bool "2.18"
-- 
1.8.5.5
