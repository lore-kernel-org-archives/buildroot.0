Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572BFC46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 22:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D0F81D21;
	Sun, 24 Dec 2023 22:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11D0F81D21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9NDn3uPf9eX; Sun, 24 Dec 2023 22:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7D281DFD;
	Sun, 24 Dec 2023 22:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D7D281DFD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 866791BF380
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C6F881DFD
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C6F881DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Egnb9q4I3222 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 22:25:23 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61EC7817A1
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 22:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61EC7817A1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A49E65FE03;
 Sun, 24 Dec 2023 23:25:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 23:25:19 +0100
Date: Sun, 24 Dec 2023 23:25:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYivz09nd6rbjt3M@landeda>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
 <20231221153620.237439-5-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221153620.237439-5-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703456721;
 bh=c0RmlwXiLnLthwwjdSnCtnz9VIFz3DbDyGEmsvpP5y4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mBBS3WcR9B59MUZes6u08vlV90nSEb9+lyTOfOMYahoty5y/c+m3WnV/8W6TBjvFS
 upFCcMorpMYWLTyPrBVix1Jsmjl4RhHKUcrrrVwz63+Spk9xv3sQ5ZUb6b+qnoN9oW
 ghWSeMN5wgcgyBh653YBW7XBYLQtgFr0sZj8Ne1Rj8nsYEO4jGFFFvQk4c3NVPLY0h
 rJY0LLDcyMNWHDkNjHvsl4U59WPqNBNcQ6s/WhtP5HBISoaJLN7gGoYX18TZRSRUg/
 DcJvqGC/N5pg3cqRRzMLUUx6vysxD1OrjXEItVDIdHmjPIAFY2afSYug8drOTSko4o
 UsviPF4gxBu4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mBBS3WcR
Subject: Re: [Buildroot] [PATCH v4 05/10] package/sway: enable
 bash-completion support
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

ADam, All,

On 2023-12-21 08:36 -0700, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

This patch and the rest of the series: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sway/sway.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sway/sway.mk b/package/sway/sway.mk
> index 19f90b8b00..677b101f1d 100644
> --- a/package/sway/sway.mk
> +++ b/package/sway/sway.mk
> @@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
>  	-Dwerror=false \
>  	-Ddefault-wallpaper=false \
>  	-Dzsh-completions=false \
> -	-Dbash-completions=false \
>  	-Dfish-completions=false \
>  	-Dswaybar=false \
>  	-Dswaynag=false \
> @@ -34,4 +33,10 @@ else
>  SWAY_CONF_OPTS += -Dgdk-pixbuf=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +SWAY_CONF_OPTS += -Dbash-completions=true
> +else
> +SWAY_CONF_OPTS += -Dbash-completions=false
> +endif
> +
>  $(eval $(meson-package))
> -- 
> 2.43.0
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
