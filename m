Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65061C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF408338B;
	Mon, 11 Jul 2022 17:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF408338B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MkECca5KaLO; Mon, 11 Jul 2022 17:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B5A83381;
	Mon, 11 Jul 2022 17:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B5A83381
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBB5C1BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF56F60F3C
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF56F60F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVZUSI62w5H2 for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD9460F42
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD9460F42
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1D35D837E7; Mon, 11 Jul 2022 17:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:09:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: aecfe0ed3429850477a1267ab49bb50f55b7d5f3
X-Git-Newrev: 42976b8edc2ae2d0ab87fd4623ef7bc72215291c
X-Patchwork-Hint: ignore
Message-Id: <20220711171517.1D35D837E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] support/testing,
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate
 with latest gen-bootlin-toolchains script
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42976b8edc2ae2d0ab87fd4623ef7bc72215291c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This commit allows to get a proper description of the dependencies for
the RISC-V 64-bit toolchain, that includes the BR2_USE_MMU dependency.

Fixes:

  http://autobuild.buildroot.net/results/d6aee9b275b1ec399aea59758ac8f69fdc5691fc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f55b660f9b4803c46ba50cdb755a5e07ee786552)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/toolchain/test_external_bootlin.py            | 6 ++++++
 .../toolchain-external/toolchain-external-bootlin/Config.in.options | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index cf6174303e..d0721c4de3 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -2056,6 +2056,7 @@ class TestExternalToolchainBootlinRiscv64lp64dGlibcBleedingEdge(TestExternalTool
         BR2_riscv_g=y
         BR2_RISCV_64=y
         BR2_RISCV_ABI_LP64D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE=y
@@ -2073,6 +2074,7 @@ class TestExternalToolchainBootlinRiscv64lp64dGlibcStable(TestExternalToolchain)
         BR2_riscv_g=y
         BR2_RISCV_64=y
         BR2_RISCV_ABI_LP64D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
@@ -2090,6 +2092,7 @@ class TestExternalToolchainBootlinRiscv64lp64dMuslBleedingEdge(TestExternalToolc
         BR2_riscv_g=y
         BR2_RISCV_64=y
         BR2_RISCV_ABI_LP64D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE=y
@@ -2107,6 +2110,7 @@ class TestExternalToolchainBootlinRiscv64lp64dMuslStable(TestExternalToolchain):
         BR2_riscv_g=y
         BR2_RISCV_64=y
         BR2_RISCV_ABI_LP64D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
@@ -2124,6 +2128,7 @@ class TestExternalToolchainBootlinRiscv64lp64dUclibcBleedingEdge(TestExternalToo
         BR2_riscv_g=y
         BR2_RISCV_64=y
         BR2_RISCV_ABI_LP64D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE=y
@@ -2141,6 +2146,7 @@ class TestExternalToolchainBootlinRiscv64lp64dUclibcStable(TestExternalToolchain
         BR2_riscv_g=y
         BR2_RISCV_64=y
         BR2_RISCV_ABI_LP64D=y
+        BR2_USE_MMU=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index db81d9c7b5..f3c6a3e0f6 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -32,7 +32,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_powerpc64 && BR2_powerpc_power8
 	default y if BR2_powerpc64le && BR2_powerpc_power8
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && !BR2_STATIC_LIBS
-	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D
+	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D && BR2_USE_MMU
 	default y if BR2_sh && BR2_sh4
 	default y if BR2_sh && BR2_sh4aeb
 	default y if BR2_sparc64 && BR2_sparc_v9 && !BR2_STATIC_LIBS
@@ -3409,6 +3409,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -3435,6 +3436,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
