Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8742ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 19:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2382C41710;
	Mon, 19 Sep 2022 19:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2382C41710
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQ1ExAjacZ7q; Mon, 19 Sep 2022 19:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E848B41708;
	Mon, 19 Sep 2022 19:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E848B41708
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEAE21BF59A
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A71CC813BA
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71CC813BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T74I6fppQJLp for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 19:38:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF12C8138C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF12C8138C
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 19:38:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ff43:9597:808d:a748])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8803A19F55C;
 Mon, 19 Sep 2022 21:38:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Sep 2022 21:38:41 +0200
Date: Mon, 19 Sep 2022 21:38:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20220919193841.GO1419013@scaer>
References: <20220919034622.306672-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919034622.306672-1-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663616323;
 bh=4OUr66MHs5iLtLs2MWUe6Ooqqs6vXyFfHMpljuRUC3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B7gka7/MUaDEpwE9WWTe8vEfYh7cWmFj5+PX/oaCQyHz1txIs4yXfrV2meFfFx7R5
 JEQtdyZYEgRyOg+ECuU+Pn1+zUB3dKRt3dbtYRA35pf53ew0OXLScPcXOyUKkXZs7J
 dZrIskqjn0livaWjfO5QcEHGY0y8Cb8jMfzfcDDEfiqwbOJdlpwkwbbkLSkYpbfVN1
 yK425jsL4qBNSveiSBcwTNnSAfW+/zTEIlUQ6tlC5n2fgugQrBMRcYVjbQ2KEXg2od
 XA7J/pkxADWZiFjFJm9FfsG6biy/s+okSHiulXKlQbhkUrkg4sMHYu5v7unryiNXNo
 NX/fhLvQJPaMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B7gka7/M
Subject: Re: [Buildroot] [PATCH] Add myself to a few projects where I'm the
 upstream maintiner
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

Joachim, All,

I've fixed the typo in the commit title, and took the opportunity to
rephrase it slightly.

On 2022-09-19 05:46 +0200, Joachim Wiberg spake thusly:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Thanks for adopting those! :-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9e8626341e..14b91fca8d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1481,15 +1481,21 @@ N:	Joachim Wiberg <troglobit@gmail.com>
>  F:	configs/globalscale_espressobin_defconfig
>  F:	board/globalscale/espressobin/
>  F:	package/inadyn/
> +F:	package/libconfuse/
>  F:	package/libite/
> +F:	package/libnet/
>  F:	package/libteam/
>  F:	package/libuev/
>  F:	package/mg/
> +F:	package/mini-snmpd/
>  F:	package/mrouted/
>  F:	package/netcalc/
> +F:	package/pimd/
> +F:	package/redir/
>  F:	package/smcroute/
>  F:	package/ssdp-responder/
>  F:	package/sysklogd/
> +F:	package/uredir/
>  F:	package/watchdogd/
>  
>  N:	Jochen Baltes <jochen.baltes@gmail.com>
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
