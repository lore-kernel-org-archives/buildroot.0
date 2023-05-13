Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8151BC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7C384485;
	Sat, 13 May 2023 10:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7C384485
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWQVRh2tou1p; Sat, 13 May 2023 10:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 440528411D;
	Sat, 13 May 2023 10:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 440528411D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDB4F1BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A794460F65
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A794460F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKjuQk9bfRsF for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:50:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F63160804
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F63160804
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:50:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id EB81219F733;
 Sat, 13 May 2023 12:49:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 12:49:54 +0200
Date: Sat, 13 May 2023 12:49:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20230513104954.GM2582048@scaer>
References: <20230426104102.1211757-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426104102.1211757-1-luca.ceresoli@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683974998;
 bh=UUfuYZTuY+tyi/k00puUwUebt4/v/TMJHZQOmXWASmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FXyTjiEGIxRZxlXRb2dIOYzXci5uEo1DzP3kqBKyWrTRjv3PLFJ4zV7Zs6vEvv7Xf
 1u5xYzUi+k6bZUmJm2KQAhkuMX0OAIUPovRYDhCFFumRMsE5dQifbKCScw2gjGbDvb
 EOCX+vOqSoAE03KukjNnGTOLDci0oGD2ick92Wh5MYdKaTFSrti0cygXd0l7QhM49M
 dqa9gMeeGInIPn63ZyBsA7ZHHcXenVY8tgLQVj119FwkFloSthI2gjiCQZDXHG8hgZ
 lUE/0ck8TPlLZBRZ7sKpiDieIUi+nZBJdOIPJlLSvcpbJIHFwXLfH8iN16Gus9jBgI
 MzXKsIg4k6ZjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FXyTjiEG
Subject: Re: [Buildroot] [PATCH] boot/uboot: document that the zynqmp pmufw
 can be in ELF format
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
Cc: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2023-04-26 12:41 +0200, Luca Ceresoli via buildroot spake thusly:
> This feature was added in commit d07e6b7071cf ("boot/uboot/uboot.mk: add
> pmufw.elf support"), document it in kconfig.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/uboot/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index f5c20f51688e..085397d03d0c 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -492,6 +492,8 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
>  	  (e.g. http://...), and it will be downloaded and used from
>  	  the download directory.
>  
> +	  The PMU firmware binary can be either in ELF or BIN format.
> +
>  	  If empty, the generated boot.bin will not contain a PMU
>  	  firmware.
>  
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
