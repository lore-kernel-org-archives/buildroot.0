Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79F0C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E12883F21;
	Fri,  5 Aug 2022 16:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E12883F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06RfRdLECnfd; Fri,  5 Aug 2022 16:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD36783F19;
	Fri,  5 Aug 2022 16:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD36783F19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB2D61BF345
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 15:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90E4660E85
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 15:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90E4660E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWnuXpo6qRoF for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 15:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 978FD6F970
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 978FD6F970
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 15:59:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5864:4f9d:d5e2:80b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D8BB819F741;
 Fri,  5 Aug 2022 17:59:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 17:59:49 +0200
Date: Fri, 5 Aug 2022 17:59:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220805155949.GB3621445@scaer>
References: <20220804205051.4159-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804205051.4159-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659715194;
 bh=vPWuvA9DwDZMS9KQ2dV2IwJ5AgehQl/x7vr5oHPtZ4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gb6FYDduGRiLA7VvKXSmjpQa6Zv5ImKGdjN5GjyFOiL60aFYXGUfeGhfW9JY6nmLF
 upuRIOMROT7jWBVlBgJdYCpZa473j641r34wANByzrXanRTyNKSUomE8HpXX6L9lTq
 RzZkvX8WUdjlU1pE5xWJj8I2z9urU9wnAUROdWew1XREqtMMGuIO9gdNof7YC93XXg
 SCmz6+DGddsJMfbHSYI1ehzCrPjTqUi5FS62Ml8kjLtWlCLXSFwTsxBFLBeQfF2gHD
 lYJ5ES88a/wGrjRsjv/wGMGIUkdpoh+2TldccyDpq1ILSxT9P7nqKIgmvk79fOXzmR
 ipSgfS6Htkb0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gb6FYDdu
Subject: Re: [Buildroot] [PATCH] board/broadcom/northstar: Fix defconfig
 make target
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
Cc: rafal@milecki.pl, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2022-08-04 13:50 -0700, Florian Fainelli spake thusly:
> The readme.txt contains a make target that does not match the actual
> defconfig file name, fix that.
> 
> Fixes: 1500b7d5c818 ("configs/broadcom_northstar: new defconfig")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/broadcom/northstar/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/broadcom/northstar/readme.txt b/board/broadcom/northstar/readme.txt
> index 18c9b03c1334..523bb439e37a 100644
> --- a/board/broadcom/northstar/readme.txt
> +++ b/board/broadcom/northstar/readme.txt
> @@ -25,7 +25,7 @@ device setup).
>  How to build it
>  ===============
>  
> -  $ make broadcom_ns_defconfig
> +  $ make broadcom_northstar_defconfig
>  
>    $ make
>  
> -- 
> 2.25.1
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
