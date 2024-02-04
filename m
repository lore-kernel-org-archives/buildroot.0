Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1FDC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E775851AB;
	Sun,  4 Feb 2024 10:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E775851AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJVWR7FFuLEG; Sun,  4 Feb 2024 10:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5A4185186;
	Sun,  4 Feb 2024 10:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5A4185186
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42BF81BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AE3D419C0
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AE3D419C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzWxiHCmNTn0 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:08:29 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB520419BB
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB520419BB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BDBCCB0053E;
 Sun,  4 Feb 2024 11:08:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 11:08:23 +0100
Date: Sun, 4 Feb 2024 11:08:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb9iF4lklBHZ795s@landeda>
References: <20240203103501.41738-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203103501.41738-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707041307;
 bh=eVnBsVzPJD9FEv5kxkQ7Bku5GcWnIPqwXK6kdWTnH84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m2RewliUpquhUorKt37u4ZqbJ7UbROblIFxxKHGON83VMxmdQKfATI/wGlAD2uiY1
 s+EeL4nYnYYpjOJH6VqmkEToWitVLXCoucVJEke5B4hCU0PecbGU9DwmTWxinB8wzv
 FZBE857nF/YBZMWEPGc9lKmOzkPQJ6Me5jvSkGxah7xLzuy7J5dJLRSWfDq3X+fy97
 998YvxUl/UZmXwKyUo6FR8cs17pkyCD1NhxqPFspnoPkHM78jHepD2cyQPlpsZCMOV
 oCqu3MJscS1gspGwk1Guute2In3zsmLG57ZTtxLGvmCMwuFrxu6vX1VXUBCKg32dZw
 Jeesqpb5gGZ3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m2RewliU
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc-hawkbit-updater: drop
 RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR
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
Cc: Colin Foster <colin.foster@in-advantage.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-03 11:35 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:pengutronix:rauc-hawkbit-updater added by commit
> 928b7219cd7079864eadadc66dbff21c5cd72804 has never been a valid CPE ID
> for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:pengutronix:rauc-hawkbit-updater
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
> index 10ba91abbb..a453f75a28 100644
> --- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
> +++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
> @@ -9,7 +9,6 @@ RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/release
>  RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
>  RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
>  RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
> -RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR = pengutronix
>  RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib libcurl
>  
>  $(eval $(meson-package))
> -- 
> 2.43.0
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
