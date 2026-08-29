Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF81CC61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 19:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5293D405B7;
	Sat, 29 Aug 2026 19:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsoQ410kbpZn; Sat, 29 Aug 2026 19:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788030120;
	bh=HMArDUT24nbeFMm+vko9Y9St4lfR/rek8zSDSNa9gnY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sDfGNY5mIyr4v+y94F6DjbwRqGkt7/LE8XrEgC2EHW6mFgn+sI4oYHiuF0P1qafhW
	 6U7hbGSuRps/Jpzweri0VB4iZe41RKx5Pap1XTjXnLR5dd2oB9w6g6CUPf6OwKV9bm
	 iBycJMO8Kto2Tb+7mLt02FCTdvd3Hj6BtrYw9IVEuqFYeclBNczeRugXDauo1gMsVO
	 rq6+3ZgCzw6Uj8cY4745dmwUBvikPsFQ7MlRNvwnFvS+aAkAZuOvYwovLXk8nkNePF
	 RUKwGcPHZxIXNE2fJfEEQ8CjmrSEulJ5A+XhQKsPf2qbuZ6Fys3L3k2WxbzILk6mMA
	 mSA2m/Z69dH4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC2740730;
	Sat, 29 Aug 2026 19:02:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B382118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2145D400A5
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92YQ_Ctfr8wW for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 19:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 759C64008C
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:01:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5A288DA30; Sat, 29 Aug 2026 19:01:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 21:00:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e13318329db9a04948850d646075303613b83f7
X-Git-Newrev: dea4bf0eca70b32d2e7ba3d2f5cb4767efe6a6c7
X-Patchwork-Hint: ignore
Message-Id: <20260829190100.C5A288DA30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal2_vek385_defconfig: remove
 useless atf console config
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dea4bf0eca70b32d2e7ba3d2f5cb4767efe6a6c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The VERSAL2_CONSOLE variable does not actually exist when building the atf
with plat=versal2. So the current VERSAL2_CONSOLE=cadence1 is not actually
doing anything. For this reason, the atf will print on its default console
which is UART0 or pl011_0.

The correct definition would be CONSOLE=pl011_1 in order to build the atf to
print on UART1 or pl011_1.

However, the git repo xparameters.h of the versal2_plm is not currently
enabling UART1 because the XPAR_XUARTPSV_NUM_INSTANCES is set to 1 including
the address defines only for UART0.
https://github.com/Xilinx/embeddedsw/blob/97f2baf7f69e9d5f447650110af0d8841e501277/lib/sw_apps/versal_plm/misc/versal_2ve_2vm/xparameters.h#L1519

The problem with this is that the plm is not configuring UART1, so the atf
will crash at boot time, if it is built with CONSOLE=pl011_1 and the plm has
not already enabled UART1.

For now, we will remove the unnecessary config that is doing nothing.  The
versal2_vek385_defconfig is working, but users need to currently open two
console windows to see the boot log because the current config is the
following.

plm - console uart0
asufw - console uart0
atf - console uart0

optee-os - console uart1
u-boot - console uart1
Linux - console uart1

A patch has been submitted to the embeddedsw repo to fix the xparameters.h
file such that the plm will correctly enable UART1. Once this is applied, we
will configure the plm and atf to use UART1 with the versal2_vek385_defconfig.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/versal2_vek385_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 5fe099bc8a..97d8364ec7 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -26,7 +26,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,ar
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,optee_os,xlnx-rebase-v4.9.0_2026.1)/xlnx-rebase-v4.9.0_2026.1.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
