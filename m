Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9BEE95A61
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 16:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDEAC61062;
	Sat,  7 Oct 2023 16:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDEAC61062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86lNLhElzNIw; Sat,  7 Oct 2023 16:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F3B610D0;
	Sat,  7 Oct 2023 16:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F3B610D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 612D91BF31B
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 16:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A54F81B70
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 16:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A54F81B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWItFV1JrR4s for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 16:19:36 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA74081B53
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 16:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA74081B53
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:77f1:3f6b:b690:928a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 14F37B0057C;
 Sat,  7 Oct 2023 18:19:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Oct 2023 18:19:28 +0200
Date: Sat, 7 Oct 2023 18:19:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231007161928.GF2552@scaer>
References: <20231007160637.97022-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231007160637.97022-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696695573;
 bh=lzNOJkwu2b0FWaIGJE0u5BSsAwUbyUEkMqfaumbNG7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PiCO23ctYMau4scTF2gFVP2k04LNbTyIGAqQPQMFQmelJk+JtpXYwZ1/pETRS/7pw
 xA2W+XxVyS+csu2JqvPXmUlyHMesq+20IGs0vXnJdUMFJVI/pJ5WMa9/kTl2fvKoHX
 Ra6Sa9sTob3o4MRgGtl4/T1J59FKkkYNrcLj6CTIhfwLoT5ff4YL86VI16SBbY2UkY
 r9bUe91jSmv3AL6nMqlADjzZsXlWW7wlS4BOjvUe1k10604WvLQx+/qsJNrVntDUwV
 pAPeKy/UJ+4I0ttlCcbefoBAOvwWag0leBqmzafW06SHykG/KTNW8X/c1uNHFMqvXU
 EkPhYBLu7yUqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PiCO23ct
Subject: Re: [Buildroot] [PATCH 1/1] board/ti/am62x-sk/readme.txt: fix
 defconfig target
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ADam. All,

On 2023-10-07 18:06 +0200, Adam Duskett spake thusly:
> am62x_sk_defconfig should be ti_am62x_sk_defconfig
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/ti/am62x-sk/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/ti/am62x-sk/readme.txt b/board/ti/am62x-sk/readme.txt
> index f6251ea04a..5af1c59c2d 100644
> --- a/board/ti/am62x-sk/readme.txt
> +++ b/board/ti/am62x-sk/readme.txt
> @@ -11,7 +11,7 @@ How to Build
>  
>  Select the default configuration for the target:
>  
> -$ make am62x_sk_defconfig
> +$ make ti_am62x_sk_defconfig
>  
>  Optional: modify the configuration:
>  
> -- 
> 2.41.0
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
