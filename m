Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D8EC46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 21:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF10F60E72;
	Mon, 16 Jan 2023 21:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF10F60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5J33ZnJvDMrZ; Mon, 16 Jan 2023 21:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D310960E64;
	Mon, 16 Jan 2023 21:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D310960E64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B71D11BF20D
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EA8A410AF
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EA8A410AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KG79QHCF2PA for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 21:24:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C16D9409E3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C16D9409E3
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 21:24:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4BF735FFAB;
 Mon, 16 Jan 2023 22:24:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 22:24:44 +0100
Date: Mon, 16 Jan 2023 22:24:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20230116212444.GH2770@scaer>
References: <20230116080513.21407-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116080513.21407-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673904288;
 bh=VW67qqOYd2HTJUF1Ic54wKYS4jmGu/bI+jZ12Sk8p2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cHUPZTSENY7LHbVkBr9AaqyIuYAfPpAV9oEFDTB17Fdj2++3LMjpfdABj/mUwtxj3
 ClzE35UA7szbDNb6HTKK18HWJEJPjE5kCalM8NfF4IJD5bQlPdMFNcoPqIOK2+k+Ne
 EfhZMWKCXLpYApLPKWFwNUPI32R8UfeRzSp/w2dH0TFkoAH4kOlj0S0B8esiKQC6tT
 qeLL81DNDjLJ+IFF/at3WnheDxI6a6nAnO8441qV1WlQospMNENgdjPukKa5Z4Hmt2
 Mk6456aH/t1JuikzViMd2In0IvxNvnstrxoJjiyKGrhAf3XpGNN3ss/QmjYog2+58M
 eSc5INoq8aCYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cHUPZTSE
Subject: Re: [Buildroot] [PATCH] package/util-linux: add an option to enable
 irqtop
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

Yegor, All,

On 2023-01-16 09:05 +0100, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> irqtop is an IRQ monitoring tool.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/util-linux/Config.in     | 7 +++++++
>  package/util-linux/util-linux.mk | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 917f1bc2b4..c7e4d2d8bc 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -161,6 +161,13 @@ config BR2_PACKAGE_UTIL_LINUX_IPCS
>  	help
>  	  Show information on IPC facilities
>  
> +config BR2_PACKAGE_UTIL_LINUX_IRQTOP
> +	bool "irqtop"
> +	depends on BR2_USE_MMU # libsmartcols
> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS

I was about to apply this, but I am a bit conflicted... Building irqtop
defaults to 'yes' for linux systems, when --disable-irqtop is not
specified (unless I misread util-linux' configure.ac).

So, today we are providing neither --enable-irqtop nor --disable-irqtop,
which means that it is in practice always built.

But with your change, it means that now it is by default disabled.

So I wanted to add 'default y' for legacy reasons, but we have no other
option in util-linux that defaults to 'y', so it would have been a bit
odd to do so...

Or maybe I am just too tired to think straight...

Thoughts?

Regards,
Yann E. MORIN.

> +	help
> +	  Show information on IRQs
> +
>  config BR2_PACKAGE_UTIL_LINUX_KILL
>  	bool "kill"
>  	help
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index b53b94ec31..87ec3c19d7 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -136,6 +136,7 @@ UTIL_LINUX_CONF_OPTS += \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_IRQTOP),--enable-irqtop,--disable-irqtop) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
> -- 
> 2.17.0
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
