Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498FFC77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 20:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F215161042;
	Sun, 21 May 2023 20:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F215161042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzUfJeg2zW4m; Sun, 21 May 2023 20:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF9560FE9;
	Sun, 21 May 2023 20:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF9560FE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 687C11BF3CB
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FF464179B
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF464179B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Irbl5V-Zsytu for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 20:11:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 006FA4175E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 006FA4175E
 for <buildroot@buildroot.org>; Sun, 21 May 2023 20:11:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a137:d754:ea62:50f7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8663C6012D;
 Sun, 21 May 2023 22:11:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 22:11:34 +0200
Date: Sun, 21 May 2023 22:11:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230521201134.GD621937@scaer>
References: <20230428224051.259264-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428224051.259264-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684699899;
 bh=W6z0aKLE0XDpDprPjFak+XzwMVy2TIPhK6kCME5FlUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBNgVwaSbHOx8kmnyT/5AzRx+I3vov/DAHK1XZLPP4g8mX2WZd8Fzfg2KxWexA286
 62Y3bEvtAULoGkTJ1kCz4WsgRta7sVGfm7Rdxxoh1KEi1VY+5sS5k5X2Gyv1ch/+S0
 sVlo0xSAQx+UPywyuAxU78w6gLw7H75KQYh93GGM+QawNj36G/S5y3+wYseaJBnG2m
 hSVXWeFFtK/mG5wDkMYKn0OwcVES9FLbluTMhM3nX/3ezVD+cm/ZnB2WzIC4H1RoA8
 Ag8399wE+bS5yWHRlZZWkPBphq9LaN5NThGnlHgeuehsx9U50X7AfOwkJdu+D31ug+
 +XjrF7n9m2vOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lBNgVwaS
Subject: Re: [Buildroot] [PATCH v4] configs/qemu: update defconfigs to Linux
 6.1.26
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sebastian, Romain, All,

+Jan-Benedict for BZ #15581

On 2023-04-29 00:40 +0200, Romain Naour spake thusly:
> From: Sebastian Weyer <sebastian.weyer@smile.fr>
> 
> Just updating all qemu defconfigs to the latest Kernel LTS version
> including first gcc 13.1 fixes [1]
[--SNIP--]
>  configs/qemu_ppc_mpc8544ds_defconfig      | 4 ++--
[--SNIP--]
> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
> index b9a0812d52..ca1a429167 100644
> --- a/configs/qemu_ppc_mpc8544ds_defconfig
> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
>  # Linux headers same as kernel
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
>  BR2_LINUX_KERNEL_VMLINUX=y

Did you actualy test this change? It fails to even patch the kernel:

    $ make distclean
    $ make qemu_ppc_mpc8544ds_defconfig
    $ make linux-patch
    >>> linux 6.1.26 Patching

    Applying 0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch using patch:
    patching file arch/powerpc/Makefile
    Hunk #1 succeeded at 10 (offset -2 lines).
    Hunk #2 FAILED at 164.
    Hunk #3 succeeded at 174 with fuzz 2 (offset -1 lines).
    1 out of 3 hunks FAILED -- saving rejects to file arch/powerpc/Makefile.rej
    make[1]: *** [package/pkg-generic.mk:251: ...../build/linux-6.1.26/.stamp_patched] Error 1
    make: *** [Makefile:23: _all] Error 2

Ditto for linux-headers, of course...

See:
    https://bugs.busybox.net/show_bug.cgi?id=15581

Could you re-check on your side, and also verify the other defconfig
files, please?

Regards,
Yann E. MORIN.

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
