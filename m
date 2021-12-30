Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037E6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08E88289B;
	Thu, 30 Dec 2021 17:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjNb11pfXMlq; Thu, 30 Dec 2021 17:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0210382881;
	Thu, 30 Dec 2021 17:44:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24FCC1BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14582410AC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zO_Be8Qk05o for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:44:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32EC540977
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:44:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:14b5:310a:ddef:6cec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 85F7813F879;
 Thu, 30 Dec 2021 18:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640886294;
 bh=ILk1C4qdeR5tk/9NsFvS3Tj+u2zKKhIzYyVEOcxPHk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u0V7fGMKfJTAJdfp4bececwK9YJ11jyNUxJ7aMLGdJnmWY07ELt+3pHCcjIRnkNeO
 q6jEn4FBpgo61ehlZrqfHY/EZe5NgTfoszCt7nClm/UMLt3sDLtwYd9U9UTk3hMjmN
 BIxPL6eFrwyEFkNwxN2EggQR3a/X2/XU+M/HNcwZYAFNcEsJbQKmcP/esjmLoAMhtI
 Y6hkHU7qu0IO1DMuwoGIY3N+e4STaG439fpCjm4pYn/0teQgJcRQCN7jqqs1ioO/pg
 5DP6AkI+mgXCzjk03Jm8XW8UvVSrbiFROserYc7Pqz0p+u02SB5sOBb66Bov2dOokX
 HWh7SyWq6Yt7g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 30 Dec 2021 18:44:46 +0100
Date: Thu, 30 Dec 2021 18:44:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211230174446.GH3390456@scaer>
References: <20211228091541.1155068-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228091541.1155068-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/gen-bootlin-toolchains:
 handle RISC-V 64-bit toolchain change
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-28 10:15 +0100, Thomas Petazzoni spake thusly:
> toolchains.bootlin.com no longer provides a LP64 RISC-V 64-bit
> toolchain, but a more useful LP64D RISC-V 64-bit toolchain. Of course,
> the old tarballs remain available, but no new versions of the LP64
> toolchain will be produced.
> 
> This commit reflects this change in the gen-bootlin-toolchains script.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/gen-bootlin-toolchains | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
> index 902b7795ee..f160a44152 100755
> --- a/support/scripts/gen-bootlin-toolchains
> +++ b/support/scripts/gen-bootlin-toolchains
> @@ -158,8 +158,8 @@ arches = {
>          'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_32', 'BR2_RISCV_ABI_ILP32D'],
>          'prefix': 'riscv32',
>      },
> -    'riscv64': {
> -        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64'],
> +    'riscv64-lp64d': {
> +        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D'],
>          'prefix': 'riscv64',
>      },
>      'sh-sh4': {
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
