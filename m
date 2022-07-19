Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC19C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 20:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F347660B1D;
	Tue, 19 Jul 2022 20:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F347660B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePNgIX0FUogX; Tue, 19 Jul 2022 20:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0392660AF7;
	Tue, 19 Jul 2022 20:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0392660AF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA6D21BF267
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 20:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3E8A40CE3
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 20:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3E8A40CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4QQ51o5u0-T for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 20:47:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0679340CE2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0679340CE2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 20:47:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7136:88c4:7807:8cd3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0DFF26012A;
 Tue, 19 Jul 2022 22:47:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Jul 2022 22:47:17 +0200
Date: Tue, 19 Jul 2022 22:47:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220719204717.GO2249625@scaer>
References: <20220719190051.555180-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719190051.555180-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658263640;
 bh=tuhcB5OGJD21twWViK+2BWbuMObGsuFKKv7NRWpzkow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezRRnbZCE4S1v75FJUsObnJ/98T4u5xy+cxLDD/j/Hr13BlldtXBF2kvEHNUPX0rJ
 UDnkD9k1CbJl9eJah9ZLfYWMNlrCwKcDNFXObKi1tXwcGJXC2YmkUOCDFx76c77Iig
 0W92MzPK8+JM/H37OX6O/XO101iHBAr7d5Bo8ZDUHFAyowqhR5bTBdPJf+4cBQQc1R
 GoszHXOs70ykyiMwOfIfyGYE0OwTi5cjMMHpMclZhJxVQDPh66bsXUD6+e+q4jLxEm
 H9HzfFdCyqeyrp0dvg2ShdVudoN4+TuHEq9kDMfFNJSWSICYbNTNpBWLtge0Gacp/S
 UsKFe/riOf21Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ezRRnbZC
Subject: Re: [Buildroot] [PATCH 1/3] boot/uboot: add
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX option
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

Heiko, All,

On 2022-07-19 21:00 +0200, Heiko Thiery spake thusly:
> Since U-Boot 2022.04 a host dependency to util-linux (-luuid) is required if
> the U-Boot board configuration has CONFIG_TOOLS_MKEFICAPSULE enabled. So
> introduce a new BR U-Boot config option
> BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX to solve this problem.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  boot/uboot/Config.in | 8 ++++++++
>  boot/uboot/uboot.mk  | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 91d98c7e63..340b2d17ff 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -190,6 +190,14 @@ config BR2_TARGET_UBOOT_NEEDS_GNUTLS
>  	  typically the case when the board configuration has
>  	  CONFIG_TOOLS_MKEFICAPSULE enabled.
>  
> +config BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX
> +	bool "U-Boot needs util-linux"
> +	help
> +	  Select this option if your U-Boot board configuration
> +	  requires util-linux (-luuid) to be available on the host. This is
> +	  typically the case when the board configuration has
> +	  CONFIG_TOOLS_MKEFICAPSULE enabled.

    $ make check-package
    boot/uboot/Config.in:197: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Fixed, and applied to master, as well as the two following patches.
Thanks.

Regards,
Yann E. MORIN.

>  config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
>  	bool "U-Boot needs ATF BL31"
>  	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 5808e30818..70d4d585f7 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -231,6 +231,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_GNUTLS),y)
>  UBOOT_DEPENDENCIES += host-gnutls
>  endif
>  
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX),y)
> +UBOOT_DEPENDENCIES += host-util-linux
> +endif
> +
>  # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
>  # legal-info finds it
>  define UBOOT_COPY_OLD_LICENSE_FILE
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
