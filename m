Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3A6C04FDE
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 08:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E34440247;
	Mon, 12 Dec 2022 08:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E34440247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEbwCmRXSZyj; Mon, 12 Dec 2022 08:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2146540255;
	Mon, 12 Dec 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2146540255
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E98881BF32A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 08:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2F9540247
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 08:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F9540247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Of8KzztMrBpV for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 08:35:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8D0E401A1
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8D0E401A1
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 08:35:06 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
 by gateway (Coremail) with SMTP id _____8Dxvuu155Zj7vkEAA--.11563S3;
 Mon, 12 Dec 2022 16:35:02 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxmFex55ZjIEEsAA--.24209S2; 
 Mon, 12 Dec 2022 16:34:58 +0800 (CST)
From: Zhiwei Duan <duanzhiwei@loongson.cn>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 16:34:57 +0800
Message-Id: <20221212083457.8308-1-duanzhiwei@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CM-TRANSID: AQAAf8BxmFex55ZjIEEsAA--.24209S2
X-CM-SenderInfo: hgxd065klzvxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JF43AFy3Xw4DGr18WFWrAFb_yoW7Gw15pr
 93Zw1fGr4xJ3WfGrZIqa4j9r4YyrZ7CayUWF1ayr48AF4DZ34kZr4ktrnruFyUJ34Ygw1k
 ZFyrur4Y9F17AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
 j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
 W8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
Subject: [Buildroot] [PATCH v3] buildroot: Add basic support for LoongArch
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
