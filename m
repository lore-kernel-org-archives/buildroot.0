From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:57:07 +0100
Subject: [Buildroot] [git commit] package/libgpg-error: add s390x support
Message-ID: <20201230223935.0DABB8356A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44157d3c6a76cb78b16f308b6f2a394597fa2843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x is supported since version 1.14
http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=8338a4ba93367974758dc5e195f67e9d171d4086

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpg-error/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 415cd015cf..44e9d67aaf 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 		BR2_mipsel	|| BR2_mips64		|| BR2_mips64el	|| \
 		BR2_m68k	|| BR2_nios2		|| BR2_powerpc	|| \
 		BR2_powerpc64 	|| BR2_powerpc64le 	|| BR2_RISCV_64	|| \
-		BR2_RISCV_32	|| BR2_sh4		|| BR2_sh4eb	|| \
-		BR2_sh4a	|| BR2_sh4aeb		|| BR2_sparc	|| \
-		BR2_sparc64	|| BR2_x86_64
+		BR2_RISCV_32	|| BR2_s390x		|| BR2_sh4	|| \
+		BR2_sh4eb	|| BR2_sh4a		|| BR2_sh4aeb	|| \
+		BR2_sparc	|| BR2_sparc64		|| BR2_x86_64
 
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
@@ -44,6 +44,8 @@ config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 		if BR2_RISCV_32
 	default "riscv64-unknown-linux-gnu" \
 		if BR2_RISCV_64
+	default "s390x-unknown-linux-gnu" \
+		if BR2_s390x
 	default "sh4-unknown-linux-gnu" \
 		if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
 	default "sparc-unknown-linux-gnu" \
