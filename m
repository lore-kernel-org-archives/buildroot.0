Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A68CD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D508B4016F;
	Sat, 16 Sep 2023 13:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D508B4016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0l4Z917H5Ka; Sat, 16 Sep 2023 13:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B09F40C58;
	Sat, 16 Sep 2023 13:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B09F40C58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6161BF41D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05AFC416D9
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05AFC416D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5eNin5Vo_7Tg for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:22:43 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF9CD416CC
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF9CD416CC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 13C9B2003D3;
 Sat, 16 Sep 2023 15:22:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 15:22:38 +0200
Date: Sat, 16 Sep 2023 15:22:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230916132238.GG415981@scaer>
References: <ZQWdso+HxD7K+tme@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQWdso+HxD7K+tme@waldemar-brodkorb.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694870561;
 bh=rq5Z6lB8/qqoXzIdhq81971JZR7Tnh02mx5zMdJFfSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=adFdjN8UH6wIYGYvGlOnSoK44Rw3qMt72qMe9qLd4DqTGJC5mIvS0W9Bg8uDWlEoH
 ieEeIWT5CKzo8r4Gdz3qMHHndG+HmHGPei0c1HjG52CKNgx7vfALu0bGHgJSioY9T1
 OpFt1lZYUjJFtNZAKwYZRFxBSblNhVOtzYCmv+60r1VV43EVbn8rYElSSbtE956TGz
 mgGqb0Vgda3I6cJgOmkCtT8khI3N1zwtQIOZCRQv6BfoCLy2XQ2S+ERZ374//sLfOz
 8ZbRUllTYw38sHd+R6yVIXzGkkBRXsbiJDHauwR9iGXGS04iYqVQI1m2NAcjBzyIyh
 h5QRAh0giR2XQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=adFdjN8U
Subject: Re: [Buildroot] [PATCH] package/libarchive: bump version to 3.7.2
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

Waldemar, All,

On 2023-09-16 14:21 +0200, Waldemar Brodkorb spake thusly:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libarchive/libarchive.hash | 2 +-
>  package/libarchive/libarchive.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index 02f7d84246..818113585e 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,4 +1,4 @@
>  # From https://www.libarchive.de/downloads/sha256sums
> -sha256  b17403ce670ff18d8e06fea05a9ea9accf70678c88f1b9392a2e29b51127895f  libarchive-3.7.1.tar.xz
> +sha256  04357661e6717b6941682cde02ad741ae4819c67a260593dfb2431861b251acb  libarchive-3.7.2.tar.xz
>  # Locally computed:
>  sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 5bcf559a6e..2db36156b8 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.7.1
> +LIBARCHIVE_VERSION = 3.7.2
>  LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
>  LIBARCHIVE_SITE = https://www.libarchive.de/downloads
>  LIBARCHIVE_INSTALL_STAGING = YES
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
