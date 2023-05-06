Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E276EC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F2C7418F8;
	Sat,  6 May 2023 16:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F2C7418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIoCp4JjPhCn; Sat,  6 May 2023 16:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9DE417B9;
	Sat,  6 May 2023 16:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9DE417B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79B0E1BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6158981E99
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6158981E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQqNA5TGCDGA for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:10:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F73A81EAA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F73A81EAA
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:10:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B5EF2B00548;
 Sat,  6 May 2023 18:10:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:10:23 +0200
Date: Sat, 6 May 2023 18:10:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161023.GP252090@scaer>
References: <20230504002404.1463540-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504002404.1463540-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389426;
 bh=gZmLQzpDIHKyndAGpurNVi7aWdkDoWaH8ovESrkW38Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtZm8ofmbQGNRF+dS4dxf+eK7c3FLqcI070VQCXwcbXGoDb+UXmsO47ttjrTpk1nM
 RPSkDwSj0A2zFA21TVsVV9g3Y9dLOcqA6fF49jKh7Dh75d1ppLxEdXWVEZ6yD+nBwg
 qqEoXgEBox9WegBGmF/4dJaHFfYNiQ3bouCss06KHbmuKtP4nqWHuSGheO8b5hWU89
 7s/OYRbjLX+7fjVaVls5Wr5eQFWx39YRJ3OFsjjZTXXB2RpqZMHnu+TyAhhiKApqVh
 Cl308rkxsjCAhg0h/nAxWWDlWl6VJuQiBCvqXALLqEf+LmQTYUvgd5+e06A/S7kZIC
 lY5skti/TrXBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mtZm8ofm
Subject: Re: [Buildroot] [PATCH v1 1/1] package/delve: bump to version 1.20.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-05-03 17:24 -0700, Christian Stewart via buildroot spake thusly:
> https://github.com/go-delve/delve/releases/tag/v1.20.2
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/delve/delve.hash | 2 +-
>  package/delve/delve.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/delve/delve.hash b/package/delve/delve.hash
> index bf730b9047..105249f7f9 100644
> --- a/package/delve/delve.hash
> +++ b/package/delve/delve.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  39d2e3ae965abf5e71f3d8efbef368b1ee1d7154ea6604ec71d508350d419d03  delve-1.20.0.tar.gz
> +sha256  58ad7a7fb42ae2ddd33e7d52dad688b249ca8a358eb73b9e48f91eda79e862a8  delve-1.20.2.tar.gz
>  sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
> diff --git a/package/delve/delve.mk b/package/delve/delve.mk
> index b43d0f03c8..f261d240b2 100644
> --- a/package/delve/delve.mk
> +++ b/package/delve/delve.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DELVE_VERSION = 1.20.0
> +DELVE_VERSION = 1.20.2
>  DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
>  DELVE_LICENSE = MIT
>  DELVE_LICENSE_FILES = LICENSE
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
