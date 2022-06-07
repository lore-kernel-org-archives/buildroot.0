Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F20C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1B9460D76;
	Tue,  7 Jun 2022 20:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_hPy8jV4Qf5; Tue,  7 Jun 2022 20:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA96260B60;
	Tue,  7 Jun 2022 20:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAC8B1BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8414415D1
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cRhiCUVQ-O-t for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E270941588
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:36:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C749724000C;
 Tue,  7 Jun 2022 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654634170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baKPq52M/835ecCB9bFKPjmk+ZuDKPsrNzlEIqIRos0=;
 b=FmnC3O0OtUOs0rzPeMRRphZcl6oWHp7hswDF947YaANQSrwumINovI3P/qyhPjxuhC9NJq
 lWAxPili1qNZ0nHEaFADIPgvRGKlEtL+3I0Qt5OG9ZQ8LvzIoaRu/Z/F9tjVtvokrWNOKv
 Mrr+uo5vgPgHhAkiIkPS/liJSgELgSe2UPW/V1WGbVI/il3ks+kFmjM4uQsRdGbIN4CVLM
 JWCyQhEgVRWZSMiaCTU4u57a+4OCdwV+nyt5xQzZdLGjDeGTl6D8VpbvSH07ZkhblgNi3L
 GJnOrfK19UnloQPKrhRLrFdwCyYcOog/hrV71DwG+YI2wG2R3ohA5adk+wIjqw==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Jun 2022 22:35:45 +0200
Message-Id: <20220607203553.3307479-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
References: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/11]
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
