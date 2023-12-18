Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834EBC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 377F8404FC;
	Mon, 18 Dec 2023 16:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 377F8404FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tsztt6qQTyVn; Mon, 18 Dec 2023 16:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2197640610;
	Mon, 18 Dec 2023 16:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2197640610
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25D451BF2B3
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C788408BF
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C788408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJkaXN_xbhW5 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:48:19 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE780408AD
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE780408AD
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 94846B0059A;
 Mon, 18 Dec 2023 17:48:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 17:48:13 +0100
Date: Mon, 18 Dec 2023 17:48:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZYB3zb5QbQsEh97e@landeda>
References: <20231218125026.3844825-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218125026.3844825-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702918096;
 bh=iLcYcvSOYjbJbsVPdpvBY4AyXLw+xFV8TAQiW8qxwwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EK4I8KKICqdqR4tSPQj0IPtp3sxHSBKCwUf4fGQZcix+hZbyLCYJEFIV4S6hXVfNT
 jfFCSUHjNzPgOXsIkgIjFKDjFp6+2wxMpQ8uyBfggi5oPk7k9SIbUju+9IAZKYPM8K
 0JS3mL9O5yXrKSvjh/vNDDSrU1xLDWw2jybr9HrmqMuIfuo1FYyv++eX5/U9lg6nu1
 pE8R43kjdBHXCLWAMMPxdLsA+YxtNb0MTOzC/StyU+cOZrfmtetZXYFw1uYKRjCHYz
 AujnYhiBkX3LIGEU8Lo3M/P4A5k5FJgrnI/XilV2vR+IR3nTDNcbJTBLOFdmJqJsOS
 ZAVzcNUZWcK+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EK4I8KKI
Subject: Re: [Buildroot] [PATCH] package/jq: security bump to version 1.7.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-12-18 13:50 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> CVE-2023-50246: Fix heap buffer overflow in jvp_literal_number_literal
> https://github.com/jqlang/jq/security/advisories/GHSA-686w-5m7m-54vc
> 
> CVE-2023-50268: fix stack-buffer-overflow if comparing nan with payload
> https://github.com/jqlang/jq/security/advisories/GHSA-7hmr-442f-qc8j
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/jq/jq.hash | 2 +-
>  package/jq/jq.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/jq/jq.hash b/package/jq/jq.hash
> index 6c2db98e87..d4d8656ea0 100644
> --- a/package/jq/jq.hash
> +++ b/package/jq/jq.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  402a0d6975d946e6f4e484d1a84320414a0ff8eb6cf49d2c11d144d4d344db62  jq-1.7.tar.gz
> +sha256  478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2  jq-1.7.1.tar.gz
>  sha256  10e974638a41fadfd72357f2f3a4325e20b856c563365128f72feaa406f8c92d  COPYING
> diff --git a/package/jq/jq.mk b/package/jq/jq.mk
> index d886459dcc..8c417fad31 100644
> --- a/package/jq/jq.mk
> +++ b/package/jq/jq.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -JQ_VERSION = 1.7
> +JQ_VERSION = 1.7.1
>  JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
>  JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
>  JQ_LICENSE_FILES = COPYING
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
