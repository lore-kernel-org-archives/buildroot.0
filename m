Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1829AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE74848FC;
	Sat, 28 May 2022 19:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jfbeQJ6_c5Kx; Sat, 28 May 2022 19:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A06218480C;
	Sat, 28 May 2022 19:01:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D856F1BF385
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D49B440111
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCGrWoPFPO4T for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:01:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA38840B4D
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:01:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6832519F58A;
 Sat, 28 May 2022 21:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653764458;
 bh=PvoeMmsAFNNPZXQ0R13kplI128zIEytX89paJRuMe0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5L02ugu4WXXSJjFy/Sk0aKzrDruBj/vslRofzVjLILGPiJTTSZrIfpwk9qiDTev9
 ibHSlqYbP87cLqVEBm2X0kUgw8k/R/jF8r337X3hk6z1LrR8x0D/jy7WYaRsXM3s2o
 hco6BXeHl/7ht6VMRYVRKUN2bx8+SPip53B1AkO3x9jUkbKCvmXBaCUn2VW7X0Nkkr
 nUEPu/I9hTO83ht3nQHnFtWvITkUe2FtZhzj/iYlxaife9vq/Rpgt0XJWNmEAWGYDi
 3YTAqb/Q9rlooQdnQKGDC+sOtkRC42d8H4zkk6dYZvni7TeLR4xuGRM3rmF0EhlU1x
 llCm9Pjg+5SKA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 21:00:53 +0200
Date: Sat, 28 May 2022 21:00:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220528190053.GA853048@scaer>
References: <20220527204250.1748549-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527204250.1748549-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pcsc-lite: needs gcc >= 4.9
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
Cc: Simon Dawson <spdawson@gmail.com>, Juha Rantanen <juha@codercoded.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-05-27 22:42 +0200, Fabrice Fontaine spake thusly:
> gcc >= 4.9 is needed since bump to version 1.9.6 in commit
> b02f13cd54912f3dffd0e0863378050104430d77 and
> https://github.com/LudovicRousseau/PCSC/commit/d56ed18dbebc4423506ce7f61d3e3bcf4bdc4cb0:
> 
> In file included from winscard_clnt.c:123:0:
> readerfactory.h:101:3: error: unknown type name '_Atomic'
>    _Atomic DWORD dwEventStatus; /**< Recent event that must be sent */
>    ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/189f030a2252f17abf8b819feec0003815c66e79
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> index ead61e4529..3686f570a9 100644
> --- a/package/libnfc/Config.in
> +++ b/package/libnfc/Config.in
> @@ -13,13 +13,15 @@ config BR2_PACKAGE_LIBNFC_ACR122_PCSC
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
>  	depends on BR2_USE_MMU # pcsc-lite
>  	depends on !BR2_STATIC_LIBS # pcsc-lite
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite

libnfc in turn is selected by libfreefare, libllcp, libpam-nfc, and
mfoc. This new gcc dependency must be propagated to those packages.

Fortunately, none of those packages have reverse dependencies that
select them, so it's a one-level-deep chain.

Can you respin, please?

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_PCSC_LITE
>  	help
>  	  support for acr112_pcsc driver
>  
> -comment "acr122_pcsc driver needs a toolchain w/ threads, dynamic library"
> +comment "acr122_pcsc driver needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  config BR2_PACKAGE_LIBNFC_ACR122_USB
>  	bool "acr122_usb driver"
> diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
> index 1b4d0f7d18..f4ed5ba2f0 100644
> --- a/package/pcsc-lite/Config.in
> +++ b/package/pcsc-lite/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_PCSC_LITE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Atomic keyword
>  	help
>  	  Middleware to access smart card using SCard API (PC/SC).
>  
> @@ -33,6 +34,7 @@ config BR2_PACKAGE_PCSC_LITE_EMBEDDED
>  
>  endif
>  
> -comment "pcsc-lite needs a toolchain w/ threads, dynamic library"
> +comment "pcsc-lite needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 430625a102..919ce1f5bc 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -108,9 +108,13 @@ config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
>  config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
>  	bool "Enable EAP-SIM smart card backend"
>  	depends on !BR2_STATIC_LIBS # pcsc-lite
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
>  	select BR2_PACKAGE_PCSC_LITE
>  	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
>  
> +comment "EAP-SIM smart backend needs a toolchain w/ dynamic library, gcc >= 4.9"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
>  config BR2_PACKAGE_STRONGSWAN_EAP_AKA
>  	bool "Enable EAP-AKA"
>  	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
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
