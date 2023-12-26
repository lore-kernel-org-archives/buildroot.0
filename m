Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F648C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D41EB814B5;
	Tue, 26 Dec 2023 20:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D41EB814B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFxIF1bXyo61; Tue, 26 Dec 2023 20:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4011480F73;
	Tue, 26 Dec 2023 20:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4011480F73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED5461BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D22464098F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22464098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7T-fB0FtHHL6 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:27:55 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1CBF408D5
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1CBF408D5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E0943B00535;
 Tue, 26 Dec 2023 21:27:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Dec 2023 21:27:50 +0100
Date: Tue, 26 Dec 2023 21:27:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYs3RjA4BFF6dlhx@landeda>
References: <20231226151754.449170-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226151754.449170-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703622474;
 bh=sT6w4cRJj6Z+3QLg6egD0mW1a0UUl11ZPCvbEEk+hQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hP9kOGf3iujdYjMpCAz4DHfH2r5XOkpBz4MUtTddJGZk5akZfv2+7RfZNxf3n2tfk
 GQbH4mYOMkltisUK8UcaX46LOR2t5Uy+As9O91geiW8zeLSCxcq8OQnQBu32SBfr9I
 BOPAyUsPPYD+xYw7P6VGKBfCtnfB9MXkW15pj0UlYx7hYlhmCBGyIU3K8VJLxuQn3Q
 Fgh5L4XvEL+qUHHz9V+a6NwvsuwgvyZ3nGjnayxSlCAgxCEbYLgzHX9zRPy3ysJwoM
 keRZouLOE69CQj2TOTeLw+SIrsSEy6L6KdxV+bf06IDTedn64Ft0gR8yamSIRuBvfe
 wGZKxy1hoZ4IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hP9kOGf3
Subject: Re: [Buildroot] [PATCH 1/1] package/libde265: security bump to
 version 1.0.15
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-26 16:17 +0100, Fabrice Fontaine spake thusly:
> A couple of bug fixes, including the following CVEs:
>  - CVE-2023-49465
>  - CVE-2023-49467
>  - CVE-2023-49468
> 
> https://github.com/strukturag/libde265/releases/tag/v1.0.15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libde265/libde265.hash | 2 +-
>  package/libde265/libde265.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
> index 9bb3f20a71..a21a8a1265 100644
> --- a/package/libde265/libde265.hash
> +++ b/package/libde265/libde265.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  99f46ef77a438be639aa3c5d9632c0670541c5ed5d386524d4199da2d30df28f  libde265-1.0.14.tar.gz
> +sha256  00251986c29d34d3af7117ed05874950c875dd9292d016be29d3b3762666511d  libde265-1.0.15.tar.gz
>  sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
> diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
> index 8624d2f949..62c22246aa 100644
> --- a/package/libde265/libde265.mk
> +++ b/package/libde265/libde265.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBDE265_VERSION = 1.0.14
> +LIBDE265_VERSION = 1.0.15
>  LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
>  LIBDE265_LICENSE = LGPL-3.0+
>  LIBDE265_LICENSE_FILES = COPYING
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
