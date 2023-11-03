Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BB1C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 22:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2EB160C13;
	Fri,  3 Nov 2023 22:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2EB160C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jn6vwSg2u-15; Fri,  3 Nov 2023 22:20:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4F460BEB;
	Fri,  3 Nov 2023 22:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4F460BEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BEAB1BF5F8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8EAF41E44
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8EAF41E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdQIKRYy6tgL for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 22:19:26 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB59D41E41
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 22:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB59D41E41
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:207e:5629:5034:6d7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 24338B00571;
 Fri,  3 Nov 2023 23:19:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 Nov 2023 23:19:21 +0100
Date: Fri, 3 Nov 2023 23:19:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103221921.GH2875@scaer>
References: <20231103214055.17650-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231103214055.17650-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699049964;
 bh=1iOkPrylEjn1yaLhwWaHBhbURvfgzGvOWcc8Kb4WEMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b6mZfUQNLBCYbPWiIkgQBumixHKpQBzRZct/JcnTu9qFNzCQhpFZ+VS0ahi9lRinN
 zM3aQUzXNW3muPek+VVW/XfLg40RqWHfTH3Y3pyXv5eerXH37i3b9XOekJfOgYHCoR
 BNLvjDOCWtxsUfwzvlCYc/QXpCxpeE5oacAp6RZeG6EqViXLeH/SnOmAXVx1AS9Ce0
 enTRrV2q7DuyqLI4qGMBxMUBQxVKKmiBQ1jfDC5ilfSAJZwM4nM3v+WLUUKJGGXKNh
 rlS32Cq34tsoIFcW9OcdYhAG0N+QidBTKtcmngtCqcUfpMn0riTnNirj+IQWtc9S7j
 sX2cQu5W1XpfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b6mZfUQN
Subject: Re: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.22.0
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

Fabrice, All,

On 2023-11-03 22:40 +0100, Fabrice Fontaine spake thusly:
> https://valgrind.org/docs/manual/dist.news.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/valgrind/valgrind.hash | 4 ++--
>  package/valgrind/valgrind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
> index d406babe35..d236c7b4a0 100644
> --- a/package/valgrind/valgrind.hash
> +++ b/package/valgrind/valgrind.hash
> @@ -1,7 +1,7 @@
>  # From https://valgrind.org/downloads/current.html
> -sha1  817d769743d278b5d07526e85115082054e9bf9c  valgrind-3.21.0.tar.bz2
> +sha1  60894cbf59d480c1794674da24a8406518a8df59  valgrind-3.22.0.tar.bz2
>  # locally computed
> -sha256  10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971  valgrind-3.21.0.tar.bz2
> +sha256  c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c  valgrind-3.22.0.tar.bz2
>  
>  # License files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index b168651319..40bc05d87d 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VALGRIND_VERSION = 3.21.0
> +VALGRIND_VERSION = 3.22.0
>  VALGRIND_SITE = https://sourceware.org/pub/valgrind
>  VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
>  VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
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
