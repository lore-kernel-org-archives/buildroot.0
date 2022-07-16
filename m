Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1310C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FAB460BFC;
	Sat, 16 Jul 2022 22:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FAB460BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qWg1Q8pQ4yQ; Sat, 16 Jul 2022 22:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B1560B4D;
	Sat, 16 Jul 2022 22:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B1560B4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30C691BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19B2181497
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19B2181497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVsqhbINVc1e for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:08:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C5F580BBF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C5F580BBF
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:08:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 680667804FF;
 Sun, 17 Jul 2022 00:08:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 00:08:00 +0200
Date: Sun, 17 Jul 2022 00:08:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <20220716220800.GP2543@scaer>
References: <20220715211041.7902-1-kris@embeddedTS.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220715211041.7902-1-kris@embeddedTS.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658009284;
 bh=/anENrRIIEiKDvpkjSch0x3xTJHbUTbmHElIPa47r3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKDZfblpuJTSYTmU1inwPd7VqFZs52NbygCpy68u9Uco6j5SNxxIOx5+o99NGcbCh
 d3+icUXb0ik0Pxa9+vYH559l4fnoBHGlddrcFbbPase5MKteh04sEkU+65G8i2/rmJ
 XPDxYyS7VLxW5bluQRGbAzloBMu3F1gMr98o3P3Qu1BTuQvFCUQO+vyTUW3Z94mn4O
 K1JZxijBiJs18SKlWTLi8R2TgSisGLrKwk5CJz9iBCGGoiRtAKhs0T1IUv+ya0qUm2
 3iknxqyA/0Xo9gPRPuQgGFM6gxHMPJ0140tbZEmcbiBtuMun7K0zpxBR4MSoQ6+Z+y
 mrzUpheBBzHHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dKDZfblp
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-driver: fix kconfig syntax
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mark Featherston <mark@embeddedTS.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kris, All,

On 2022-07-15 14:10 -0700, Kris Bahnsen via buildroot spake thusly:
> Sub-options SPI and SDIO weren't rendering as nested options for
> wilc-driver, instead showing on the same indent level. Move the
> comment and depends on to bottom of file to correct this.
> 
> Fixes: 1a47c42b33 ("package/wilc-driver: add missing BR2_LINUX_KERNEL dependency")
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wilc-driver/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
> index 24a7b05b17..7ed062bb66 100644
> --- a/package/wilc-driver/Config.in
> +++ b/package/wilc-driver/Config.in
> @@ -17,9 +17,6 @@ config BR2_PACKAGE_WILC_DRIVER
>  
>  	  https://github.com/embeddedTS/wilc3000-external-module
>  
> -comment "wilc kernel module needs a Linux kernel to be built"
> -	depends on !BR2_LINUX_KERNEL
> -
>  if BR2_PACKAGE_WILC_DRIVER
>  
>  config BR2_PACKAGE_WILC_DRIVER_SPI
> @@ -60,3 +57,6 @@ config BR2_PACKAGE_WILC_DRIVER_SDIO_OOB
>  	  time division interrupt.
>  endif
>  endif
> +
> +comment "wilc kernel module needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> -- 
> 2.11.0
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
