Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC08C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5588C41588;
	Tue,  7 Jun 2022 20:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoJth141Fx4J; Tue,  7 Jun 2022 20:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FFFC415CC;
	Tue,  7 Jun 2022 20:36:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14C121BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0410940569
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wtCujceFAg5 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:36:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE51940123
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:36:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 4E496240008;
 Tue,  7 Jun 2022 20:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654634168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvSGkE2ISLR9reXDjHZdS2ElMYYVXXlRPOV1OKyHJj0=;
 b=IUBAkyZZgPa467/uF6D26PgD2xa1N+ifi3OeDQE8G6GnPaqHOodV51SSJsNuZMWhovS4OC
 MVKYXa0nbN7HjwARQpgBa48cFewyR2Gj31ksMDStj1zc9Zb2k10Hya33QjbKARpANmU2W9
 jq8rjHIdpT8hjDsWjc5l/hn+Lcfyk+y5PSUhiS5Kc657NHhy9ig2nR0Y1CgeyDE9C+HBUd
 FG3o+Es/SpRKN6diGVR1cEpcrZ44P4Fe8gy11/aJAeBDURlEPvROyqubqFsdwjTUeqbxQ+
 IQynN6VZc7qSQYqfAkbXzyAGgLFCt9x9hvESgu8Vja2QDqkMxXcyLzbyq3aipg==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Jun 2022 22:35:43 +0200
Message-Id: <20220607203553.3307479-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
References: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/11]  support/testing,
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows to get a proper description of the dependencies for
the RISC-V 64-bit toolchain, that includes the BR2_USE_MMU dependency.

Fixes:

  http://autobuild.buildroot.net/results/d6aee9b275b1ec399aea59758ac8f69fdc5691fc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/toolchain/test_external_bootlin.py    | 6 ++++++
 .../toolchain-external-bootlin/Config.in.options            | 4 +++-
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
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
