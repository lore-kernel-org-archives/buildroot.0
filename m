From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Oct 2018 13:40:19 +0200
Subject: [Buildroot] [PATCH 1/6] libgpg-error: enable riscv64 support
Message-ID: <df3569102a6ce73ffbde85da1e4ccc7d877ee1b6.1540899624.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgpg-error version 1.28 added support for riscv64.

Cc: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgpg-error/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 40424e41cfff..0659a834bf2f 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -6,9 +6,10 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 		BR2_armeb	|| BR2_i386		|| BR2_mips	|| \
 		BR2_mipsel	|| BR2_mips64		|| BR2_mips64el	|| \
 		BR2_m68k	|| BR2_nios2		|| BR2_powerpc	|| \
-		BR2_powerpc64 	|| BR2_powerpc64le 	|| BR2_sh4	|| \
-		BR2_sh4eb	|| BR2_sh4a		|| BR2_sh4aeb	|| \
-		BR2_sparc	|| BR2_sparc64		|| BR2_x86_64
+		BR2_powerpc64 	|| BR2_powerpc64le 	|| BR2_RISCV_64	|| \
+		BR2_sh4		|| BR2_sh4eb		|| BR2_sh4a	|| \
+		BR2_sh4aeb	|| BR2_sparc		|| BR2_sparc64	|| \
+		BR2_x86_64
 
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
@@ -39,6 +40,8 @@ config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 		if BR2_powerpc
 	default "powerpc64-unknown-linux-gnu" \
 		if BR2_powerpc64 || BR2_powerpc64le
+	default "riscv64-unknown-linux-gnu" \
+		if BR2_RISCV_64
 	default "sh4-unknown-linux-gnu" \
 		if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
 	default "sparc-unknown-linux-gnu" \
-- 
2.19.1
