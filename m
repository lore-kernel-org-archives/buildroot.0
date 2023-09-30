Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C70E7737C
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEE95415C6;
	Sat, 30 Sep 2023 17:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEE95415C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dM2lK4mGL9Z; Sat, 30 Sep 2023 17:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE1A9415B5;
	Sat, 30 Sep 2023 17:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE1A9415B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF7AC1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5AC642223
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5AC642223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTDxr3_gOczP for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:19:35 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3027A4222B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3027A4222B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6A053B00571;
 Sat, 30 Sep 2023 19:19:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 19:19:28 +0200
Date: Sat, 30 Sep 2023 19:19:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230930171928.GE2579@scaer>
References: <20230929161208.1106775-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230929161208.1106775-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696094372;
 bh=Pnc121s3G7qJuozHtERp1IvX27bu5QGoWreMZfP/Kuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hTlZIvKTpFiL9hgofXP3lwiU8yjJgTa1elc+a0SocQkfRvombs7QYD3peEkgxis3z
 ACDH74eqhtT0JI0qJSsGifNJKDcxPE2L6yVnDziTA320td4Ja/juIZ/c3yiFgZRYoz
 NGX1lvOAm4/b9+hQdd5s61NCKxS+Vchhvt9hFRB0tKSl2mCPggOaqsxHLqdNAiupJu
 auIsg+HksnjBQHPcANgQyPaGJENKZW1bNV+sCpgoSNafMWuZF8HQH4QF7Wu19yAfJv
 S8LbhsYLytAZhvsKjkyYQdFvmxsLarswmgxgr1oYcE/13JEfRh7sy3sXOv7c48MRan
 bfDRtsRUfJJZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hTlZIvKT
Subject: Re: [Buildroot] [PATCH 1/2] package/powertop: picutils is optional,
 not mandatory
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-29 18:12 +0200, Fabrice Fontaine spake thusly:
> pciutils is optional, not mandatory since version 2.1 and the addition
> of the package in commit 0adc0e24eed72efca0097c7567319f07b8af6d94 and
> https://github.com/fenrus75/powertop/commit/98ca605e7cf856795facc4a3a4f9c5b9baf1cab1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after slightly reorganinsing the _DEPENDENCIES,
thanks.

Regards,
Yann E. MORIN.

> ---
>  package/powertop/Config.in   | 1 -
>  package/powertop/powertop.mk | 3 ++-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/powertop/Config.in b/package/powertop/Config.in
> index 0f323a7bfb..fd88a3d0eb 100644
> --- a/package/powertop/Config.in
> +++ b/package/powertop/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_POWERTOP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
>  	depends on BR2_USE_WCHAR
>  	select BR2_PACKAGE_NCURSES
> -	select BR2_PACKAGE_PCIUTILS
>  	select BR2_PACKAGE_LIBNL
>  	help
>  	  A tool to diagnose issues with power consumption and power
> diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
> index c3e8d2549c..681f5fda46 100644
> --- a/package/powertop/powertop.mk
> +++ b/package/powertop/powertop.mk
> @@ -6,7 +6,8 @@
>  
>  POWERTOP_VERSION = 2.13
>  POWERTOP_SITE = https://01.org/sites/default/files/downloads
> -POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
> +POWERTOP_DEPENDENCIES = ncurses libnl host-pkgconf \
> +	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  POWERTOP_LICENSE = GPL-2.0
>  POWERTOP_LICENSE_FILES = COPYING
> -- 
> 2.40.1
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
