Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CC1C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D67C340143;
	Sun, 20 Nov 2022 09:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D67C340143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZsjbrwEvpfF2; Sun, 20 Nov 2022 09:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3EC2400E7;
	Sun, 20 Nov 2022 09:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3EC2400E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 601B51BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 489D381F44
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 489D381F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ya7j_6L1GKyo for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:25:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B84581F3F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B84581F3F
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:25:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 863A6B00565;
 Sun, 20 Nov 2022 10:25:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 10:25:35 +0100
Date: Sun, 20 Nov 2022 10:25:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221120092535.GU2123054@scaer>
References: <20221119084126.14859-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119084126.14859-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668936338;
 bh=ogW8klWFAJo5bXfAoY8wPHSGxrDVQF/D9VRbGBF9hME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FgZEiB9KBBtVnvT7L0grrXQ6wsQb5gmuczyR8zB9R1mENfd7jJTEOWDz593jSWlyK
 ZyaXrkXadW27jiXBW/NpmQyeDQkrTez3DBN52pNTdleC7RUmyf7eJaAU8EGvssv+Ix
 hAXIG1Rdr9O55aIynNBwbhq5ApZtes7DMvXZMMYaqv0s1EQSiyhGvTNDGNF8pyZ8Ah
 dTc37gbo2LL9X1FeQNZrxS4iAxVmUftB4KiBL0o0OphNkysQtW7P7zVB1p/bz/foE0
 YxZigWSafJOIgVJ5MrwaU8qzXDOkBmxf9eRzQgjnXMbzAPwxv6LQc2Vf8EhSrE+7M3
 5m4aE00w3hwBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FgZEiB9K
Subject: Re: [Buildroot] [PATCH next 1/1] package/gnuradio: remove patch
 numbering
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-11-19 09:41 +0100, Julien Olivain spake thusly:
> commit e37c110 ("package/gnuradio: bump version to 3.10.4.0")
> included two numbered patches. Those are generating
> "make check-package" warnings.
> 
> Fixes:
>     make check-package
>     package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch:4: generate your patches with 'git format-patch -N'
>     package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch:4: generate your patches with 'git format-patch -N'
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...01-blocks-Including-missing-vector-in-blockinterleaver.patch | 2 +-
>  ...2-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
> index f805e300af..39b8c0b51e 100644
> --- a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
> +++ b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
> @@ -1,7 +1,7 @@
>  From 45fe4ac55ad88b6793d225e676205c30388ec138 Mon Sep 17 00:00:00 2001
>  From: Ryan Volz <ryan.volz@gmail.com>
>  Date: Fri, 16 Sep 2022 21:05:51 -0400
> -Subject: [PATCH 1/2] blocks: Including missing <vector> in blockinterleaver.
> +Subject: [PATCH] blocks: Including missing <vector> in blockinterleaver.
>  
>  Signed-off-by: Ryan Volz <ryan.volz@gmail.com>
>  [Retrieved (and backported) from:
> diff --git a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
> index d551793be5..f1ad77580f 100644
> --- a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
> +++ b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
> @@ -1,7 +1,7 @@
>  From 901c2ad1ac88908a2e6db5615d5af39a218d826d Mon Sep 17 00:00:00 2001
>  From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>  Date: Fri, 23 Sep 2022 08:41:26 +0200
> -Subject: [PATCH 2/2] blocks/blockinterleaving.h: add missing cstddef header
> +Subject: [PATCH] blocks/blockinterleaving.h: add missing cstddef header
>   (required for size_t)
>  
>  Fix build failure like:
> -- 
> 2.38.1
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
