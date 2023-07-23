Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACA4C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3C8A410AB;
	Sun, 23 Jul 2023 17:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C8A410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-ySzS9jpgnr; Sun, 23 Jul 2023 17:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7773410AC;
	Sun, 23 Jul 2023 17:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7773410AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A62CA1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC4781E0A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC4781E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syETYz_0OTy3 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 17:24:08 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BBF281E04
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 17:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BBF281E04
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:22c7:ca40:1a2e:1362])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BAD395FFAE;
 Sun, 23 Jul 2023 19:24:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 19:24:04 +0200
Date: Sun, 23 Jul 2023 19:24:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230723172404.GM2503916@scaer>
References: <20230723170338.833265-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723170338.833265-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690133046;
 bh=dwXgcycWbo8cnIbxSsmtokS6f4AM+mStOXH7zdn/sY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KU4NCN4pvhYlcum8bBxkgjeFGQ0IbkGBvjD6wfMz6bgmZScUtge54v+Q+Egh7DylI
 gZ+9+y5RsA1QCTU2eESw/iCV2KNV/f7r2QPZB1DrfnqNwADbmoPipxYmtyqcn1OLD7
 +f3UG8XfG0fQUakGgURM23U1mfwUD79q9+EZ/yjad4z4+8QlvNGSiiPs7rNnty2DJ2
 M0HmekViLLGzU3mTVjK2W8Tnl36kd9EuDSCpWgymmWYNtkpRKB/qQBjpluZVZn0noj
 yDigvrqYobRflITJ6jOsD8wOczbWsi8wpviGI7l7Z/lPwyxmXMEO7tfm2pto9SGK3k
 eYz1qC0JUfqsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KU4NCN4p
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Bernd Kuhls from
 pixman & vnstat
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

Bernd, All,

On 2023-07-23 19:03 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for having looked after them until now!

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0ff2dde38e..a7600e8fd5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -447,7 +447,6 @@ F:	package/perl-timedate/
>  F:	package/perl-uri/
>  F:	package/perl-www-robotrules/
>  F:	package/php/
> -F:	package/pixman/
>  F:	package/pngquant/
>  F:	package/pppd/
>  F:	package/privoxy/
> @@ -479,7 +478,6 @@ F:	package/transmission/
>  F:	package/tvheadend/
>  F:	package/unixodbc/
>  F:	package/vlc/
> -F:	package/vnstat/
>  F:	package/wget/
>  F:	package/wireless-regdb/
>  F:	package/wireless_tools/
> -- 
> 2.39.2
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
