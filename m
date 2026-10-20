Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B232606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FR7wxcRO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADC498110F;
	Tue, 20 Oct 2026 10:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfttTQyJYclE; Tue, 20 Oct 2026 10:21:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4DA35810E2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491690;
	b=QNl4oZ6aJn5HOdTvu6Uot0XixllZBCKn0RL6YJDf12bxa8bts7xRe/OOBMnWq4mZRaiX
	 WdMzfwUWIt7NuXJLM+N48349gqs8doHFpqcIdSKEF3N+8mPNWzucZuAXywhWhiSD+Ykh0
	 qpTHcuLiZMH57GVsagGpBdt6r1UMsz6Uz/g8nsbne/UGPC8HlqamrJIX0FkdEVugb7yiD
	 ZlqQkwJajAda9HN3AJvxf6ZuIJKWza4KgjyR4+sY6tbpCpUW+p1DmCFJ97gA5tU0DMcop
	 8zD9mIa77kKKkaU1u/jgJhI18J2vUJcGV7KwlouL58vxG790f2BM3l9sktrVACym/RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491690;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=TuR6ZIXze29YL5A/CFj4231zco0hSCDCCzbGrA6ZbJ8=;
	b=O2GC/EZQZiO7x/faiLliAWe7smhdq/pFzAUhi97OgrU+gKzMQmXwsEz6inV2AXfXDWFy
	 Qen4B6g/9A19CGCFlbhFIT6VDvK6VpHvNjTG867gJQCOIjcuRWoz2X5Sq9XrGoe/M8xmi
	 zuiYbJA45+JVsDAXvGBJ57lnnWONOu9yvE7r5X9i1pDW+PojhQkuquR8WyBfTEhObfReL
	 bEHESa5Tc1xfCJ0cpOGUWZ1ONSAp0fg/2ah8v0KYnNpUAG8FCoEe9vx+ARSwmFBhqUfLt
	 pUkCRw1LjQRZzdEKIMq7Qrk7LsrlFE9jCi9ODvtIUcODnAUFDm4dlu+4mea611ksMSQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491690;
	bh=TuR6ZIXze29YL5A/CFj4231zco0hSCDCCzbGrA6ZbJ8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FR7wxcROK5JZhhc3kg4YP1WI+/2pR5b9kV+FcV8yvKSG/ZSLkCtOABLwHaPRKR4bc
	 s4PUZimdJd53a9okDdryz3XXZqM4MZaVHfPpruo9bb2VtpfTM4MiHw67fg2j6c2OEU
	 6W5SkYMWrwho9iWQ9zcpqppyuGhiVuVR/+JEybc1xW9HOeCs50R3pqeyx5td1iUdAE
	 hIXAqXlbODSLHTU1i5FVItxOtVUGwU53tMHgOUC50eRc6AMUjYRzQz3AhBmWVH1N6A
	 jIxwpBX6gbB27GZVjltfmBlNAJc4UsXapgE8vA4mSw6/SsIhEpZoH0t/X87SiVGgWw
	 YoK5VHvCyUC2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA35810E2;
	Tue, 20 Oct 2026 10:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A37563A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9536740741
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvcodRNYGOP4 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DFC6C40750
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491686;
 b=CQNIo6f1kMF/2nsIPsfITcZL076JhpaHUQ9CbFAQyIV7Fur1PtCYe12vxxei8TwrRYmr
 7zVl/tCqmpEshd6+KkBaq8sxf6jrGvKspT7+D3/nfc3mS2t041y35B31cbIhypnty9Edb
 syWQcKgfL11mNbOfaUXHgPdTACZzUiD6G4z/2e0U0l9YG6aIE1O9xmj0cqwBxqLPLdB10
 B3ghm4ww49X5te4RTE6TSm4VXjoilxHLFI7pNKZGSWMLC4jo8UUhznl9e/FHP0HQsug4y
 3/GkdaVwVY36Ugk/MhKzv+lajH16DkrvmQN/61PGHRd2SlDLcAa9WrqMv+MKyunevuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491686;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uvjTWYv57z0l8ethnIyR/8XClIBPOl+VxuMpuau/jUw=;
 b=fwgEnXVB/Bv/0mYZC/h86Pn+BjwQxAWh82A258ruXIGOMNMc5EhV9xFmybr6GCVmdRFG
 NJlOJtJv1u2Mp2HwEeYpoQ8nU418fmDY0EI5MhaTTzD2qZMlBNq6NY152tRAW9HZzfnqd
 jqc2EkZ74kbBK6Y1GmpOUu5xX7xuyvYdyzXOiZZ8CAtmlBhQTMThuFCrxHfb0YMtKXLP4
 XXLtRGXP1bBNWMEKmxzoBIVkdk531HveHzqca9fiUwqQMxjrSEKVcpwe5cbmn9COcKzHi
 c9sdXMGLvdihB09+HTkSs+lRSdu2n14B9/7AtcZlCytfqM+UcMF9qXrXUG2CWq8WDqA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFC6C40750
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E931499717; Tue, 20 Oct 2026 10:20:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:20:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e2e370316f3b3e5cf8714dfc230a57ef3f7802a
X-Git-Newrev: b89d3a408f87b4638bb1ec802decf11c23193445
X-Patchwork-Hint: ignore
Message-Id: <20261020102003.E931499717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx93frdm: bump U-Boot,
 TF-A and Linux to LF6.18.37-2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b89d3a408f87b4638bb1ec802decf11c23193445
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Which is based on U-boot 2026.04, TF-A 14.1, Linux 6.18.37.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash          | 2 +-
 board/freescale/imx93frdm/patches/linux/linux.hash                  | 2 +-
 board/freescale/imx93frdm/patches/uboot/uboot.hash                  | 2 +-
 configs/freescale_imx93frdm_defconfig                               | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index bf39f1e9c7..54ee264ade 100644
