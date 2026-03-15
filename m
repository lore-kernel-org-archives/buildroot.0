Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77332F30273
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 15:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2231C826C1;
	Sun, 15 Mar 2026 15:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwJ8U-BLHDI2; Sun, 15 Mar 2026 15:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B40CD826A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773587932;
	bh=TZrzk5GZj3gE8WncHO267tf7fTgHeSznN7hqeB9SxZc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f2sDjqTzbCRS+iBteZ5SKQUikecOJQpzfZdjgUCQVbLpaDbc1UBZwxfnGN1E3nig1
	 e8fWKLGVv6W9zkLSWcL1TZ5BOpY17dcYACjvF+JR5lDRnBaa9qRy3K99uBCg5Y+LzF
	 45sF1EAwhbu88SLHejPFYhZRQRdVVePCeOnG36iiWyLM48st9PIFajDWzBfOhbO9ho
	 sSAWnZXpW39R/fPUg9PEJ4OOGC8Ivrfsd5TNDbeOwRTx40iVeC0C1P2aXS6X1eM4tJ
	 0koJPNVNQl6d8gZkwucU7d/mOWal+Tiu3yb2zgga1sdgqLZIBB9uM4KId4xMouxxzJ
	 VZt+ehSu2dKHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B40CD826A8;
	Sun, 15 Mar 2026 15:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C98AA201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD85760AEF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZZMsXQ3L32N for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 15:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A0E60ADD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22A0E60ADD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6079F85080; Sun, 15 Mar 2026 15:18:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 14:22:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cb765faa68a4ea7abf6445009f0586063aa4d4a
X-Git-Newrev: 86d453a7dc084175a8234464acf7590a37bfd8e0
X-Patchwork-Hint: ignore
Message-Id: <20260315151846.6079F85080@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-arm-arm: bump to 15.2.rel1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86d453a7dc084175a8234464acf7590a37bfd8e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the ARM external toolchain to the latest 15.2.rel1
release from ARM.

This involves:
- Updating the version, site URL, and source filename in .mk
- Updating the SHA256 hash in .hash
- Updating the display name and GCC version dependency in Config.in

Verified by booting on a default Qemu configuration.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/toolchain-external/toolchain-external-arm-arm/Config.in | 8 ++++----
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.hash    | 8 ++++----
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk      | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 7b1a7fb27f..992ba09518 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -3,18 +3,18 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 14.2.rel1"
+	bool "Arm ARM 15.2.rel1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 9a657a5ed4..ce3797ac34 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  32301a5a33aab47810837cdab848a5a513ca22804d3168d3ada5833828b07912  arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  3fe832f9c831323a37ff54bfb5ac7a083acdd473f2c93feaf0cb3c1ac690d739  arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  3c65d820a6b8f677f8f6fbfc749fe00a4f16dde12341436c9df5b7092a47c0fb  arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  6e5871df39a38b3a4c1374ea06f82fe0fe0c2927ddd2c060401fd60a5d045859  arm-gnu-toolchain-15.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 86937a7412..f82f1ab196 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 14.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 15.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
