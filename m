Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05CDC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 895C1416C6;
	Sat, 18 Nov 2023 14:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 895C1416C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjRfzQpEKVtL; Sat, 18 Nov 2023 14:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49BF418F8;
	Sat, 18 Nov 2023 14:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49BF418F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A218A1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B87D821A0
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B87D821A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id letfqdlWZUrq for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:00:31 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ADE882199
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ADE882199
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BBAAD780333;
 Sat, 18 Nov 2023 15:00:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:00:27 +0100
Date: Sat, 18 Nov 2023 15:00:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20231118140027.GT996011@scaer>
References: <20231117183216.79668-1-kazemi.ms@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231117183216.79668-1-kazemi.ms@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700316029;
 bh=Y1uA2fa+NFPhP0EdoivnMjypiUmLgQJh5hCt0qY+9E8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fgy4/NdD9Pgifc0254V1CeQvI1SCYX3zgLS8Zc7sIEnJTmH70e6H1m+dtLTFhpg6u
 kGGk0oJtWu67IXbIYLEF1+/JCixwpCv2GltXTj4gdvx1aEN9kKO75TMU95Y7qKNhvm
 9bAOj9CbtkF4H+h+bLYzc9v3H43SH3QzFKnwOsy+KZg5oNfzzFcLQFNVvCVvEH9Zrv
 dPefpY67FLotoFtgERbZKA5w+g0tjFxrrWLxuZPIZwZ79LdCItyXRfFr8d1d4ORbpq
 GVZWMrMP0NP5beRsTvfrxvXyUPf9gbKcOQ1KhfculiAmPLnuVvNJ2H1G2sbObKBFig
 D6vRYIjd78OiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fgy4/NdD
Subject: Re: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.16.0
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

Saeed, All,

On 2023-11-17 19:32 +0100, Saeed Kazemi spake thusly:
> Release notes:
> https://github.com/eza-community/eza/releases/tag/v0.16.0
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/eza/eza.hash | 2 +-
>  package/eza/eza.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/eza/eza.hash b/package/eza/eza.hash
> index 39923ceb48..64f46759d7 100644
> --- a/package/eza/eza.hash
> +++ b/package/eza/eza.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  2dac8aa41433eeaa07c4eabdf557b7e134c3fda9ba9edb8ab57959354856e20c  eza-0.14.0.tar.gz
> +sha256  11e6127a615744b52d52d66ebcdf9e5366f62746e8123b3eec00e35a057db988  eza-0.16.0.tar.gz
>  sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
> diff --git a/package/eza/eza.mk b/package/eza/eza.mk
> index a327de0dcc..b11c1a1e7f 100644
> --- a/package/eza/eza.mk
> +++ b/package/eza/eza.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EZA_VERSION = 0.14.0
> +EZA_VERSION = 0.16.0
>  EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
>  EZA_LICENSE = MIT
>  EZA_LICENSE_FILES = LICENCE
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
