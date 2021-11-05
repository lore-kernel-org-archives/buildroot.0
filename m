Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D132CC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:41:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DEC61159
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87DEC61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262524074F;
	Fri,  5 Nov 2021 21:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXj-IzqV2u2Z; Fri,  5 Nov 2021 21:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 717C0406DE;
	Fri,  5 Nov 2021 21:41:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23C201BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D9B2406DE
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pG5xv7nFJ0Se for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:41:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D624406D4
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:41:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d6e:5497:a761:f603])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 767395FFAD;
 Fri,  5 Nov 2021 22:41:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636148513;
 bh=KOQABBw9TAAmo/rbcwwmd41m74rjyz8v1gaZ8OpXOg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ipUDUvGzRFAbNZmHjoxdX/QfkkUDSKqxp5gqS6Wmw/rrGfuafxo5jSv1SpEbwPInc
 YLlyWMntKG8rFFvkL8gxRhhatBOMonMssEaS2SdaNPah5AMtO3bxDVy+25qGjGA9Kv
 3hde4SPfWmD1hcHFtm8BJhsjBllo6j+1Pdt8mkh9OeAbedFklfdaXmSTQPtxRn4X6o
 ovAeklV/g3E8cevwLb76yBdZwa91muv2MMJwYHdJbPZ6FeVwvX6NB7qteVi+iTqerP
 27vulX51gnKmsY4ekrYr8LA614Ebc2URdsJF+RVVMxW2O+OXWZLWZxu5zJ0sr1zR3f
 PByCjwC0E2tPw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 22:41:47 +0100
Date: Fri, 5 Nov 2021 22:41:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211105214147.GJ2400@scaer>
References: <20211105213116.2589815-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211105213116.2589815-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libteam: drop
 LIBTEAM_CPE_ID_VENDOR
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
Cc: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-05 22:31 +0100, Fabrice Fontaine spake thusly:
> LIBTEAM_CPE_ID_VENDOR was wrongly set since the addition of the package
> in commit 7485f5be0c460649e7406699cde82bb492aa23f1 as
> cpe:2.3:a:libteam:libteam is not a valid CPE identifier for this
> package:
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibteam%3Alibteam

I hadn't pushed that for more than 30 minutes that you already
noticed. Woo... Scray! ;-)

How did you catch this?

How can we easily validate that a CPE is indeed valid (short of running
the full pkg-stats)?

Joachim, what made you think libteam was appropriate?

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libteam/libteam.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/libteam/libteam.mk b/package/libteam/libteam.mk
> index 99454a03e5..8bd83aa20d 100644
> --- a/package/libteam/libteam.mk
> +++ b/package/libteam/libteam.mk
> @@ -6,7 +6,6 @@
>  
>  LIBTEAM_VERSION = 1.31
>  LIBTEAM_SITE = $(call github,jpirko,libteam,v$(LIBTEAM_VERSION))
> -LIBTEAM_CPE_ID_VENDOR = libteam
>  LIBTEAM_LICENSE = LGPL-2.1+
>  LIBTEAM_LICENSE_FILES = COPYING
>  LIBTEAM_DEPENDENCIES = host-pkgconf jansson libdaemon libnl
> -- 
> 2.33.0
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
