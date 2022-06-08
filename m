Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08464C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A308883F80;
	Wed,  8 Jun 2022 07:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAJyyzIxmM_y; Wed,  8 Jun 2022 07:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D5F583F67;
	Wed,  8 Jun 2022 07:11:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F21211BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF7AD83F4F
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7rZfLiQf4x3 for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73D7B83F4C
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 3033BFF804;
 Wed,  8 Jun 2022 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baKPq52M/835ecCB9bFKPjmk+ZuDKPsrNzlEIqIRos0=;
 b=QYAxq8mGFXtEdeyOjw2mvvEnU2CMTjiCEdGKxUnwYFZUh6ButT0PiUmigWYaDF8iQhnbD3
 a1JWxm29PAG6EGdjQPLq4hNzPGlaXY1NkD7WJQ0dOKTy3ClSytxQ1NLEsdo1bpN3HBKANu
 LV/loYR+AwlnzKnJc2Gq0/UaUMe3i8ERQ5FaK5ZqOEEj7Lx3A56rLFrwq7QH09FUN7TSlM
 CFt+g4ju2c23+DjbMVGDxVLt6SBsLCYOUvm3oRmRfcWw7dOUgqYa40FFz7NMohMM8T96Ih
 cen3QEn+hDp6T9bZlnsKIKnw2WsJG4/0YC2I7Jt2kG61jK1/u4AvZASobLXkvw==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:16 +0200
Message-Id: <20220608071027.3384469-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 04/14]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate with
 BR2_ARM dependency
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

This commit regenerates the toolchain-external-bootlin Config.in file
after the ARM toolchain description was modified to make sure they
only match the ARM little endian configurations.

Fixes:

  http://autobuild.buildroot.net/results/7befbb686bb972016ba4e742976dcdb3fed1be11/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../Config.in.options                         | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 7b65dc4893..825556a5da 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -6,10 +6,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_aarch64_be
 	default y if BR2_arcle && BR2_arc750d
 	default y if BR2_arcle && BR2_archs38
-	default y if BR2_ARM_CPU_ARMV5 && BR2_ARM_EABI
-	default y if BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF
-	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF
-	default y if BR2_ARM_CPU_ARMV7M
+	default y if BR2_arm && BR2_ARM_CPU_ARMV5 && BR2_ARM_EABI
+	default y if BR2_arm && BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF
+	default y if BR2_arm && BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF
+	default y if BR2_arm && BR2_ARM_CPU_ARMV7M
 	default y if BR2_m68k_m68k
 	default y if BR2_m68k_cf
 	default y if BR2_microblazebe
@@ -438,6 +438,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 	bool "armv5-eabi glibc bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
@@ -463,6 +464,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 	bool "armv5-eabi glibc stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
@@ -488,6 +490,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
 	bool "armv5-eabi musl bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
@@ -512,6 +515,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
 	bool "armv5-eabi musl stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
@@ -536,6 +540,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
 	bool "armv5-eabi uclibc bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -560,6 +565,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
 	bool "armv5-eabi uclibc stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -584,6 +590,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armv6-eabihf glibc bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
@@ -609,6 +616,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 	bool "armv6-eabihf glibc stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
@@ -634,6 +642,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armv6-eabihf musl bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
@@ -658,6 +667,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
 	bool "armv6-eabihf musl stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
@@ -682,6 +692,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armv6-eabihf uclibc bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -706,6 +717,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 	bool "armv6-eabihf uclibc stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -730,6 +742,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf glibc bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
@@ -755,6 +768,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	bool "armv7-eabihf glibc stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
@@ -780,6 +794,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armv7-eabihf musl bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
@@ -804,6 +819,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	bool "armv7-eabihf musl stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
@@ -828,6 +844,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf uclibc bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -852,6 +869,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	bool "armv7-eabihf uclibc stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -876,6 +894,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
 	bool "armv7m uclibc bleeding-edge 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -897,6 +916,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 	bool "armv7m uclibc stable 2021.11-1"
+	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
