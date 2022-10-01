Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFACC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BD483F7B;
	Sat,  1 Oct 2022 16:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BD483F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhjv5fHRGB7B; Sat,  1 Oct 2022 16:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6F8681762;
	Sat,  1 Oct 2022 16:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6F8681762
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90BB21BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 793B140BB4
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 793B140BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jW6v397fJPta for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:29:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86DFC408E8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86DFC408E8
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:29:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 60981780333;
 Sat,  1 Oct 2022 18:29:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:29:29 +0200
Date: Sat, 1 Oct 2022 18:29:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221001162929.GD30794@scaer>
References: <20220929111816.497911-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929111816.497911-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664641774;
 bh=lO91BiFnD6uRApw7wLU/FsDZoAlYmO6K6eGAjd/VpRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+milW7MFkp0qtpICzfrhK1ZauyQ82HAquBTrfH/PUV+siWCqensdu76kQCSlQZLg
 hyrneryS18mDsKGHWDXpSoIYic0XEgFSsTW6bffe0vVOFdG0UmE4ahWvohJq1j6asx
 Zh5geXssdjKLfrYzQ8kSd3RkDO7XA253HL24ax9fH8r5liZ+JQyZctWq0gcB9DF3T2
 YBbV0/t+Z4/Np+HPQE5t3r/OATKDS7ymwaXjNr9UZTntCj2XyodDFVWmuaQ5raIagr
 OdZr2nMDaDMQh41+D1RIxNY67sTrJmYkPqvLXpdI25k6yBMZapiE1BGRuh6bsGiH8q
 3nrS1MSWyG+Eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M+milW7M
Subject: Re: [Buildroot] [PATCH] package/gitlab-runner: fix forcing openssl
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-29 13:18 +0200, Giulio Benetti spake thusly:
> BR2_PACKAGE_LIBOPENSSL doesn't force selecting libopenssl, to achieve this
> we need to use BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL. So let's modify
> accordingly and improve a bit the comment.

I've reworded the commit log, and drop the comment change: the symbol
name is explicit enough as to what it does.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gitlab-runner/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
> index 72c2742562..bfa79ac80e 100644
> --- a/package/gitlab-runner/Config.in
> +++ b/package/gitlab-runner/Config.in
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
>  	select BR2_PACKAGE_LIBCURL_CURL # runtime
>  	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
>  	select BR2_PACKAGE_OPENSSL # runtime
> -	select BR2_PACKAGE_LIBOPENSSL # runtime
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime, force using libopenssl
>  	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
>  	select BR2_PACKAGE_TAR # runtime
>  	help
> -- 
> 2.34.1
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
