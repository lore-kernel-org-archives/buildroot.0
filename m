Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6299CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 17:02:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBC760FDA
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 17:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFBC760FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9440C81013;
	Sun, 17 Oct 2021 17:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XmHIUJyi-nzT; Sun, 17 Oct 2021 17:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3D3C81A46;
	Sun, 17 Oct 2021 17:02:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B64CB1BF404
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 17:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B10B440108
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 17:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uayL5rmGisNy for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 17:02:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 757DC400F5
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 17:02:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2FC1F780373;
 Sun, 17 Oct 2021 19:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634490147;
 bh=TwCBujrC+XNmLjWMv5FYfRvoX4jq3LwPxR1jAF3fH+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QcRLEQmu//WqZgeKnW9OGTpiiSvymnv4Gr/yPuuuPTTYTH59rzGg3iP4xUYAmIeBd
 RlDAV/zTpdVy0HM33aLwPhfc7um49oiXtqudIWJHYLcosBAtUdcry1KZ9mnjn/yLRp
 05oxyDawf4/4oJpFcyfd1uMXPtv6riUACXBxnhyI4QFk/Vto4DdVNndv8yIXaPir8x
 fWpyiCNXNuWk8TmiDiWClJyb7+6xkpT7/jwkl3MO+GZtIUlqfjw/zvZn2WHdfuousy
 69KPhMQQV4EyocEMAb6gZAE7BtOGW/fEQ/lsoET0QQPoEH3gmY+DNxmtlqoNcZG9hi
 7TF7suDgQ+ZGg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 19:02:17 +0200
Date: Sun, 17 Oct 2021 19:02:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211017170217.GF2400@scaer>
References: <20211003124027.343390-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211003124027.343390-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/5] configs: remove qemu_csky defconfigs
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
Cc: Guo Ren <ren_guo@c-sky.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2021-10-03 14:40 +0200, Romain Naour spake thusly:
> We are going to remove the gcc fork for csky since it doesn't build
> with the latest compilers (gcc 8, 10, 11 tested) [1].
> 
> Removing theses defconfigs and the csky gcc fork has become unavoidable
> since the Buildroot Docker image used by the gitlab CI will switch soon
> to Debian bullseye soon [2].
> 
> The cksy gcc fork based on gcc 6 has not been updated since it has been
> added to Buildroot [3]. Since then, csky has been added to binutils and
> gcc but using the latest upstream version (binutils 2.37 and gcc 11) is
> not yet possible due to build issue with glibc 2.34 [4].
> 
> Moreover, qemu_csky defconfigs was to be used with the csky qemu fork
> (based on Qemu 3.x) added by commit [5] and removed by commit [6].
> Since then it's not possible to do a runtime test with theses
> defconfigs.
> 
> Theses defconfigs can be added back later if the csky toolchain support
> is fixed and csky supported by upstream Qemu.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-August/621504.html
> [2] 71b83227128be62c169313e85bb8f339f977ad67
> [3] 7873a5bd5ebbeb1674293dae6b06b50f0a1f2184
> [4] http://lists.busybox.net/pipermail/buildroot/2021-October/624596.html
> [5] f816e5b276f1ef15840bec6667f1e8219717ab7d
> [6] 58af9a70cc0f195116dedb3fd0e2ca5b4fec9e70
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series of 5 patches applied to master, thanks.

I've added the Ack from Guo to each patch, as seen in [0].

http://lists.busybox.net/pipermail/buildroot/2021-October/624866.html

Regards,
Yann E. MORIN.

