Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0537BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A836483122;
	Mon, 11 Jul 2022 17:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A836483122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbePqmNEhHIJ; Mon, 11 Jul 2022 17:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92501830E2;
	Mon, 11 Jul 2022 17:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92501830E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30A0C1BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 061EE4098E
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061EE4098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLZgMlqczhvI for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEDC740922
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEDC740922
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0A31B83746; Mon, 11 Jul 2022 17:14:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:10:42 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 1b26ef9e45bbe7b5d4cab6717310dc7eb3f84fef
X-Git-Newrev: 20788bc523419060bf4f79ba498a12a57e0697a4
X-Patchwork-Hint: ignore
Message-Id: <20220711171457.0A31B83746@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] support/testing,
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

commit: https://git.buildroot.net/buildroot/commit/?id=20788bc523419060bf4f79ba498a12a57e0697a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
index 94df9ac488..eb6d0e66ff 100644
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
index 06a9ddf2d2..7b65dc4893 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -32,7 +32,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_powerpc64 && BR2_powerpc_power8
 	default y if BR2_powerpc64le && BR2_powerpc_power8
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && !BR2_STATIC_LIBS
-	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D
+	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D && BR2_USE_MMU
 	default y if BR2_s390x && BR2_s390x_z13 && !BR2_STATIC_LIBS
 	default y if BR2_sh && BR2_sh4
 	default y if BR2_sh && BR2_sh4aeb
@@ -3410,6 +3410,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -3436,6 +3437,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
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
