Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B814C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 11:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B93683E4F;
	Sun, 17 Jul 2022 11:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B93683E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPcUpRU6gzIP; Sun, 17 Jul 2022 11:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26FEF83E4A;
	Sun, 17 Jul 2022 11:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26FEF83E4A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AA531BF325
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 11:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 721EC41747
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 11:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 721EC41747
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDhce6GUFmmF for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 11:31:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E904173B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7E904173B
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 11:31:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 99057780503;
 Sun, 17 Jul 2022 13:31:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 13:31:51 +0200
Date: Sun, 17 Jul 2022 13:31:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220717113151.GB2107091@scaer>
References: <20220717103812.9747-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220717103812.9747-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658057514;
 bh=BEgU2f0r0HBPNEGqxzpeUdXe+3IUd9LJt0lTcrnWZMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=es2IdSPwpxXIyKHwB1wv5wNcKVwTxS4nWCWHKoQJ5396fRK7Br1h73NAA7r87NiX4
 ew4Qtn9p/VhdTc/ETQUW4DNU2mpDktEYHCjxAYryZELdXZ95pnAvq7EJqMqNpnQC4y
 WL7CBoQYPVyeyBxQQ5mUlzr3MgWPKDbb6sv/Y+JHg3uyZMwblrOMU+uH4kPhQEPlni
 oz96B04gyQaaSTQuy47dRz5IhRYUjEdvSPi5XMBqoguXHiwR/anc4xmF/+YyBy1aT5
 sEPqRnUCettd6FOgmsGe/WYV5whSUiist6+sOC2Tm9Mu8QduClc8PT3Qckpw+rdgMh
 8kdFyzkcHfFUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=es2IdSPw
Subject: Re: [Buildroot] [PATCH 1/1] package/cwiid: fix comment dependency
 for MMU
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-07-17 12:38 +0200, Bernd Kuhls spake thusly:
> Fixed broken logic added with ceedd670d8ac54321c3c8b5b882346a035073e67
> back in 2015.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cwiid/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
> index 7e8cdc3086..44148eb188 100644
> --- a/package/cwiid/Config.in
> +++ b/package/cwiid/Config.in
> @@ -33,4 +33,4 @@ comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.18
>  	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> -	depends on !BR2_USE_MMU
> +	depends on BR2_USE_MMU
> -- 
> 2.30.2
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
