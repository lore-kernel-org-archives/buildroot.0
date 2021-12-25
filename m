Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79922C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 15:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ED4740902;
	Sat, 25 Dec 2021 15:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OZS-Bz12ZSD; Sat, 25 Dec 2021 15:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A82E408C8;
	Sat, 25 Dec 2021 15:28:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F25091BF32E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF4864057C
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 15:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LaLCvlE8LzPU for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 15:28:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 789D240110
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 15:28:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b527:fd15:94c1:e7d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9A0B013F84C;
 Sat, 25 Dec 2021 16:27:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640446080;
 bh=Zrp3IZ0mO7uRn0rEU65y3zrgRRR57c1K54MEFjB6sHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ed1BBeixU5uHCqF7ID5WG+M4/n3pWdBM5q/QiBVLPmZtV2WUb9PaxwqZiAgMLTZfi
 ATRSJF9RYbQiM1Y1aRq3TsHjBAG7yNu2nRDdRcQSZmTTi3A8ctAT2RTUqX/2jyWrXG
 HF1H+3GHSyZgtZBdg7lkFtpYDXQJgUebe5rpEsE9KRo6i82D4k/QtFFOo31xX0xYSI
 Zr/Db1g3Vfuv+Tl6y7XeXx6cOKmUTgM819ZHQ/j4oXQzH6AW+CfWr7SS3kW8UyK9Qs
 TE5GhkrrhxFyS81U+bwgmGv9gBy0483Xoc1CIDKnCgT2fmtUaTFes6Ehmafdo0oOb0
 JidqKffaJNUbg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Dec 2021 16:27:53 +0100
Date: Sat, 25 Dec 2021 16:27:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211225152753.GR2603@scaer>
References: <20211225103532.617750-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211225103532.617750-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/stm32f469_disco_sd: U-Boot needs
 host-openssl
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-25 11:35 +0100, Thomas Petazzoni spake thusly:
> Fixes:
> 
> In file included from include/bootm.h:10:0,
>                  from tools/image-host.c:12:
> include/image.h:1178:27: fatal error: openssl/evp.h: No such file or directory
>  #  include <openssl/evp.h>
>                            ^
> compilation terminated.
> scripts/Makefile.host:112: recipe for target 'tools/image-host.o' failed
> make[2]: *** [tools/image-host.o] Error 1
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/stm32f469_disco_sd_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
> index 5ad4068e5e..ea1361efc0 100644
> --- a/configs/stm32f469_disco_sd_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -19,6 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
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
