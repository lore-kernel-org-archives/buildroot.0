Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728A5CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 12:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE5384293;
	Fri,  8 May 2026 12:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lh2OpRAIa66z; Fri,  8 May 2026 12:35:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16CC9841B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778243702;
	bh=hAZxSzu2XPzTgEgbgYcSX0jA+fb2sfK9JnRP2EFvIFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bnorBkCTTkxTdxoE2WaF7UFzhN+Ksqn1CclQDZ6+duZqMUQJYHtH1zVTFIEyuQIWk
	 Q4RYvRAX+dVMLAMMj6V+1WY6NbVFW/TbV4IzH03sFY+mDeuQp/INvQc10f2Vfs1dxq
	 nkgSG04IpO7b2suEEPDdiCEwcbqrsMS1SNtUDW1jf0uW8eY5UVxt4NRFdyaJ+QqQ6h
	 gmWx8FbefZO2Bq4qc5aDbxYjQv0WxJpk+ePTWb9NcdI6ulhz+2jWpi4FA09qfcHGPH
	 Hm3sHM43awftBZVCpjJgK5n9DR4ug+rGtlGdsrORTp0hcRGg2FDLP2s4duaQV6TVj5
	 fPKKa09SWweMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CC9841B7;
	Fri,  8 May 2026 12:35:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A534F317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96CF841B5A
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8jKQOuEbUDs for <buildroot@buildroot.org>;
 Fri,  8 May 2026 12:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A80941067
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A80941067
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:34:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3F1085463; Fri,  8 May 2026 12:34:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 13:02:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb6872d948e971a53fa88fef4a3472a98b942aec
X-Git-Newrev: b9b88d2d6a569a05d8eb0f4f7fd73c4eaa5983ed
X-Patchwork-Hint: ignore
Message-Id: <20260508123456.C3F1085463@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_tda4vm_sk_defconfig: pick
 starter kit r5 and uboot defconfig files
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9b88d2d6a569a05d8eb0f4f7fd73c4eaa5983ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix TDA4VM Starter-Kit defconfig pointing to TD4VM EVM instead of SK R5 and uboot
defconfigs.
The starter kit board boots just fine with the evm defconfigs, but it is more accurate
to use the start kit defconfigs for the starter kit board.

Note: those defconfigs have been present upstream since uboot v2024.10:
https://source.denx.de/u-boot/u-boot/-/commit/c9507f07a1d6c92bd1f73fd64384f8c5994be9c2

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
[Julien: add note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ti_tda4vm_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_tda4vm_sk_defconfig b/configs/ti_tda4vm_sk_defconfig
index 3da0fe77b2..be2529fb37 100644
--- a/configs/ti_tda4vm_sk_defconfig
+++ b/configs/ti_tda4vm_sk_defconfig
@@ -29,12 +29,12 @@ BR2_TARGET_OPTEE_OS_PLATFORM="k3-j721e"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
-BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_evm_r5"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_sk_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_evm_a72"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_sk_a72"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