--- a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d7813f4ad5431edb162d6be2775bc021f9007b9c6934e977330291168523a507  imx-atf-lf-6.18.20-2.0.0.tar.gz
+sha256  c7b92f0da1a154ebabd4425a1627a726d8e0206e8b417d8c87b5a9636b52a3e5  imx-atf-lf-6.18.37-2.1.0.tar.gz
diff --git a/board/freescale/imx93frdm/patches/linux/linux.hash b/board/freescale/imx93frdm/patches/linux/linux.hash
index 222ec55328..df7905fa4e 100644
--- a/board/freescale/imx93frdm/patches/linux/linux.hash
+++ b/board/freescale/imx93frdm/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a8f55764fd1418db8adfd2711c0abb7d5464a8ee1cbfd0f6878f1059ecfa1316  linux-imx-lf-6.18.20-2.0.0.tar.gz
+sha256  352273c5098d73762074997a89537f06994d6a1c2e9d291dd8431dfe4fa0be27  linux-imx-lf-6.18.37-2.1.0.tar.gz
diff --git a/board/freescale/imx93frdm/patches/uboot/uboot.hash b/board/freescale/imx93frdm/patches/uboot/uboot.hash
index 01e860b59e..1baa3185cf 100644
--- a/board/freescale/imx93frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx93frdm/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  96942f8c49736b7d40277891bf0a34cfdd0afb59390f79b65b2b33b3bbd19f61  uboot-imx-lf-6.18.20-2.0.0.tar.gz
+sha256  b9aa6a73f670f02a0903e3298923c3aa802ba3ffb7a53f6c397d28998c3ee8d8  uboot-imx-lf-6.18.37-2.1.0.tar.gz
diff --git a/configs/freescale_imx93frdm_defconfig b/configs/freescale_imx93frdm_defconfig
index 53875cc020..788af67e37 100644
--- a/configs/freescale_imx93frdm_defconfig
+++ b/configs/freescale_imx93frdm_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.20-2.0.0)/linux-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.37-2.1.0)/linux-imx-lf-6.18.37-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-frdm"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.20-2.0.0)/imx-atf-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.37-2.1.0)/imx-atf-lf-6.18.37-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.20-2.0.0)/uboot-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.37-2.1.0)/uboot-imx-lf-6.18.37-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_frdm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx93frdm/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
