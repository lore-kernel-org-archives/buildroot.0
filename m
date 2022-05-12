Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879A0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32C9081771;
	Thu, 12 May 2022 20:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cAIVFkm8CUO; Thu, 12 May 2022 20:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32FE882438;
	Thu, 12 May 2022 20:03:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B49761BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2042408A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjCRRbbzA7Ch for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:03:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67E9440884
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:03:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 36D6519F574;
 Thu, 12 May 2022 22:03:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652385816;
 bh=MxLz9MA4pz9KH3lIFE0MG/AqUahLaKkqP9mOiHrhdto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICK7Qx565vVEcJnpGJ1DwmBZwTfjH1Plw+x9x2OIM7dypqG8gU/AQPq5igmJv/8zU
 kJv8WrPIv2zfOiwxPkbDHzdloU5GrDK4rdU057qeAwG64Cq92FoxLQSCisf9VCTNJf
 UlSav/v2gdRltAid4yfaRg0OfELStQiQklm/WDnBjHa7WAywTfkSfCMnInEn6NMt/2
 Vv5qss/NK+oMs3szabqSgbX1o3cg7pRePf7DHxTLAOHjc52hjo+gK3sGk5slhldPxe
 kwYEQlGeorAA2A1X7jo8qGbTM3MUSLIoiLoQXWwmBkTb0Yk4DV8/iBvnEZ4CxFuWIP
 N0KFc1G4j5ykg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:03:33 +0200
Date: Thu, 12 May 2022 22:03:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220512200333.GD1597494@scaer>
References: <20220512190203.1022201-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512190203.1022201-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.0.19
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

On 2022-05-12 21:02 +0200, Bernd Kuhls spake thusly:
> Changelog: https://www.php.net/ChangeLog-8.php#8.0.19
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 76501c0fdd..e0aca101b4 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  db161652cacae4b31c347fbf2e17b80656473cb365f2bb3460c4552f5647e2e7  php-8.0.18.tar.xz
> +sha256  ba62219c4b0486cbb2a04f0796749a46b0ee1f5a142ed454212b4e2460cb0fab  php-8.0.19.tar.xz
>  
>  # License file
>  sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index adfbf3cad2..5053f34b85 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.0.18
> +PHP_VERSION = 8.0.19
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> -- 
> 2.30.2
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
