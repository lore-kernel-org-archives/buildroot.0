From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Tue,  8 Sep 2020 14:16:20 +0900
Subject: [Buildroot] [PATCH 1/5] toolchain/buildroot: allow uclibc-ng for
 riscv
In-Reply-To: <20200908051624.425573-1-damien.lemoal@wdc.com>
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
Message-ID: <20200908051624.425573-2-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibcb supports RISC-V architecture since version 1.0.31. Allow its
selection for that architecture.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 package/uclibc/Config.in                | 2 ++
 toolchain/toolchain-buildroot/Config.in | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index de2885bc92..35b1cb8e2f 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -106,6 +106,8 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "xtensa"   if BR2_xtensa
 	default "i386"	   if BR2_i386
 	default "x86_64"   if BR2_x86_64
+	default "riscv64"  if BR2_riscv && BR2_ARCH_IS_64
+	default "riscv32"  if BR2_riscv && !BR2_ARCH_IS_6
 
 config BR2_UCLIBC_MIPS_ABI
 	string
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 418d5cb387..49f67c7348 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -32,7 +32,9 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
-		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
+		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64  || \
+		   BR2_riscv
+
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  This option selects uClibc-ng as the C library for the
-- 
2.26.2
