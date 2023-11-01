Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368FBC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 12:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA204EBD8;
	Wed,  1 Nov 2023 12:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA204EBD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPsiE_99Yx8K; Wed,  1 Nov 2023 12:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F6404EC4D;
	Wed,  1 Nov 2023 12:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F6404EC4D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E67531BF388
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 12:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE7204EBDA
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 12:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE7204EBDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NlSpJGxI5gaP for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 12:56:45 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C28B4EBCF
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 12:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C28B4EBCF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A411A19F576;
 Wed,  1 Nov 2023 13:56:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 Nov 2023 13:56:34 +0100
Date: Wed, 1 Nov 2023 13:56:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jamie Gibbons <jamie.gibbons@microchip.com>
Message-ID: <20231101125634.GB114892@scaer>
References: <20231002105324.2167088-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231002105324.2167088-1-jamie.gibbons@microchip.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698843402;
 bh=Uez/0Wbeg1coz8k1EnmZ3Vax1gkNDHC7xD5n2E/d4BU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IVPF3QMHCsfnKJDkjM2I5fyeWLyO+6RobSgUOTB0C6wkj2UUMuPteDwBkzNRwhjE1
 hfCU6aVCfNpwvqzJdfNLPslCQKqHAPhRKAAzymV4pYyY29XhUWKPLzb6EWGS2erfTX
 QQgxjflU43qiQuRcJ3UUQoEro6tWiRfOES88hv4AqGFXsDENJ8Sc4YtjZ1v8lkkXMe
 QQBS3v37fwqiCbB/UCG5ZE79un3MQg5jhArqz4KKxqKQyyQeX6yNTUFzfQvI8NR+C4
 M00g4eQJYNyKSkEI3Mi36CdqQVr1/cYr06PI5fXzquafczpyB20SsiR4GaTgb+PvnF
 V271ivwIln6ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IVPF3QMH
Subject: Re: [Buildroot] [PATCH 1/1]
 configs/microchip_mpfs_icicle_defconfig: fix zicsr build error
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jamie, All,

On 2023-10-02 11:53 +0100, Jamie Gibbons via buildroot spake thusly:
> Build is failing with an unrecognised opcode error due to missing
> `zicsr` extension requirement. This is introduced with GCC version 12.
> When binutils was updated to v2.38 they updated to the default ISA spec
> version 20191213. In this version the original i extension split into i,
> Zicsr and Zifencei. A fix for this has been added since U-Boot version
> 2022.01 to detect new Zicsr and Zifencei extensions and enable it when needed
> therefore, an updated U-Boot tag to our latest 2023.09 release will fix
> this as in our latest release we have updated to U-Boot version 2023.07.
> Update the kernel verion in line with the U-Boot release version to
> ensure compatiblities and latest features and fixes are included.
> Remove riscv_g selection as it is now selected by default.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/microchip_mpfs_icicle_defconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
> index 54a4d55a5f..1af7a3c474 100644
> --- a/configs/microchip_mpfs_icicle_defconfig
> +++ b/configs/microchip_mpfs_icicle_defconfig
> @@ -1,12 +1,11 @@
>  BR2_riscv=y
> -BR2_riscv_g=y
>  BR2_RISCV_ISA_RVC=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.1-mchp+fpga)/linux4microchip+fpga-2023.06.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.1-mchp+fpga)/linux4microchip+fpga-2023.09.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -16,7 +15,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2023.06.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2023.09.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
>  BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
