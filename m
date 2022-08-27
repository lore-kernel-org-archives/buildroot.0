Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B276BECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FCCD82F49;
	Sat, 27 Aug 2022 07:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FCCD82F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IJ1Afyr0m-3; Sat, 27 Aug 2022 07:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 827CE82F39;
	Sat, 27 Aug 2022 07:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 827CE82F39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39C141BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14D1F60BB8
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D1F60BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sC7IjYW-aXYy for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:52:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C8860B5C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15C8860B5C
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:52:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 404D019F72E;
 Sat, 27 Aug 2022 09:52:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:52:23 +0200
Date: Sat, 27 Aug 2022 09:52:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075222.GI37358@scaer>
References: <20220826205104.18667-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826205104.18667-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661586747;
 bh=2mUm97E1F5ue7y0mltS44OD79FNaI30lODiaZJqcln8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tQCv7zfHTpBADFAUAP5duQGTP4pTdyyTVoJWgwkfZB1MRFxowDpFuzfceBHXwWjh+
 nIW3NreKK4X0YM6GIQRio2FD0S8tP+osCx86Lsm9Rkt3i0wUYlqLmoy+N2K6bZMh3q
 f9gg8eqHmli4ksb3xF4ZVTyj1jpFZECxlp34HLDcHnvKBFVo/N/gUd5/o84W1Tj/4a
 dx/9Z5x/1w1f+viVoelk7SM1gyvjB6SpLQKanz0+BVJstSK1f7NZNxRITOHXY+OtUd
 wh0YLFRvtLzoqlQNTJFfzNYSF7wnPs2jG/L3OmP3qlBiRAfobIcVgvCOyRnWhbZ0Ya
 oPAxVYw3d3d5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tQCv7zfH
Subject: Re: [Buildroot] [PATCH 1/1] package/mali-driver: fix legal-info
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-26 22:51 +0200, Fabrice Fontaine spake thusly:
> Fix typo: MALI_DRIVER_LICENSE_FILE -> MALI_DRIVER_LICENSE_FILES
> added by commit f3ecd9ea4a40d601317f3b7195be4f5d1bdb3146
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mali-driver/mali-driver.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
> index 2d5febe192..515f70c429 100644
> --- a/package/mali-driver/mali-driver.mk
> +++ b/package/mali-driver/mali-driver.mk
> @@ -8,7 +8,7 @@ MALI_DRIVER_VERSION = 3d697de9bce8bc68bf9408d5407873ce32d0f4fc
>  MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
>  MALI_DRIVER_DEPENDENCIES = linux
>  MALI_DRIVER_LICENSE = GPL-2.0
> -MALI_DRIVER_LICENSE_FILE = LICENSE
> +MALI_DRIVER_LICENSE_FILES = LICENSE
>  MALI_DRIVER_MODULE_SUBDIRS = r8p0/drivers/gpu/arm/midgard
>  
>  $(eval $(kernel-module))
> -- 
> 2.35.1
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
