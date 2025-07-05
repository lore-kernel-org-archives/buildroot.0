Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4148C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625376110F;
	Sat,  5 Jul 2025 17:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-fLdda_fC4A; Sat,  5 Jul 2025 17:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C7C610D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C7C610D3;
	Sat,  5 Jul 2025 17:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9793F445
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAF9683661
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Invg0glpHUYi for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4CCB81186
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4CCB81186
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A26BE85FEA; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 286f5bacd750be4855deb60a9f2d183ba4d9ad6f
X-Git-Newrev: 54895db9c10a26283b25a393cb6c872d72c245d1
X-Patchwork-Hint: ignore
Message-Id: <20250705174708.A26BE85FEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: Introduce LoongArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54895db9c10a26283b25a393cb6c872d72c245d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce LoongArch64 at architecture level.

Config.in.loongarch is prepared for possible loongarch32
enablement in future, thus BR2_ARCH_IS_64 is being depended
by some 64bit only options.

Internal toolchain is supported, as our minimal binutils
version is already beyond LoongArch minimal version and
GCC option is limited by BR2_ARCH_NEEDS_GCC_AT_LEAST_12.

BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT is selected temporary
and it's going to be rmoved after we gain libc support.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[Julien: fix typo in Kconfig BR2_LOONGARCH_ABI_LP64S prompt
  replace "lp64d" by "lp64s"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS               |   3 ++
 arch/Config.in           |  15 ++++++
 arch/Config.in.loongarch | 128 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d2a3e9385b..f232b52867 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1642,6 +1642,9 @@ F:	package/libuhttpd/
 F:	package/libuwsc/
 F:	package/rtty/
 
+N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
+F:	arch/Config.in.loongarch
+
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
diff --git a/arch/Config.in b/arch/Config.in
index c60c42c1c5..f23fdf65b6 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -80,6 +80,17 @@ config BR2_i386
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
 
+config BR2_loongarch64
+	bool "LoongArch64"
+	select BR2_USE_MMU
+	select BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+	help
+	  LoongArch64 is 64-bit architecture developed by Loongson.
+	  http://www.loongson.cn/
+	  https://en.wikipedia.org/wiki/Loongson
+
 config BR2_m68k
 	bool "m68k"
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
@@ -383,6 +394,10 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
+if BR2_loongarch64
+source "arch/Config.in.loongarch"
+endif
+
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
new file mode 100644
index 0000000000..cf2a12ce42
--- /dev/null
+++ b/arch/Config.in.loongarch
@@ -0,0 +1,128 @@
+# LoongArch CPU
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_loongarch64_generic if BR2_ARCH_IS_64
+
+config BR2_loongarch64_generic
+	bool "Generic LoongArch 64-bit"
+	depends on BR2_ARCH_IS_64
+	help
+	  Generic LoongArch 64-bit processor.
+
+config BR2_loongarch64_v1_0
+	bool "LoongArch64 ISA version 1.0"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	help
+	  LoongArch64 ISA version 1.0 processor.
+
+config BR2_loongarch64_v1_1
+	bool "LoongArch64 ISA version 1.1"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	help
+	  LoongArch64 ISA version 1.1 processor.
+
+endchoice
+
+choice
+	prompt "FPU Type"
+	default BR2_LOONGARCH_FPU_64
+
+config BR2_LOONGARCH_FPU_64
+	bool "64"
+	help
+	  Allow the use of hardware floating-point instructions for
+	  32-bit and 64-bit operations.
+
+config BR2_LOONGARCH_FPU_32
+	bool "32"
+	help
+	  Allow the use of hardware floating-point instructions for
+	  32-bit operations only.
+
+config BR2_LOONGARCH_FPU_NONE
+	bool "none"
+	help
+	  Prevent the use of hardware floating-point instructions.
+endchoice
+
+choice
+	prompt "SIMD Type"
+	default BR2_LOONGARCH_SIMD_NONE
+
+config BR2_LOONGARCH_SIMD_NONE
+	bool "none"
+	help
+	  Prevent the use of hardware SIMD instructions.
+
+config BR2_LOONGARCH_SIMD_LSX
+	bool "LSX"
+	help
+	  Enable generating instructions from the 128-bit LoongArch SIMD
+	  Extension (LSX).
+
+config BR2_LOONGARCH_SIMD_LASX
+	bool "LASX"
+	help
+	  Enable generating instructions from the 256-bit LoongArch
+	  Advanced SIMD Extension (LASX) and the 128-bit LoongArch
+	  SIMD Extension (LSX).
+endchoice
+
+choice
+	prompt "Target ABI"
+	default BR2_LOONGARCH_ABI_LP64D if BR2_ARCH_IS_64 && BR2_LOONGARCH_FPU_64
+	default BR2_LOONGARCH_ABI_LP64F if BR2_ARCH_IS_64 && BR2_LOONGARCH_FPU_32
+	default BR2_LOONGARCH_ABI_LP64S if BR2_ARCH_IS_64 && BR2_LOONGARCH_SIMD_NONE
+
+config BR2_LOONGARCH_ABI_LP64D
+	bool "lp64d"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_LOONGARCH_FPU_64
+
+config BR2_LOONGARCH_ABI_LP64F
+	bool "lp64f"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_LOONGARCH_FPU_64 || BR2_LOONGARCH_FPU_32
+
+config BR2_LOONGARCH_ABI_LP64S
+	bool "lp64s"
+	depends on BR2_ARCH_IS_64
+endchoice
+
+config BR2_ARCH
+	default "loongarch64" if BR2_ARCH_IS_64
+
+config BR2_NORMALIZED_ARCH
+	default "loongarch"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_GCC_TARGET_ARCH
+	default "loongarch64" if BR2_loongarch64_generic
+	default "la64v1.0" if BR2_loongarch64_v1_0
+	default "la64v1.1" if BR2_loongarch64_v1_1
+
+config BR2_GCC_TARGET_FPU
+	default "64" if BR2_LOONGARCH_FPU_64
+	default "32" if BR2_LOONGARCH_FPU_32
+	default "none" if BR2_LOONGARCH_FPU_NONE
+
+config BR2_GCC_TARGET_SIMD
+	default "lasx" if BR2_LOONGARCH_SIMD_LASX
+	default "lsx" if BR2_LOONGARCH_SIMD_LSX
+	default "none" if BR2_LOONGARCH_FPU_NONE
+
+config BR2_GCC_TARGET_ABI
+	default "lp64d" if BR2_LOONGARCH_ABI_LP64D
+	default "lp64f" if BR2_LOONGARCH_ABI_LP64F
+	default "lp64s" if BR2_LOONGARCH_ABI_LP64S
+
+config BR2_READELF_ARCH_NAME
+	default "LoongArch"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
