Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A7ECD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 11:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83F8140A2E;
	Sat, 16 Sep 2023 11:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F8140A2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chE0t9XI8s05; Sat, 16 Sep 2023 11:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1A0940A0E;
	Sat, 16 Sep 2023 11:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1A0940A0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52AD91BF3F9
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 11:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C60A6103A
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 11:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C60A6103A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-4GKELm0uWw for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 11:50:29 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82BD461039
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 11:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82BD461039
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A43E3200402;
 Sat, 16 Sep 2023 13:50:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 13:50:22 +0200
Date: Sat, 16 Sep 2023 13:50:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230916115022.GT2571@scaer>
References: <20230916092206.851843-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916092206.851843-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694865026;
 bh=ZC1wBICCWRp6PaeFwgh3fDLcm9tJ2lviweA/QZutLz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QC8jnb5mj9glVhfsKAexV7KWBjaQnExR+SOBVx7AmZJ2xoXjinoHjCmKE7vPIXvXL
 WB7Jwn42km6oNBy18KHUyYwZQ8y2tRpEbTrtpiJ0KKI2SaZpvcE5eCbW2SNx/pvIhc
 gAEZDwsQHHHbPCjBeo6HuZXpJpPvuPHyhnbglUKwm8RwcbfgrrRIYpdK9/DVDr/TnE
 7SsXXN2zciwGCmTiytZC7BZ1hC7Z3kWBsFHzQsQDl0bzFvPTbDvonHm77dJ/B8YIpS
 q8zYsIzDj487dTUvK+OO5iF/VESjrzukFGtY7t03C2LayDzmxxc+W2IIttd7b65+DG
 rlIjI0Y+jnDgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QC8jnb5m
Subject: Re: [Buildroot] [PATCH] board/orangepi-zero-plus: update link in
 readme
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcin, All,

On 2023-09-16 11:22 +0200, Marcin Niestroj spake thusly:
> Old link is no longer working, so use new link instead.

We have a few other orangepi.org URLS, and by the look of those, they
prob ably no longer work either:

    $ git grep orangepi.org

Could you look into replacing those too, please?

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/orangepi/orangepi-zero-plus/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/orangepi/orangepi-zero-plus/readme.txt b/board/orangepi/orangepi-zero-plus/readme.txt
> index 5556eae890..1e60e0f825 100644
> --- a/board/orangepi/orangepi-zero-plus/readme.txt
> +++ b/board/orangepi/orangepi-zero-plus/readme.txt
> @@ -6,7 +6,7 @@ buildroot environment for the Orangepi Zero Plus. With the current configuration
>  it will bring-up the board, and allow access through the serial console.
>  
>  Orangepi Zero Plus link:
> -http://www.orangepi.org/OrangePiZeroPlus/
> +http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-Plus.html
>  
>  This configuration uses U-Boot mainline and kernel mainline.
>  
> -- 
> 2.42.0
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
