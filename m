Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD7C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 20:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFC90403A9;
	Sat,  1 Oct 2022 20:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFC90403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uGlj_eSjw2D; Sat,  1 Oct 2022 20:57:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAB3B40549;
	Sat,  1 Oct 2022 20:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAB3B40549
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE001BF330
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DACEB403A9
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DACEB403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ZYN80-rF8tQ for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 20:57:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA44140179
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA44140179
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 20:57:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 091AD780340;
 Sat,  1 Oct 2022 22:57:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 22:57:22 +0200
Date: Sat, 1 Oct 2022 22:57:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20221001205722.GX30794@scaer>
References: <20220927105752.760729-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927105752.760729-1-nunes.erico@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664657845;
 bh=mANq4oMf0UqOz1MirDenACzW71ePphwI+jvo3pfcGHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lhp+yAUVicRxxQ4NaZN8Qnc/TUJx4moK4eqlOabTTnEVxfUKnzGdyzKJvC3/XIKRm
 VIGrUgvwupWzT08HvoT8F4REoAL6aAr8wJnW+tu82sAypHhDJb9xn3vhpO9eR1fZAK
 QPoBPANVca5phMx8aJNhKchoL9mxtrg1HMYdzJSIfVWQNAQAtiJ+t7n0pHld0w7+oC
 riSL6bl5DWTtrqYHMMB3So7lPKNGe00GDwFLZpq+zAM+vkHJGJBFwx4nlLB42J85gA
 Vuo4un87kMDWQ/tscs4XbrWUkizlhQs/83x3Bi3qBRLbbgWYlztDVOKPpPC53g/bUY
 r7tO+Azw211Nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lhp+yAUV
Subject: Re: [Buildroot] [PATCH] package/acpica: bump to version 20220331
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

Erico, All,

On 2022-09-27 12:57 +0200, Erico Nunes spake thusly:
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/acpica/acpica.hash | 4 ++--
>  package/acpica/acpica.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
> index a2fdfe602e..4b6981c602 100644
> --- a/package/acpica/acpica.hash
> +++ b/package/acpica/acpica.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256  8a49904744a8159b7f325ed941b56968ba37a0371c634036628064f97538de4b  acpica-unix2-20200717.tar.gz
> -sha256  cb17c679d3291eba1a70a1336062fb07eec2e839b0821b443b24f41de18c5218  source/include/acpi.h
> +sha256  1ccda5c6a08a90b145777df635eb09f995b3472b3128f375009c5a6b01a04c7a  acpica-unix2-20220331.tar.gz
> +sha256  c7c5facde0edec64ce403043082a4b288543b9a120d86a23bba3be7585e021aa  source/include/acpi.h
> diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
> index 21ecc155be..9901c1ed48 100644
> --- a/package/acpica/acpica.mk
> +++ b/package/acpica/acpica.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ACPICA_VERSION = 20200717
> +ACPICA_VERSION = 20220331
>  ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
>  ACPICA_SITE = https://acpica.org/sites/acpica/files
>  ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
> -- 
> 2.37.3
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
