Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D5C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2641160F49;
	Mon, 11 Jul 2022 17:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2641160F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwnHMsQR-bHu; Mon, 11 Jul 2022 17:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2A1360F3C;
	Mon, 11 Jul 2022 17:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2A1360F3C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 032011BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50A6040922
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50A6040922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKUxoXwKiOSI for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0631C40926
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0631C40926
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 34D6F83748; Mon, 11 Jul 2022 17:14:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:10:43 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9038e5d1c8203b222e5d768fcbb6d1e417bb0e0f
X-Git-Newrev: 0e9ee998737b8d18488651ab92957feac8a814ee
X-Patchwork-Hint: ignore
Message-Id: <20220711171457.34D6F83748@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e9ee998737b8d18488651ab92957feac8a814ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This commit regenerates the toolchain-external-bootlin Config.in file
after the ARM toolchain description was modified to make sure they
only match the ARM little endian configurations.

Fixes:

  http://autobuild.buildroot.net/results/7befbb686bb972016ba4e742976dcdb3fed1be11/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b079f584c0cc33c57b1b1a12b8b8eb1fe47d0b98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external-bootlin/Config.in.options   | 28 ++++++++++++++++++----
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
