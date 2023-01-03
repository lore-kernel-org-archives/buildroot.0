Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98CAC4708E
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 20:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7363360FA2;
	Tue,  3 Jan 2023 20:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7363360FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsE_IENW9-MQ; Tue,  3 Jan 2023 20:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B553360F94;
	Tue,  3 Jan 2023 20:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B553360F94
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF0A11BF574
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3AD460F94
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3AD460F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PT10pAmKRUZ for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 20:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9438860F93
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9438860F93
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 20:23:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3893:55a9:bd48:a433])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 432752003DE;
 Tue,  3 Jan 2023 21:23:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Jan 2023 21:22:59 +0100
Date: Tue, 3 Jan 2023 21:22:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dennis Van Hoorick <dennis.van.hoorick@gmail.com>
Message-ID: <20230103202259.GZ2498764@scaer>
References: <20230103103438.1889-1-dennis.vanhoorick@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103103438.1889-1-dennis.vanhoorick@barco.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672777383;
 bh=sxf0I2JBd8XJF5n7nQaRRBCRKY/bt4SGsGZN3OsHjrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qQMbdBs5DNYNLsxFfcFuncPft8jukXQiPvibA6Td/WDPNkK8gDR26c5xwMzqjkYju
 lLQvuHRqT2/LKtTm6f1U/T0IL2IhS0DrKfhi9e68aja6XsnQXyw3xnyBpLOKJu3y8b
 dRyDTboec7iiM0J/QhDXePuni/zSO1M3vp27EOTfrAUB0rUYbvla785E2mWL0vfDmC
 Nce6kH9mzkNyOjnQ21hFC9EPocycLZeYbqrrajdlYUukDiXuF/At9dqJh40AFrFdNe
 YW93nKtsdzRih4/rNbxwCUzDNs8Kef9+QWqzbqgGIpNS1GNIp2/P4znxgonjq8doRy
 14xZCXqKpaWDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qQMbdBs5
Subject: Re: [Buildroot] [PATCH 1/2] package/ncurses: Fix homepage in
 Config.in
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
Cc: Dennis Van Hoorick <dennis.vanhoorick@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dennis, All,

On 2023-01-03 11:34 +0100, Dennis Van Hoorick spake thusly:
> The homepage listed in package/ncurses/Config.in was incorrect.
> Changed to correct one (https://invisible-island.net/ncurses/).

I've rephrased that to state that it is _now_ incorrect, as it used to
be correct.

I looked on the wayback machine, and the homepage we had was at least
still correct by then end of 2019 (unfortunately, the wayback machine
is slow, so I did not bother to check when it exactly changed).

> Signed-off-by: Dennis Van Hoorick <dennis.vanhoorick@barco.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ncurses/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
> index 9f7753b06a..c0086cbbe3 100644
> --- a/package/ncurses/Config.in
> +++ b/package/ncurses/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_NCURSES
>  
>  	  This package installs only a few vital termcap entries
>  
> -	  http://www.gnu.org/software/ncurses/
> +	  https://invisible-island.net/ncurses/
>  
>  if BR2_PACKAGE_NCURSES
>  
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
