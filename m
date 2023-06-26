Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD6EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 17:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5EA14159D;
	Mon, 26 Jun 2023 17:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5EA14159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ey0JwESds245; Mon, 26 Jun 2023 17:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BEC404AF;
	Mon, 26 Jun 2023 17:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BEC404AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 538E91BF37B
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 394A560B27
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 394A560B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAJ9EEOR4dIU for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 17:10:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0969660B16
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0969660B16
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:10:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:88cf:b268:1dd:7043])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F2E8B2003D3;
 Mon, 26 Jun 2023 19:10:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Jun 2023 19:10:47 +0200
Date: Mon, 26 Jun 2023 19:10:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20230626171047.GE646621@scaer>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-7-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626160030.93063-7-bmeng.cn@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687799453;
 bh=zRUci51V0fbB7ovCC6Gs2bUgVKsHsfe+jBRdBvTuHyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pu69n+BQG50iObiVx4aGXckUCUjkCUH0/qR+x4TkT6f/gfDc8vZW9KIxZoCSN9go7
 A89//XqedbN5kU9Dl/VjdfheUidNaznjRaiFL3rMjo3RZbnAjgowWE/iOrULUKuKkI
 tlrOx9s/8kQ9nnqcpw6KtspTIJdprO63phxJrnfmd1jyrCsTeLzE1wWY3HoLcHiP8s
 ArXqIKBdpINy7Ptjcw41hQtaXCW3YMx9IZFQ/FcucTgt3jcIzB2JfiLiFVU+5KJHOV
 X7q4VcH8DSzCgrnK1WLyLPa0T1oJ2hW+PB/bg56087TPMjLm9Szf30ljeA6eMnSCzE
 xdZZGi4Msatog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pu69n+BQ
Subject: Re: [Buildroot] [PATCH 06/10] configs: riscv: Drop
 BR2_TARGET_OPENSBI_CUSTOM_VERSION
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bin, All,

On 2023-06-27 00:00 +0800, Bin Meng spake thusly:
> From: Bin Meng <bmeng@tinylab.org>
> 
> Since commit 64f1f82385b2 ("boot/opensbi: Bump to version 1.2"),
> the default OpenSBI version has been bumped up to 1.2. With that,
> there is no need to define a custom version in each RISC-V board's
> defconfig files.

In fact, no, because opensbi is a "critical" component part of the boot
chain and, like uboot or the kernel, we want to pin the version we use
in defconfig files. We only want the v ersion to be bumped in defconfig,
when someone actually tested the defconfig still generates a bootable
system.

Regards,
Yann E. MORIN.

> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>  configs/hifive_unleashed_defconfig      | 2 --
>  configs/nezha_defconfig                 | 2 --
>  configs/qemu_riscv32_virt_defconfig     | 2 --
>  configs/qemu_riscv64_virt_defconfig     | 2 --
>  configs/sipeed_lichee_rv_defconfig      | 2 --
>  configs/sipeed_lichee_rv_dock_defconfig | 2 --
>  configs/spike_riscv64_defconfig         | 2 --
>  7 files changed, 14 deletions(-)
> 
> diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
> index 80c5e48f96..013a1423c0 100644
> --- a/configs/hifive_unleashed_defconfig
> +++ b/configs/hifive_unleashed_defconfig
> @@ -38,8 +38,6 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  
>  # Bootloader
>  BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
> index dd94707905..b4c5b4d0ba 100644
> --- a/configs/nezha_defconfig
> +++ b/configs/nezha_defconfig
> @@ -15,8 +15,6 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
>  BR2_TARGET_UBOOT=y
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index 03c871282e..01922ac151 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -25,8 +25,6 @@ BR2_LINUX_KERNEL_IMAGE=y
>  
>  # Bootloader
>  BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  
>  # host-qemu for gitlab testing
> diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> index 666500d889..8b729f137d 100644
> --- a/configs/qemu_riscv64_virt_defconfig
> +++ b/configs/qemu_riscv64_virt_defconfig
> @@ -25,8 +25,6 @@ BR2_LINUX_KERNEL_IMAGE=y
>  
>  # Bootloader
>  BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  
>  # host-qemu for gitlab testing
> diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
> index 750d2d6e3b..8ad587d35f 100644
> --- a/configs/sipeed_lichee_rv_defconfig
> +++ b/configs/sipeed_lichee_rv_defconfig
> @@ -14,8 +14,6 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
>  BR2_TARGET_UBOOT=y
> diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
> index a228cd8cb7..b6ac7aa31f 100644
> --- a/configs/sipeed_lichee_rv_dock_defconfig
> +++ b/configs/sipeed_lichee_rv_dock_defconfig
> @@ -22,8 +22,6 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
>  BR2_TARGET_UBOOT=y
> diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
> index 73ea566084..a6f746eb3f 100644
> --- a/configs/spike_riscv64_defconfig
> +++ b/configs/spike_riscv64_defconfig
> @@ -9,8 +9,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  BR2_TARGET_ROOTFS_CPIO=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
>  BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
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
