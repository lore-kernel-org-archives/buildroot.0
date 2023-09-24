Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509B6CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0110641833;
	Sun, 24 Sep 2023 10:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0110641833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxPTmsy-edPP; Sun, 24 Sep 2023 10:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B936E418E3;
	Sun, 24 Sep 2023 10:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B936E418E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 470DD1BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FB524152A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB524152A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eD1lET8bg7vY for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:34:15 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15E7941529
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15E7941529
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4AB0F78034D;
 Sun, 24 Sep 2023 12:34:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 12:34:10 +0200
Date: Sun, 24 Sep 2023 12:34:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230924103410.GI1469982@scaer>
References: <20230923203359.16430-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923203359.16430-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695551653;
 bh=KCeCP4wSCO246tIs5aKTZ65P/ST5Or7neBbzwhCp3Mo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0DxtiGJQjzkMLAekzw1uE9NF0/62wdAjC8Vk7DGBRCtGaKUZTz+kT3JyFx6FxouR
 +Jn7q6CEoeMTOeBFCdet39LzRCy/7n3rFGI2q2cDeyhB1zYfSjWmjk8mQa+xkh3Dus
 tzEiLm1vSMEGA1eMHydYhRp/o6UOIFjDlTUhqYQvcD4DH7UhiSddzZW6biaDgJZiP6
 L7DDtPDkRCqIoiroptOzgTr/1wi5+Qpx8sjvFsi+z0TBJ3lMunFwk3kMveMeVkTVbJ
 G221QLq/yhk0/XxlpQ35QSLrpwkiTvzENqphOsKlRV7sUpoVmF+AwapHEvgqOJldCD
 csZFA3RF9qOZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U0DxtiGJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libostree: needs headers >= 5.4
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-23 22:33 +0200, Fabrice Fontaine spake thusly:
> linux/fsverity.h is only available since kernel 5.4 and
> https://github.com/torvalds/linux/commit/085771ec14b9bdb843fe9283d4703ced395d1b0b
> resulting in the following build failure since bump to version 2023.5 in
> commit c64a3e9767757f6bab0ecf2df35871508003f39e and
> https://github.com/containers/composefs/commit/d3b4b1a2599e74757a3ada47a88645b363067a0a:
> 
> composefs/libcomposefs/lcfs-writer-erofs.c:37:10: fatal error: linux/fsverity.h: No such file or directory
>    37 | #include <linux/fsverity.h>
>       |          ^~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/045987a09cf9061dae80db6ada1f912b2867db26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libostree/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libostree/Config.in b/package/libostree/Config.in
> index 696e8e1d6c..9c59413eb1 100644
> --- a/package/libostree/Config.in
> +++ b/package/libostree/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBOSTREE
>  	depends on BR2_USE_MMU # e2fsprogs, libglib2, libgpgme
>  	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 # linux/fsverity.h
>  	select BR2_PACKAGE_E2FSPROGS
>  	select BR2_PACKAGE_LIBARCHIVE if BR2_s390x
>  	select BR2_PACKAGE_LIBGLIB2
> @@ -18,8 +19,9 @@ config BR2_PACKAGE_LIBOSTREE
>  
>  	  https://ostree.readthedocs.io/en/latest/
>  
> -comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar"
> +comment "libostree needs a uClibc or glibc toolchain w/ threads, dynamic library, wchar, headers >= 5.4"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> -		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL
> +		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
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
