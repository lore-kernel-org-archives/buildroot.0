From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 13 Nov 2020 00:20:52 +0100
Subject: [Buildroot] [PATCH] toolchain/toolchain-buildroot: only riscv64 is
 supported by uClibc-ng
Message-ID: <20201112232052.3137986-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit [1] enabled riscv32 and riscv64 for uClibc-ng
internal toolchain backend but only riscv64 is curently
supported by uClibc-ng.

The initial patch [2] from Mark Corbin is only about riscv64.

Remove riscv32 from uClibc-ng supported architecture list.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981656

[1] 209a082478fca143394512bb9a6c0822f12cfe2c
[2] bd9810e176273914eca1208bcba23f0de9e446b3

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in                | 1 -
 toolchain/toolchain-buildroot/Config.in | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 494758bd9d..e59fef3c69 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -107,7 +107,6 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "i386"	   if BR2_i386
 	default "x86_64"   if BR2_x86_64
 	default "riscv64"  if BR2_RISCV_64
-	default "riscv32"  if BR2_RISCV_32
 
 config BR2_UCLIBC_MIPS_ABI
 	string
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 6c4ede8d4c..25ac9759f1 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -30,7 +30,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_arm     || BR2_armeb    || \
 		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_riscv || BR2_sh2a   || \
+		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || BR2_sh2a   || \
 		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
 		   BR2_x86_64
 	select BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.25.4
