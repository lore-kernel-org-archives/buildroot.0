Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44070C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 20:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB17419D9;
	Mon, 30 Jan 2023 20:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB17419D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLTcSI_jA2pb; Mon, 30 Jan 2023 20:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33996429F8;
	Mon, 30 Jan 2023 20:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33996429F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 771CB1BF291
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 20:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5187241057
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 20:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5187241057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBaI1fOwbELz for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 20:56:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228A140B9C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 228A140B9C
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 20:56:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 71BDE5FF67;
 Mon, 30 Jan 2023 21:56:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 Jan 2023 21:56:03 +0100
Date: Mon, 30 Jan 2023 21:56:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230130205603.GA3864@scaer>
References: <20230114161002.35480-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230114161002.35480-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675112166;
 bh=b0XP4dPSl+U8vFGupB4ygFwX87afgCrZkzTa+Mtnpwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LjTyb9wceZPzU8PFkeUaPqN15x+0yszt9eDEwwnCRe+C1LU2J3KUd92qw7pUDbzMk
 sh7EZj82GKSR3mrNdDJcMN5E3z+bZMdgdquOxMICdlrYfrPF1tNH5gXfrNzl5p+e0X
 mrAqADSTZjRyOR6Y+t6udseeRm4hgNVh9V4nO/qRwwBYTHYANBvPJQVJ6PMn6EncGd
 Wb82FDnBCZkk6YoNg272nWstaxZqmZ8xFZm+M0IEIKuF1LC4Z4EwUYnq4f1MqgHs0j
 LvFjwH/YpBGY8b7v63YyCfidAUy6byafpzmN05Wxh7IaBJeYkYcKcIZA81vMFCfmoS
 7a5HpCG1tNCQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LjTyb9wc
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.16
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-01-14 17:10 +0100, Fabrice Fontaine spake thusly:
> https://github.com/nhorman/rng-tools/releases/tag/v6.16
[--SNIP--]
> diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
> index be2ee13969..4c86791267 100644
> --- a/package/rng-tools/rng-tools.hash
> +++ b/package/rng-tools/rng-tools.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffbdad05f3a  rng-tools-6.15.tar.gz
> +sha256  17666c4745fb635d91df293be188daf94b9e465d51d8503c0195fa3beb390894  rng-tools-6.16.tar.gz

This hash does not match here, and we've had a report on IRC that it
does not work either. In both cases, we get this hash instead:
    8e518d45be68f42d0873732a9ac3ecfe0f10c4a9bd5d5f44180a49be8ebda96f

Can you check on your side, how you ended up with 17666...90894?

Regards,
Yann E. MORIN.

>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index f736193a23..3e565103e4 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -4,14 +4,14 @@
>  #
>  ################################################################################
>  
> -RNG_TOOLS_VERSION = 6.15
> +RNG_TOOLS_VERSION = 6.16
>  RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
>  RNG_TOOLS_LICENSE = GPL-2.0
>  RNG_TOOLS_LICENSE_FILES = COPYING
>  RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
>  RNG_TOOLS_SELINUX_MODULES = rngd
>  
> -RNG_TOOLS_DEPENDENCIES = host-pkgconf openssl
> +RNG_TOOLS_DEPENDENCIES = host-pkgconf libcap openssl
>  # From git
>  RNG_TOOLS_AUTORECONF = YES
>  
> @@ -45,6 +45,13 @@ else
>  RNG_TOOLS_CONF_OPTS += --without-nistbeacon
>  endif
>  
> +ifeq ($(BR2_PACKAGE_RNG_TOOLS_QRYPT),y)
> +RNG_TOOLS_DEPENDENCIES += jansson libcurl
> +RNG_TOOLS_CONF_OPTS += --with-qrypt
> +else
> +RNG_TOOLS_CONF_OPTS += --without-qrypt
> +endif
> +
>  define RNG_TOOLS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 755 package/rng-tools/S21rngd \
>  		$(TARGET_DIR)/etc/init.d/S21rngd
> -- 
> 2.39.0
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
