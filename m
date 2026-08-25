Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223F5C5DF94
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD57809C4;
	Tue, 25 Aug 2026 08:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWlJP62PwnFw; Tue, 25 Aug 2026 08:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787648276;
	bh=29VoEFEvw3r5de/xLsUvAM29a7HY8xtNGL8I35/SX9Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oNTqXB+d9pavPKWR4PLaZwYqY3ZLTp8Bh1EmPwkdmG1727qi+bHt5hOgCprAmxHRG
	 np86PlH6x2lvU8cgd/WhEWG7aiamKDnacP+gbE4IPV9YH0BpnQ5JeI2OhjCjY+luD9
	 baYPfCxrBI2Ik6TxOiu9XFevXk3vHiDbengd8c3r+78MZ+18w6NMG/EJwzNgWVxSbJ
	 4qw9Zwyo+DHR7AfQzYxpM2i3yCKhNg5v+98KjrDP6eh8Y2XCR8PuVH+gY8TJhaOg4K
	 YoVPAA+1eitpDqMZF5Xmfp05B5sHLzPd3DJh75NAJtDYkHbaUwG0NfuvYnky6S+TTh
	 VUgZ5id17DuVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C526880A9F;
	Tue, 25 Aug 2026 08:57:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4178C396
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EAF940306
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzRQfBSPGAK3 for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78A18402D6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:57:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13CAC916E7; Tue, 25 Aug 2026 08:56:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 10:49:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06426297c4e50c3394d494b7cd907b9c84222d85
X-Git-Newrev: a7072372c62c81be39136cc10e600b73021d8a0f
X-Patchwork-Hint: ignore
Message-Id: <20260825085659.13CAC916E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal2_vek385_defconfig: config
 atf to load optee-os
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7072372c62c81be39136cc10e600b73021d8a0f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the option to configure the atf to load the optee-os binary:
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y

Without this, everything was still booting, and even though the versal2_plm
was loading the optee-os to its runtime location, it was never actually
loaded by the atf.

With this option enabled, atf is now properly loading optee with the boot log
below.

NOTICE:  BL31: Executing from 0xbbf00000
NOTICE:  BL31: Secure code at 0x1800000
NOTICE:  BL31: Non secure code at 0x40000000
NOTICE:  BL31: v2.14.0(release):custom
NOTICE:  BL31: Built : 08:41:36, Aug 25 2026
KATs execution completed.
In task dispatch loop
I/TC:
I/TC: Non-secure external DT found
I/TC: pl011: device parameters ignored (115200n8)
I/TC: Switching console to device: /axi/serial@f1930000
I/TC: OP-TEE version: Unknown_4.9 (gcc version 14.3.0 (Buildroot 2021.11-18033-g83947c7bb6)) #1 Mon Aug 24 08:45:53 UTC 2026 aarch64
I/TC: WARNING: This OP-TEE configuration might be insecure!
I/TC: WARNING: Please check https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
I/TC: Primary CPU initializing
I/TC: Cluster shift early-configured: 1 (cores per cluster: 2)
I/TC: ASU initialization complete
I/TC: OP-TEE OS Running on Platform AMD Versal Gen 2
I/TC: ASU ECC: NIST_P192=SW NIST_P224=SW NIST_P256=HW
I/TC: ASU ECC: NIST_P384=SW NIST_P521=SW
I/TC: ASU RSA driver successfully initialized
I/TC: Primary CPU switching to normal world boot

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/versal2_vek385_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 76eb455043..5fe099bc8a 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx-rebase-v2.14_2026.1)/xlnx-rebase-v2.14_2026.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
