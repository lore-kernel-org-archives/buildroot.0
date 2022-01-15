Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B17C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBA84047D;
	Sat, 15 Jan 2022 09:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z582bYpMC9in; Sat, 15 Jan 2022 09:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF5B40890;
	Sat, 15 Jan 2022 09:23:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5331BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BB714010E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrDc-sv4lnkl for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:23:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15A8B40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:23:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3AA5F19F593;
 Sat, 15 Jan 2022 10:23:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642238596;
 bh=sXxcaEg5afTEKUvTKEBa9ECiJb40AMRcp4dd/lApaw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYAShMhGywgbgT5RqyTkdDa/F22pmggO6zS9tvV9FXhWXfogEsvraEFJRN/Rp9Ulf
 IIuXszm+hhZ77YvPh8u4wMRfGz8U9pS0nL/u7UtGP/q6w3Pxob5yXe0ySYjsaJiLnV
 zfaCbirqbNB4DotDE+mB3GTUFMJR6eEKTwLZNckuFp4yyoyz6KWxWsTCiwTjo4AnV/
 t17HBUE1poQLtMbEkj/FYZ5Fxp6bO+CGo1AK9f/eOZ5vnxZxhY09KoKAWEYiBJKphU
 +mTe+fK3SlatHnAzj2SsvvXjbHI1f3sz4R6UmhZn7iQmJcfa5jUAGYPK/lB3s83CW1
 NHhfr1gPpvVbw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 10:23:12 +0100
Date: Sat, 15 Jan 2022 10:23:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115092312.GE1945846@scaer>
References: <20220114180242.963756-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114180242.963756-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/targetcli-fb: add
 TARGETCLI_FB_CPE_ID_VENDOR
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-14 19:02 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:targetcli-fb_project:targetcli-fb is a valid CPE identifier
> for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atargetcli-fb_project%3Atargetcli-fb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/targetcli-fb/targetcli-fb.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
> index 75643446d2..7425423b8f 100644
> --- a/package/targetcli-fb/targetcli-fb.mk
> +++ b/package/targetcli-fb/targetcli-fb.mk
> @@ -10,6 +10,7 @@ TARGETCLI_FB_VERSION = 2.1.fb41
>  TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
>  TARGETCLI_FB_LICENSE = Apache-2.0
>  TARGETCLI_FB_LICENSE_FILES = COPYING
> +TARGETCLI_FB_CPE_ID_VENDOR = targetcli-fb_project
>  TARGETCLI_FB_SETUP_TYPE = setuptools
>  TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
>  
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
