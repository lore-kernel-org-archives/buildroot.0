Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74905C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 15:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA4981F38;
	Tue, 15 Aug 2023 15:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA4981F38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrW-Icy-Bf7g; Tue, 15 Aug 2023 15:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0ED81F2D;
	Tue, 15 Aug 2023 15:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C0ED81F2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44E5F1BF475
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D58C402A8
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D58C402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QoQrmEnz4dl1 for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 15:13:14 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F16AD40017
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F16AD40017
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6587:c204:11b1:7ba6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A2F0E13F8DC;
 Tue, 15 Aug 2023 17:13:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 15 Aug 2023 17:13:08 +0200
Date: Tue, 15 Aug 2023 17:13:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230815151308.GC2603@scaer>
References: <20230815093844.13369-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230815093844.13369-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692112390;
 bh=lpMHTw5uYtLF6GXL6fEhEBVlJDZ+TlrekiUkjugislI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KsgAkQsRIAF5xJWLrObxuo6bx+joQOopmm+WyTLcNRAvnvy/ArICQV/BVH2wpy9+B
 ciMPO7jz2/UlI7WHpzZiVk+GWwyyBMkGjyTZ1rp4ODaQR+kcJWv7XwrxsCbMIrmzsx
 OMzCJBeMXvcZdrrvtsNc6xaBcgYatUKwfq9j0WAyn/jF8hDYfempWUqZrKzYWlfmS5
 tIh1OUhX0MQ4nGzSWinmGuuD8pV2KKUzyaxZC+8P0ga4cNcs9NjpQIjtzIRthxA1wM
 VARo0Cff2mzPfGaXdV240qkBwKcBQ2gRhwyZM90NbYn8jkR+pcVYFdCHA6WRoRWDBC
 omzu/fUbl/Wlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KsgAkQsR
Subject: Re: [Buildroot] [PATCH next 1/1] package/lsof: change
 _LICENSE_FILES to use COPYING
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

Julien, All,

On 2023-08-15 11:38 +0200, Julien Olivain spake thusly:
> Commit e3322e2c7 "lsof: add license info" added the package license
> info. At that time, lsof was at version 4.85. The package was not
> including a dedicated license file. Instead, the license text was
> copied in many files (source files, readmes, ...). It was then decided
> to use the small source file "dialects/linux/dproto.h".
> 
> Recently, lsof added a COPYING license file. See [1]. This commit was
> first included in lsof version 4.97.0. We can now use this file.

We already have lsof 4.98.0 in master, so this change belongs to master,
not next.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> The license file hash is updated due to formatting changes. As a side
> note, the copyright year in source file was 1997 (see [2]), whereas in
> the new license file it is 2002. Source files have different copyright
> dates, and can be as old as 1994, for example in [3]. The rest of the
> license text remains unchanged.
> 
> [1] https://github.com/lsof-org/lsof/commit/62dab61cae3ca9e4d41ec573ae5cda0c5689c326
> [2] https://github.com/lsof-org/lsof/blob/4.98.0/dialects/linux/dproto.h#L9
> [3] https://github.com/lsof-org/lsof/blob/4.98.0/arg.c#L7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/lsof/lsof.hash | 2 +-
>  package/lsof/lsof.mk   | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
> index b6a29b3cea..d9e85ac15c 100644
> --- a/package/lsof/lsof.hash
> +++ b/package/lsof/lsof.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  80308a614508814ac70eb2ae1ed2c4344dcf6076fa60afc7734d6b1a79e62b16  lsof-4.98.0.tar.gz
> -sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
> +sha256  225222ff9bf38abc2cef7205e9b05c60935efa9ec28d1fd01e503c9316088718  COPYING
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index 66911dddb9..66f346aa13 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -7,9 +7,7 @@
>  LSOF_VERSION = 4.98.0
>  LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
>  LSOF_LICENSE = lsof license
> -# License is repeated in each file, this is a relatively small one.
> -# It is also defined in 00README, but that contains a lot of other cruft.
> -LSOF_LICENSE_FILES = dialects/linux/dproto.h
> +LSOF_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
>  LSOF_DEPENDENCIES += libtirpc
> -- 
> 2.41.0
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
