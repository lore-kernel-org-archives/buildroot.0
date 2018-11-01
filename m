From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 13:53:30 +0100
Subject: [Buildroot] [git commit] libgpg-error: enable riscv64 support
Message-ID: <20181101131712.02E7483CAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b32d92f456b638f33551f6b9a17d9fe11ea50d71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgpg-error version 1.28 added support for riscv64.

Cc: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpg-error/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 40424e41cf..0659a834bf 100644
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
