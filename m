Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E60C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B718360B2F;
	Wed, 19 Jan 2022 21:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HR1OklSa04vA; Wed, 19 Jan 2022 21:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7ED160B23;
	Wed, 19 Jan 2022 21:53:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7831BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38D474021C
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJ5HNfYLwZEI for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9CC8401D2
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:53:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1265819F595;
 Wed, 19 Jan 2022 22:53:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642629234;
 bh=2QQjso5cfCcYSQ+y1HZ9SUPAf14t9TqTnSvyHB7PoS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DIizPYBEulCp+0s0p1tfEUzEhM8ZCiFb7290OFMEE4RagK5zGjpBuwOB/fkpHSMNk
 L9rzqIqlsQsDnK+V0E9Hg04GdlJqcl5/7NelaBkfHF1VbqSbFv+iHXlALFOhV+cCbf
 9Mh1vI8ArhyCPiHVVCafCJkbiY1a8Yqo41SXdOkvZjPmzna5SXo56scln4ViI1+/l/
 34DVvhBtuq+kSBowkRWrMy+EUlIA98+Ci31yLGyJGY2zuRAvI3/TvSkeKv9tF7xcSs
 BTrBMSfI/MdldDjjy6OeEokK3ashwUoJ9S3qHdEyDMEXGhhh3SBlG2edpJcoichFct
 VrAR8vh/K65Xw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 22:53:51 +0100
Date: Wed, 19 Jan 2022 22:53:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20220119215351.GA3252931@scaer>
References: <20220117192017.8841-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117192017.8841-1-abrodkin@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/cubieboard2: U-Boot needs Python3 &
 OpenSSL
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexey, All,

On 2022-01-17 22:20 +0300, Alexey Brodkin via buildroot spake thusly:
> After update of the U-Boot [1] we were missing dependency on Python3,
> and so were seeing failures like in [2]:
> ------------------------->8--------------------
>   HOSTLD  scripts/dtc/dtc
> scripts/dtc/pylibfdt/libfdt_wrap.c:154:11: fatal error: Python.h: No such file or directory
>   154 | # include <Python.h>
>       |           ^~~~~~~~~~
> compilation terminated.
> error: command '/usr/bin/gcc' failed with exit code 1
> ------------------------->8--------------------
> 
> So that get fixed with "BR2_TARGET_UBOOT_NEEDS_PYTHON3=y".
> And then once we use Python3, we also need OpenSSL, similarly to [3]
> and the likes. So do it with "BR2_TARGET_UBOOT_NEEDS_OPENSSL=y".
> 
> Hopefully now all starts to build w/o any issues.
> 
> And while at it let's add a bit more structure to the config!
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=06f10a88f30b73aaea5c0e0888d7ba9d9a6420f3
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650570
> [3] https://git.buildroot.net/buildroot/commit/?id=cf2a7663ccc6089e98e0d6ec39fa8623749c0c24
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Applied to master, thanks.

> ---
> 
> P.S. I didn't see that problem on the U-Boot bump, as I built all
> locally and quite obviously had Python3 and all the headers installed
> in the system.

Yeah, happens to each and all of us. ;-)

Regards,
Yann E. MORIN.

> ---
>  configs/cubieboard2_defconfig | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
> index a9356295c1..18337fac72 100644
> --- a/configs/cubieboard2_defconfig
> +++ b/configs/cubieboard2_defconfig
> @@ -1,32 +1,42 @@
> +# Architecture
>  BR2_arm=y
>  BR2_cortex_a7=y
>  BR2_ARM_FPU_NEON_VFPV4=y
> +
>  # Linux headers same as kernel, a 5.15 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> -BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
> -BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
> +
> +# Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
>  BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# Bootloader
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
> +
> +# System
> +BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> -- 
> 2.25.1
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
