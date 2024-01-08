Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EDEC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D745383B20;
	Mon,  8 Jan 2024 20:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D745383B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sThr5eETaoMR; Mon,  8 Jan 2024 20:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36C1A83AFA;
	Mon,  8 Jan 2024 20:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C1A83AFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 216381BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0784F40173
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0784F40173
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHFEigHtkMLf for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:47:56 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06D9A4015D
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D9A4015D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CBEB460129;
 Mon,  8 Jan 2024 21:47:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 21:47:51 +0100
Date: Mon, 8 Jan 2024 21:47:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZZxfdzSiTecDpHrH@landeda>
References: <20240108080413.1661026-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108080413.1661026-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704746873;
 bh=7Hr5TMoU//2EiyeiHJ0FTSHAZt7qGKZL4IhjsCIB+2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gobNE/10c+yQ7d72r45ykAPPQ5xW7vMSkZQAQ+j/nE4IzuYDWskmrSHAT4qL+HSRs
 bjQfwT6iM3/uX97SwvCONAP4CWtvOGLfEf86ZJIOCvnSFwr5w4t3IHppa6RueMpeS0
 URSlylWi+g+GfZAp4aZEcJPOvnPqBgo45VpCxkIZfsJY3xR5csjdoO4UfsMt3L2bKo
 DgOQyRWzH4/kazkjAEQ/7Z1aAqlmmxHJj6JAemgLiRS5/xNXjU+oSVWY6gUUV67iME
 QrFVsjIezhB4FZekHu3SCEA817rjTvRssJr/brmkDKep3Q3EyPYwTt+hYGGcAa5Wny
 5lM5Eppoe2mbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gobNE/10
Subject: Re: [Buildroot] [PATCH] boot/shim: security bump to version 15.6
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

Peter, All,

On 2024-01-08 09:04 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issue:
> 
> CVE-2022-28737: There's a possible overflow in handle_image() when shim
> tries to load and execute crafted EFI executables
> 
> https://github.com/advisories/GHSA-hmxr-46w2-jjwh
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/shim/shim.hash | 2 +-
>  boot/shim/shim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/shim/shim.hash b/boot/shim/shim.hash
> index a0a9f06f35..c9c489fd2f 100644
> --- a/boot/shim/shim.hash
> +++ b/boot/shim/shim.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256  8344473dd10569588b8238a4656b8fab226714eea9f5363f8c410aa8a5090297  shim-15.4.tar.bz2
> +sha256  eab91644a3efe91a666399f5d8eb3eed0e04d04f79d4b6c0b278ef7747a239a5  shim-15.6.tar.bz2
>  sha256  15edf527919ddcb2f514ab9d16ad07ef219e4bb490e0b79560be510f0c159cc2  COPYRIGHT
> diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
> index 0a6d1527aa..bbef81cfc4 100644
> --- a/boot/shim/shim.mk
> +++ b/boot/shim/shim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SHIM_VERSION = 15.4
> +SHIM_VERSION = 15.6
>  SHIM_SITE = https://github.com/rhboot/shim/releases/download/$(SHIM_VERSION)
>  SHIM_SOURCE = shim-$(SHIM_VERSION).tar.bz2
>  SHIM_LICENSE = BSD-2-Clause
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
