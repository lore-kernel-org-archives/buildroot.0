Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C8AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 19:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E11FB403B8;
	Mon, 30 Oct 2023 19:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E11FB403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWW1rhjKIkpO; Mon, 30 Oct 2023 19:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC4CA403AA;
	Mon, 30 Oct 2023 19:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC4CA403AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70FEC1BF37E
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 19:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43B3081FD4
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 19:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43B3081FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRyNkCH1XUVJ for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 19:14:10 +0000 (UTC)
X-Greylist: delayed 669 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 30 Oct 2023 19:14:09 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCBF081FD2
Received: from mxd-2-a01.seznam.cz (mxd-2-a01.seznam.cz
 [IPv6:2a02:598:64:8a00::1000:a01])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCBF081FD2
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 19:14:09 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-6786d888bc-jnlz9
 (smtpc-mxd-6786d888bc-jnlz9 [2a02:598:64:8a00::1000:a01])
 id 50d9b2a5d03ed83852ad8ccb; Mon, 30 Oct 2023 20:14:07 +0100 (CET)
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by smtpd-relay-75b8985f9d-hg2j8 (smtpd/2.0.15) with ESMTPA
 id 13ca9e0c-4809-4571-97f8-c67a3939622d;
 Mon, 30 Oct 2023 20:02:55 +0100
Date: Mon, 30 Oct 2023 20:02:49 +0100
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Message-ID: <ZT_92cB-gzyB56Kf@arch-zen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn20221014; t=1698693247;
 bh=RcGa/tWPuPTDIkzEidkHZw6j3yIoXdfiNYGY/rMkpVI=;
 h=Received:Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition;
 b=x1mFE/W8gbrsK1HJ1F/DS8Q4gL/McWMK+ESQ7ysx37LvixTBmz1IIDcJmCrmXzhkm
 bT8MW4Z2RNZHnggpEavNKTcolOHWe3QgOFG2q9tdMOoUo5TxZ77Gj66XH7DCLSEVF7
 xRiU3CHq3LbuKxCMbJOWhWCJGfIxcQNDqHN+ufzwkTkZF8dWcTLja+vPxCg6yBoJ/Y
 GdPFfnN3ewYWh4+R241rxr6eYO0fWF6z6NA4ul4KVEUcammTvj8VspqGNY8tV9pymV
 fLs8ikYuKaWgy+0SlUhJdS9P0/SCRcD1YpU9P3RSNszSypGnVrz1YpkHzSs89Smu66
 4VyNCFastwV/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn20221014 header.b=x1mFE/W8
Subject: [Buildroot] [PATCH 1/1] configs/pine64_pinecube_defconfig: bump to
 Linux 6.1.60 and U-Boot 2023.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 configs/pine64_pinecube_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/pine64_pinecube_defconfig b/configs/pine64_pinecube_defconfig
index 8f60115f8f..5cdaf59fae 100644
--- a/configs/pine64_pinecube_defconfig
+++ b/configs/pine64_pinecube_defconfig
@@ -4,7 +4,7 @@ BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 
 # Toolchain options
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="pinecube"
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pinecube/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.61"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.60"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-s3-pinecube"
@@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pinecube"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
