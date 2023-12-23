Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F881C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 12:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 056EE400CE;
	Sat, 23 Dec 2023 12:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 056EE400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opa8O134iIJ0; Sat, 23 Dec 2023 12:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D329140522;
	Sat, 23 Dec 2023 12:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D329140522
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B82C1BF2A9
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 12:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44DA2821F3
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 12:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44DA2821F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euhUcQHI_sqn for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 12:48:00 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1376880C3F
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 12:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1376880C3F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E8C05B00571;
 Sat, 23 Dec 2023 13:47:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 13:47:54 +0100
Date: Sat, 23 Dec 2023 13:47:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <ZYbW-hVZ5DtnHHY9@landeda>
References: <20231222205321.5588-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222205321.5588-1-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703335677;
 bh=V7DG7b4NVhiiybO9evs9eTp2+8ateF0BREzN5Pe8S3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hY+offfLhwBNcsLV6otrykRBuxtdSLK/5JSNnXTpiFs+nJMlRY3uVjJBM2rktAPYd
 EnSyKbqfWFDB31ybNKXZrxL0X18T/w08U2HO7vwA2pkhURkXBDpV9L4GnusXAYOlKV
 hids6uLVDz2qvwxMidmZMS1Ags5q23FWZBdk94xvUVWsJMi2BpD/cR0kvyglylAx44
 tWgGjKkc3t/GllkiuGeFz3TC1gs8o7cHMYAsnvqwmQmIwCmIBYY9/iBYe+/+3lB3z3
 KUvhQ8r2kH+SbWHZmknxachifFckITz9R/Th/aniX2b8/kugSR7B+d160ndxMifS4N
 3BaPKXjSFlh6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hY+offfL
Subject: Re: [Buildroot] [PATCH 1/2] package/iputils: bump version to
 20231222
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

Petr, All,

On 2023-12-22 21:53 +0100, Petr Vorel spake thusly:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/iputils/iputils.hash | 4 ++--
>  package/iputils/iputils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
> index ea23f27f3c..c2f6a40797 100644
> --- a/package/iputils/iputils.hash
> +++ b/package/iputils/iputils.hash
> @@ -1,5 +1,5 @@
> -# https://github.com/iputils/iputils/releases/download/20221126/sha256sum.asc
> -sha256  745ea711fe06d5c57d470d21acce3c3ab866eb6afb69379a16c6d60b89bd4311  iputils-20221126.tar.gz
> +# https://github.com/iputils/iputils/releases/download/20231222/sha256sums.asc
> +sha256  e3ce5e1a1f795c2d520985463b90e20f9388b7060796d54ad64509aa8e4af775  iputils-20231222.tar.gz
>  # Locally computed
>  sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
>  sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index fe4468ec19..783ed9a0e7 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -11,7 +11,7 @@
>  # and IPv6 updates.
>  # http://www.spinics.net/lists/netdev/msg279881.html
>  
> -IPUTILS_VERSION = 20221126
> +IPUTILS_VERSION = 20231222
>  IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
>  IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
>  IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
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
