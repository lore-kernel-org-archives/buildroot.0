Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E401C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD446404A6;
	Sat, 16 Jul 2022 15:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD446404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhgK-JrBLV_h; Sat, 16 Jul 2022 15:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDF10400FB;
	Sat, 16 Jul 2022 15:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF10400FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 222DE1BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AB4D400FB
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AB4D400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oM5cWMJHl5oO for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:32:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7E7F400A8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7E7F400A8
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:32:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44d:f503:4d93:3115])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0AF31B00722;
 Sat, 16 Jul 2022 17:32:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jul 2022 17:32:47 +0200
Date: Sat, 16 Jul 2022 17:32:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716153247.GC2543@scaer>
References: <20220716143311.711343-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716143311.711343-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657985570;
 bh=PXvlgShdtJYRzAOfIlhOFlmKzPLk9U8dqQLwiDQbkUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jWaCBPmEvyTR5XyYW8snJMKedxK6kTtYEI2CHh87LdsEG56TbaUoomouwk7Va4kKL
 FI5H28L0eNaUcyZ4naZffsZ07iFKeImgpqKkTmKm3wA0p7w1deehmwy60vdTWiC5/D
 sQ5v//I1HfGA6R/2iG4d/KW6KrHHyvWxFzdOH5uqNXxtI9Y0j9WigS6hDHC9Vm5jq1
 FivWqRqqaxW+TrJJZibu2Gdfl289jUDb7kCWoS+nmCpspCXMEOWxLoN0B3seQ/oOPU
 JTu0rwvgpFxZX1QW62RXCxib3XbXwpKDf4EN7IZj1Hh9Yzn3L2Df8hBMpmFmCi8ppG
 7eUcCTDRzaaDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jWaCBPmE
Subject: Re: [Buildroot] [PATCH 1/2] package/gnupg2: drop unrecognized option
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

Fabrice, All,

On 2022-07-16 16:33 +0200, Fabrice Fontaine spake thusly:
> --disable-regex has been dropped since version 2.2.22 and
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=ba247a114c75a84473c11c1484013b09fbb9bcd1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gnupg2/gnupg2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 906b79e0ab..0a2cebfab3 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -16,7 +16,7 @@ GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
>  
>  GNUPG2_CONF_OPTS = \
> -	--disable-rpath --disable-regex \
> +	--disable-rpath \
>  	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
>  	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
>  	--with-libassuan-prefix=$(STAGING_DIR)/usr \
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
