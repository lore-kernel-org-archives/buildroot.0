Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109F8C7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 17:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB91845CE;
	Sat, 15 Apr 2023 17:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB91845CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3_prYpTx0bu; Sat, 15 Apr 2023 17:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECA418440A;
	Sat, 15 Apr 2023 17:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECA418440A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95DAA1C405B
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D99642A3B
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D99642A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-Vdo9vzzLJn for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 17:10:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38CD742A35
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38CD742A35
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 17:10:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4647C5FFC1;
 Sat, 15 Apr 2023 19:10:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 19:10:18 +0200
Date: Sat, 15 Apr 2023 19:10:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20230415171018.GP2819@scaer>
References: <20230410175018.2283807-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230410175018.2283807-1-geomatsi@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681578621;
 bh=Kk/1habUqyY2XRoanEyfRAk/fdfhYCyMJbWtFoTngOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WJoziW2qIKkn6oQTFqUPRnLni+Y44eccyRCiH3Cj9WC3gyFTxVV0L6Nlfqm2xLHl6
 rr2VP1xDJF+Y6ZFRiwa7SBXDNTEgfGYrypjZ4gyleq5LEjV87R4oldeXV8bazHOgtP
 xsP7CRa0tEgdlL3Y/jR7zPp3pZ19bZPA9Gki2fsDnFUoqaKWVtOgF/lSupVccGBDrV
 MiGz601m55KwQofoZkeQraFYXee1qAHvx0n+37iYDxoVj6THvr47QaK/a0TDNbf/78
 /PAm7wtb2MTva7jqYDvea51JZZGXz32KGkqB4XTv0QcgGzar7wFKlBLuFKaEoMuHex
 4wNPk3/iUN1gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WJoziW2q
Subject: Re: [Buildroot] [PATCH 0/3] allwinner: second part of misc bsp
 updates
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

Sergey, All,

On 2023-04-10 20:50 +0300, Sergey Matyukevich spake thusly:
> Hi all,
> 
> Here is the second patch series with BSP updates for several Allwinner
> boards. This time xradio driver and boards with WiF are updated,
> including including OrangePi Zero and OrangePi Zero Plus2.
> 
> Regards,
> Sergey
> 
> Sergey Matyukevich (3):
>   package/xr819-xradio: bump version
>   configs/orangepi_zero: bump BSP versions
>   configs/orangepi_zero_plus2: update BSP versions

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

>  configs/orangepi_zero_defconfig        | 6 +++---
>  configs/orangepi_zero_plus2_defconfig  | 8 ++++----
>  package/xr819-xradio/xr819-xradio.hash | 2 +-
>  package/xr819-xradio/xr819-xradio.mk   | 2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 
> -- 
> 2.40.0
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
