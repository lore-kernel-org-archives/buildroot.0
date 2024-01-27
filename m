Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3CC47DA9
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2025281B9D;
	Sat, 27 Jan 2024 20:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2025281B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8YYNJjjZVb_j; Sat, 27 Jan 2024 20:23:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B4E88135E;
	Sat, 27 Jan 2024 20:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4E88135E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 884BD1BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60E2B8133C
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E2B8133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EcI3Aqyi33A7 for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:23:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CEDF8175D
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CEDF8175D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 49D1A13F89A;
 Sat, 27 Jan 2024 21:23:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 21:23:43 +0100
Date: Sat, 27 Jan 2024 21:23:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZbVmT0V0pDW6IegC@landeda>
References: <20240126135747.2407552-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240126135747.2407552-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706387026;
 bh=n4LHAEgBIFh2GiSgDgHpdx+8e2IZP0L2OtErMY0cJ7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R7oOmg2AMyoCGxFuTh4ONUZEBoOi4hoW/N3/7oU3TfR6CBJl71NkEbaBZTm8tmL1g
 Pkp6cev9hWCniSBibmj4KS7BHRG1nCd8EbWmBoghH82xtjI/DhxOvuIcCMyAREXCDL
 KuVopRaIwR7D90Wyy4kvxAukI8RXB1gO0wHxZHDug5Vy3iZTUZtYFgYSNqDqZ8CIOS
 6aM9XKPRschdFG6zPocq6OREOg0p9yBmVT1Ry7FIVxbV3tjQcJWKh35nwqbU3BMmzj
 ndx7yHykCxu6MWAqE/hjlxeAhVnThYui8UBU+GorGtvxb4HHWFB9324OICnWTkTSLa
 zhR3MKXsz2lQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R7oOmg2A
Subject: Re: [Buildroot] [PATCH] package/darkhttpd: security bump to version
 1.15
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-01-26 14:57 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> CVE-2024-23770: Local Leak of Authentication Parameter in Process List
> 
> CVE-2024-23771: Basic Auth Timing Attack
> 
> https://security.opensuse.org/2024/01/22/darkhttpd-basic-auth-issues.html
> 
> Notice that CVE-2024-23770 is only documented as a known weakness, not
> fixed.
> 
> Also change the license logic to use the dedicated COPYING file available
> since 1.14:
> 
> https://github.com/emikulic/darkhttpd/commit/a8ae2b1de069588cad23d79a5392445ee9590fcd
> 
> This license is ISC, not MIT - So adjust DARKHTTPD_LICENSE to match.

This means the licensing stuff should be backported to the maintenance
branches, and should thus have been a separate patch prior to the
version bump.

But since this is a security fix, I guess you'll want to backport the
version bump too. And since the odlest stable, 2023.02, already had
darkhttpd 1.14, it is possibe to backport the version bump to all
maintenance branches.

Thus, I considered splitting, got slightly cat-distracted, and pushed
without splitting.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/darkhttpd/darkhttpd.hash | 4 ++--
>  package/darkhttpd/darkhttpd.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
> index 188afff767..84a787eeba 100644
> --- a/package/darkhttpd/darkhttpd.hash
> +++ b/package/darkhttpd/darkhttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally generated
> -sha256  e063de9efa5635260c8def00a4d41ec6145226a492d53fa1dac436967670d195  darkhttpd-1.14.tar.gz
> -sha256  f002944c9a8516e3346002d39c3e13681306833358c0f3c7781dff1fdb639710  darkhttpd.c
> +sha256  ea48cedafbf43186f4a8d1afc99b33b671adee99519658446022e6f63bd9eda9  darkhttpd-1.15.tar.gz
> +sha256  1ecf63e8f84fd60ac7215e04195b9a61dcb47176ea65df26547582027f6c1dee  COPYING
> diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
> index bda08899b8..e13f8f7770 100644
> --- a/package/darkhttpd/darkhttpd.mk
> +++ b/package/darkhttpd/darkhttpd.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -DARKHTTPD_VERSION = 1.14
> +DARKHTTPD_VERSION = 1.15
>  DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
> -DARKHTTPD_LICENSE = MIT
> -DARKHTTPD_LICENSE_FILES = darkhttpd.c
> +DARKHTTPD_LICENSE = ISC
> +DARKHTTPD_LICENSE_FILES = COPYING
>  DARKHTTPD_CPE_ID_VENDOR = darkhttpd_project
>  
>  define DARKHTTPD_BUILD_CMDS
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
