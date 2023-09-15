Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C62BCD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 259E5613FA;
	Fri, 15 Sep 2023 22:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 259E5613FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpWaMNWh5wIG; Fri, 15 Sep 2023 22:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31101613D8;
	Fri, 15 Sep 2023 22:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31101613D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 827D61BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C295409B5
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C295409B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDv8ZCQgiuQN for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:21:24 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F85F402A8
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F85F402A8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9B92F2003C1;
 Sat, 16 Sep 2023 00:21:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 00:21:19 +0200
Date: Sat, 16 Sep 2023 00:21:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230915222119.GR2571@scaer>
References: <20230915214415.30461-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915214415.30461-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694816482;
 bh=4RHeViFl7cwfF6+zZoPBD1ufWKaGGcOfWsJ8RycyYbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XXOIRqPMEc6rcEo4Lw+xvHaX06UBqYenLqKaL8D1wYmpbvNh37IeIhhaBj8aaQjQn
 pKgu3fIHWt5SByaArviUa5sC+IqdqdzwqEv6UgTggMPzH7VeE5pER9vDixNZu7qguf
 lZinvnvXvfBHRArZC2Zpx199gzCKWPK7psqAJ7etazlVHaFU2zCU1oQVRQe+dI8kXY
 gdX0M4B6cCJbq9Q7NWQUcQlQTdzvRiNnLAL9/0I6IwPbkxinqh6AwPvroBYLG2LyXK
 ttV+jXw3iIdtryTk7ydSmzdzf7wg/G5/4GvDoj/zU198Kg9XMHTEqwYi9WsR2qAwnw
 lZuDH3dvM1idg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XXOIRqPM
Subject: Re: [Buildroot] [PATCH 1/1] package/webp: security bump to version
 1.3.2
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-15 23:44 +0200, Fabrice Fontaine spake thusly:
> - security fixes for lossless encoder (#603, chromium: #1420107,
>   #1455619, CVE-2023-1999)
> - security fix for lossless decoder (chromium: #1479274,
>   CVE-2023-4863)
> 
> https://github.com/webmproject/libwebp/blob/v1.3.2/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/webp/webp.hash | 2 +-
>  package/webp/webp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/webp/webp.hash b/package/webp/webp.hash
> index 969e4cd3d7..adc543059b 100644
> --- a/package/webp/webp.hash
> +++ b/package/webp/webp.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df  libwebp-1.2.4.tar.gz
> +sha256  2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562aa09b4  libwebp-1.3.2.tar.gz
>  sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
> diff --git a/package/webp/webp.mk b/package/webp/webp.mk
> index 38a1564a63..33cb4bd507 100644
> --- a/package/webp/webp.mk
> +++ b/package/webp/webp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBP_VERSION = 1.2.4
> +WEBP_VERSION = 1.3.2
>  WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
>  WEBP_SITE = http://downloads.webmproject.org/releases/webp
>  WEBP_LICENSE = BSD-3-Clause
> -- 
> 2.40.1
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