> ---
>  board/qemu/csky/linux-ck610.config.fragment |  6 ------
>  board/qemu/csky/linux-ck807.config.fragment |  5 -----
>  board/qemu/csky/linux-ck810.config.fragment |  5 -----
>  board/qemu/csky/linux-ck860.config.fragment |  9 ---------
>  board/qemu/csky/readme.txt                  | 15 ---------------
>  configs/qemu_csky610_virt_defconfig         | 20 --------------------
>  configs/qemu_csky807_virt_defconfig         | 20 --------------------
>  configs/qemu_csky810_virt_defconfig         | 20 --------------------
>  configs/qemu_csky860_virt_defconfig         | 20 --------------------
>  9 files changed, 120 deletions(-)
>  delete mode 100644 board/qemu/csky/linux-ck610.config.fragment
>  delete mode 100644 board/qemu/csky/linux-ck807.config.fragment
>  delete mode 100644 board/qemu/csky/linux-ck810.config.fragment
>  delete mode 100644 board/qemu/csky/linux-ck860.config.fragment
>  delete mode 100644 board/qemu/csky/readme.txt
>  delete mode 100644 configs/qemu_csky610_virt_defconfig
>  delete mode 100644 configs/qemu_csky807_virt_defconfig
>  delete mode 100644 configs/qemu_csky810_virt_defconfig
>  delete mode 100644 configs/qemu_csky860_virt_defconfig
> 
> diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
> deleted file mode 100644
> index b690c7d6ec..0000000000
> --- a/board/qemu/csky/linux-ck610.config.fragment
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -CONFIG_COMPILE_TEST=y
> -CONFIG_CPU_CK610=y
> -CONFIG_CPU_PM_WAIT=y
> -CONFIG_RAM_BASE=0x10000000
> -CONFIG_CSKY_APB_INTC=y
> -CONFIG_GX6605S_TIMER=y
> diff --git a/board/qemu/csky/linux-ck807.config.fragment b/board/qemu/csky/linux-ck807.config.fragment
> deleted file mode 100644
> index b6974f0157..0000000000
> --- a/board/qemu/csky/linux-ck807.config.fragment
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -CONFIG_COMPILE_TEST=y
> -CONFIG_CPU_CK807=y
> -# CONFIG_CPU_HAS_FPU is not set
> -CONFIG_CPU_PM_WAIT=y
> -CONFIG_CSKY_APB_INTC=y
> diff --git a/board/qemu/csky/linux-ck810.config.fragment b/board/qemu/csky/linux-ck810.config.fragment
> deleted file mode 100644
> index 50fa1f4f79..0000000000
> --- a/board/qemu/csky/linux-ck810.config.fragment
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -CONFIG_COMPILE_TEST=y
> -CONFIG_CPU_CK810=y
> -# CONFIG_CPU_HAS_FPU is not set
> -CONFIG_CPU_PM_WAIT=y
> -CONFIG_CSKY_APB_INTC=y
> diff --git a/board/qemu/csky/linux-ck860.config.fragment b/board/qemu/csky/linux-ck860.config.fragment
> deleted file mode 100644
> index e8f6af10ba..0000000000
> --- a/board/qemu/csky/linux-ck860.config.fragment
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -CONFIG_COMPILE_TEST=y
> -CONFIG_CPU_CK860=y
> -# CONFIG_CPU_HAS_FPU is not set
> -CONFIG_CPU_PM_WAIT=y
> -CONFIG_SMP=y
> -CONFIG_HOTPLUG_CPU=y
> -CONFIG_CSKY_APB_INTC=y
> -CONFIG_CSKY_MPINTC=y
> -CONFIG_CSKY_MP_TIMER=y
> diff --git a/board/qemu/csky/readme.txt b/board/qemu/csky/readme.txt
> deleted file mode 100644
> index 5e4cb1871c..0000000000
> --- a/board/qemu/csky/readme.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Run with qemu:
> -
> -For ck860 smp:
> - qemu-system-cskyv2 -M virt -cpu ck860 -smp 2 -nographic -kernel vmlinux # qemu_csky860_virt_defconfig
> -
> -For ck807:
> - qemu-system-cskyv2 -M virt -nographic -kernel vmlinux # qemu_csky807_virt_defconfig
> -
> -For ck810:
> - qemu-system-cskyv2 -M virt -nographic -kernel vmlinux # qemu_csky810_virt_defconfig
> -
> -For ck610:
> - qemu-system-cskyv1 -M virt -nographic -kernel vmlinux # qemu_csky610_virt_defconfig
> -
> -The login prompt will appear in the terminal that started Qemu. Username is root and no password.
> diff --git a/configs/qemu_csky610_virt_defconfig b/configs/qemu_csky610_virt_defconfig
> deleted file mode 100644
> index e7d75f5f49..0000000000
> --- a/configs/qemu_csky610_virt_defconfig
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# Architecture
> -BR2_csky=y
> -BR2_ck610=y
> -
> -# System
> -BR2_TARGET_ROOTFS_INITRAMFS=y
> -
> -# Image
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> -
> -# linux kernel header, the same version with linux kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
> -
> -# Kernel
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> -BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
> diff --git a/configs/qemu_csky807_virt_defconfig b/configs/qemu_csky807_virt_defconfig
> deleted file mode 100644
> index df12450a55..0000000000
> --- a/configs/qemu_csky807_virt_defconfig
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# Architecture
> -BR2_csky=y
> -BR2_ck807=y
> -
> -# System
> -BR2_TARGET_ROOTFS_INITRAMFS=y
> -
> -# Image
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> -
> -# linux kernel header, the same version with linux kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
> -
> -# Kernel
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> -BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck807.config.fragment"
> diff --git a/configs/qemu_csky810_virt_defconfig b/configs/qemu_csky810_virt_defconfig
> deleted file mode 100644
> index dd1fd329f5..0000000000
> --- a/configs/qemu_csky810_virt_defconfig
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# Architecture
> -BR2_csky=y
> -BR2_ck810=y
> -
> -# System
> -BR2_TARGET_ROOTFS_INITRAMFS=y
> -
> -# Image
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> -
> -# linux kernel header, the same version with linux kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
> -
> -# Kernel
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> -BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck810.config.fragment"
> diff --git a/configs/qemu_csky860_virt_defconfig b/configs/qemu_csky860_virt_defconfig
> deleted file mode 100644
> index 6edfba4e8e..0000000000
> --- a/configs/qemu_csky860_virt_defconfig
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# Architecture
> -BR2_csky=y
> -BR2_ck860=y
> -
> -# System
> -BR2_TARGET_ROOTFS_INITRAMFS=y
> -
> -# Image
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> -
> -# linux kernel header, the same version with linux kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
> -
> -# Kernel
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
> -BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck860.config.fragment"
> -- 
> 2.31.1
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
