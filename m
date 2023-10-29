Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDD5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74E514311E;
	Sun, 29 Oct 2023 08:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74E514311E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apKR0Cr-IUwT; Sun, 29 Oct 2023 08:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48AC643124;
	Sun, 29 Oct 2023 08:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48AC643124
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1E491BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96BF84249E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96BF84249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gy5OBwyFpUM for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:47:01 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2088F4311F
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2088F4311F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 69AC820047F;
 Sun, 29 Oct 2023 09:46:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:46:57 +0100
Date: Sun, 29 Oct 2023 09:46:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231029084657.GR687180@scaer>
References: <20231026172713.4147295-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026172713.4147295-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698569219;
 bh=rAoZeEMEYsLOutd3y+uFLqaE2p9vJxUKo9WNSUr1ncs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CJCPXTmbMMJFBvQYjrSiUs70EXT+r2H5MuRuCx58+9i9AkieO6w/PDvFVPbkYGchW
 hHZlTNf1Om5TpxfSTcUJJ/2GW2CrgYCnShNcYVBG/pghfy9rqMnBFLdc2Xr5Yeym85
 bzgdMEh7o1Ie8xC++uYViMitxGhT1UKKgYN0uF6+30OvguMd9EOUR5+G1/f1ncxBDq
 oZj0ZMIJjqsryDR+82WuR+BmWede5/YRC3p98lP3Rd4sp5JErPa/6cHwClVF5L0Ltg
 J6aBKX/u7T0dvO1FnJWQ+Z4MVxPrDzQL2SHkjMjDmq1evf1l4LzPrJsjgWk52L9fqk
 bwt4aLQY+0O0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CJCPXTmb
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.2.12
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

On 2023-10-26 19:27 +0200, Bernd Kuhls spake thusly:
> Changelog: https://www.php.net/ChangeLog-8.php#8.2.12
> Release notes: https://www.php.net/releases/8_2_12.php
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index e5f94a5e05..0f77f0082f 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  29af82e4f7509831490552918aad502697453f0869a579ee1b80b08f9112c5b8  php-8.2.11.tar.xz
> +sha256  e1526e400bce9f9f9f774603cfac6b72b5e8f89fa66971ebc3cc4e5964083132  php-8.2.12.tar.xz
>  
>  # License file
>  sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index ee33000a6f..add46584c6 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.2.11
> +PHP_VERSION = 8.2.12
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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
