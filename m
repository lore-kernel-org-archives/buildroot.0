Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F92C4708E
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 01:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFAD381E44;
	Thu,  8 Dec 2022 01:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFAD381E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TdXCS66ng8vL; Thu,  8 Dec 2022 01:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 200F081E3A;
	Thu,  8 Dec 2022 01:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 200F081E3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 086FF1BF95D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 01:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1D8960AD6
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 01:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D8960AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0iLAmjPuuDw for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 01:28:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9CA60ACD
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E9CA60ACD
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 01:28:44 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
 by gateway (Coremail) with SMTP id _____8AxDOvHPZFjEgAEAA--.9255S3;
 Thu, 08 Dec 2022 09:28:40 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxr+DEPZFjXZonAA--.32655S2; 
 Thu, 08 Dec 2022 09:28:36 +0800 (CST)
From: Zhiwei Duan <duanzhiwei@loongson.cn>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 09:28:36 +0800
Message-Id: <20221208012836.9991-1-duanzhiwei@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CM-TRANSID: AQAAf8Dxr+DEPZFjXZonAA--.32655S2
X-CM-SenderInfo: hgxd065klzvxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JF43AFy3Xw4DGr18WFWrAFb_yoW7Gw15pr
 93Zw1fGr4xJ3WfGrZIqa4j9r4YyrZ7CayUWF1ayr48AF4DZ34kZr4ktrnruFyUJ34Ygw1k
 ZFyrur4Y9F17AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qE5I8CrVACY4xI64kE6c02F40Ex7xfMIIYY7kG6xAYrbIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYY7kG6xAYrwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWU
 JVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUyTUqUUUUU
Subject: [Buildroot] [PATCH] buildroot: Add basic support for LoongArch
 architecture (toolchain only)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: duanzhiwei@loongson.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this patch, the buildroot can compile the rootfs of the loongarch architecture.
Both external toolchain and buildroot toolchain can compile rootfs.
buildroot toolchain: binutils>=2.38 GCC>=12 Linux>=5.19 glibc>=2.36.

Signed-off-by: Zhiwei Duan <duanzhiwei@loongson.cn>
---
 arch/Config.in               | 16 +++++++++++
 arch/Config.in.loongarch     | 52 ++++++++++++++++++++++++++++++++++++
 package/glibc/Config.in      |  1 +
 support/gnuconfig/config.sub | 11 ++++++--
 toolchain/Config.in          |  2 +-
 5 files changed, 79 insertions(+), 3 deletions(-)
 create mode 100644 arch/Config.in.loongarch

diff --git a/arch/Config.in b/arch/Config.in
index 1c0c400a98..88f805bb1e 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -251,6 +251,17 @@ config BR2_xtensa
 	  http://en.wikipedia.org/wiki/Xtensa
 	  http://www.tensilica.com/
 
+config BR2_loongarch64
+	bool "LOONGARCH64 (little endian)"
+	select BR2_ARCH_IS_64
+	select BR2_USE_MMU
+	help
+	  LOONGARCH is a RISC microprocessor from LOONGARCH Technologies. Little
+	  endian.
+	  https://www.loongson.cn/
+	  #http://en.wikipedia.org/wiki/MIPS_Technologies
+
+
 endchoice
 
 # For some architectures or specific cores, our internal toolchain
@@ -414,6 +425,11 @@ if BR2_xtensa
 source "arch/Config.in.xtensa"
 endif
 
+if BR2_loongarch64
+source "arch/Config.in.loongarch"
+endif
+
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
new file mode 100644
index 0000000000..bf86490cff
--- /dev/null
+++ b/arch/Config.in.loongarch
@@ -0,0 +1,52 @@
+# loongarch config
+config BR2_LOONGARCH_CPU_LOONGARCH64
+	bool
+	select BR2_LOONGARCH_NAN_LEGACY
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_loongarch_64 if BR2_loongarch64
+	depends on BR2_loongarch64
+	help
+	  Specific CPU variant to use
+
+config BR2_loongarch_64
+	bool "Generic LOONGARCH64"
+	depends on BR2_ARCH_IS_64
+	select BR2_LOONGARCH_CPU_LOONGARCH64
+endchoice
+
+config BR2_LOONGARCH_NAN_LEGACY
+	bool
+
+#config BR2_GCC_TARGET_NAN
+#	default "legacy"	if BR2_LOONGARCH_NAN_LEGACY
+
+config BR2_ARCH
+	default "loongarch64"	if BR2_loongarch64
+
+config BR2_NORMALIZED_ARCH
+	default "loongarch"
+
+config BR2_ENDIAN
+	default "LITTLE"	if BR2_loongarch64
+
+config BR2_GCC_TARGET_ARCH
+	default "loongarch64"	if BR2_loongarch_64
+
+config BR2_READELF_ARCH_NAME
+	default "LoongArch"
+
+config BR2_LOONGARCH_SOFT_FLOAT
+        bool "Use soft-float"
+        #default y
+        select BR2_SOFT_FLOAT
+        help
+          If your target CPU does not have a Floating Point Unit (FPU)
+          or a kernel FPU emulator, but you still wish to support
+          floating point functions, then everything will need to be
+          compiled with soft floating point support (-msoft-float).
+
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 71c50504ac..d8325610f5 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_microblaze
 	default y if BR2_nios2
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
+	default y if BR2_loongarch64
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	depends on BR2_USE_MMU
diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 9bc49a7e92..c751ddf15a 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -164,7 +164,7 @@ case $1 in
 						basic_os=$field2
 						;;
 					# Manufacturers
-					dec* | mips* | sequent* | encore* | pc533* | sgi* | sony* \
+					dec* | mips* | loongarch* | sequent* | encore* | pc533* | sgi* | sony* \
 					| att* | 7300* | 3300* | delta* | motorola* | sun[234]* \
 					| unicom* | ibm* | next | hp | isi* | apollo | altos* \
 					| convergent* | ncr* | news | 32* | 3600* | 3100* \
@@ -632,6 +632,11 @@ case $1 in
 				basic_machine=ymp-cray
 				basic_os=unicos
 				;;
+			loongarch)
+				basic_machine=loongarch-loongson
+				basic_os=
+				;;
+
 			*)
 				basic_machine=$1
 				basic_os=
@@ -1211,6 +1216,7 @@ case $cpu-$vendor in
 			| mipsisa64sr71k | mipsisa64sr71kel \
 			| mipsr5900 | mipsr5900el \
 			| mipstx39 | mipstx39el \
+			| loongarch | loongarch64 \
 			| mmix \
 			| mn10200 | mn10300 \
 			| moxie \
@@ -1253,7 +1259,8 @@ case $cpu-$vendor in
 			| x86 | x86_64 | xc16x | xgate | xps100 \
 			| xstormy16 | xtensa* \
 			| ymp \
-			| z8k | z80)
+			| z8k | z80 \
+			| loongarch | loongarch64)
 				;;
 
 			*)
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 4947ab3aae..a4939af6fb 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -24,7 +24,7 @@ config BR2_TOOLCHAIN_USES_UCLIBC
 	# architectures
 	select BR2_TOOLCHAIN_HAS_UCONTEXT if BR2_ARM_CPU_HAS_ARM || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
-		|| BR2_sparc || BR2_x86_64
+		|| BR2_sparc || BR2_x86_64 || BR2_loongarch64
 	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_m68k && !BR2_microblaze && !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_USES_MUSL
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
