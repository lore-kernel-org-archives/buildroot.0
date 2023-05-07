Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098DFC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF5282205;
	Sun,  7 May 2023 12:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF5282205
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-oiuZ1mm-DY; Sun,  7 May 2023 12:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0E98821F4;
	Sun,  7 May 2023 12:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E98821F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6A4B1BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E9DF417B8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9DF417B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iNVrxD7WYG3 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:30:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 571C1417B3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 571C1417B3
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:30:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A97B719F73D;
 Sun,  7 May 2023 14:30:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:30:26 +0200
Date: Sun, 7 May 2023 14:30:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507123026.GM252090@scaer>
References: <20230507114224.3774853-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507114224.3774853-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683462628;
 bh=iIH6iFmaJDFM10ABNnFOE+Fhbu/BMdMpW6Q4f6ksEVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SEoWCLpqccWS6AbKy52IUReK34VOLL8N93WEZhbTuqmFpa0jXVZYAJcRyqpDYslzR
 0d6h48Ujokf1920kLH67ElAvQgjJPVLl/H4xR3xZHGb8agf+AVymzcZGlNBoj/VBr+
 FJo1/JPKVhTOAL9zABLNsQbtS+7RduTLYxQh3vXEqav81eKLDKWsXaVg9hUiRz0PBV
 HTXleQrA+27iEOgQjREoAPjlqh8ucAnpH2vSUhDdtgifCbC2mftoaJ2m4OWy1jbwD+
 ewKASJmDXL/DlVPryWZsy9kUn9/6q4+GUrCC0P08bSIx2/qv3A1F/N9QdXrVcRethg
 Fzf0jzro4MXYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SEoWCLpq
Subject: Re: [Buildroot] [PATCH 1/3] package/bento4: bump version to
 1.6.0-639-7-Omega
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

Bernd, All,

On 2023-05-07 13:42 +0200, Bernd Kuhls spake thusly:
> Needed for the upcoming version bump of the Nexus version of
> kodi-inputstream-adaptive.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Series applied to master, but with the fix for the licensing info first,
and the bumps last.

Regards,
Yann E. MORIN.

> ---
>  package/bento4/bento4.hash | 2 +-
>  package/bento4/bento4.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bento4/bento4.hash b/package/bento4/bento4.hash
> index 8e2033dc98..b9391aed6a 100644
> --- a/package/bento4/bento4.hash
> +++ b/package/bento4/bento4.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  8afa4ae07a7629a65e0d5014750960ced33a8771d363652f3913261fb5d0c84f  bento4-1.6.0-639-6-Nexus.tar.gz
> +sha256  4464cd47b597e6dedbfc231bb6eb097c45cfe5ee0051082460d9ac53e9d74dc3  bento4-1.6.0-639-7-Omega.tar.gz
>  sha256  7daae92c8628ada28def8d096fe2fde298b72ec3e2d64a3c408afce38edb361b  Documents/LICENSE.txt
> diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
> index a2e0805c17..8aefc401ef 100644
> --- a/package/bento4/bento4.mk
> +++ b/package/bento4/bento4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BENTO4_VERSION = 1.6.0-639-6-Nexus
> +BENTO4_VERSION = 1.6.0-639-7-Omega
>  BENTO4_SITE = $(call github,xbmc,Bento4,$(BENTO4_VERSION))
>  BENTO4_INSTALL_STAGING = YES
>  BENTO4_LICENSE = GPL-2.0+
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
