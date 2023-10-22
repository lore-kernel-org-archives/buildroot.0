Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002E3C001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 18:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93E1A416C3;
	Sun, 22 Oct 2023 18:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93E1A416C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vLLeh2aZqEW; Sun, 22 Oct 2023 18:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E75416AC;
	Sun, 22 Oct 2023 18:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7E75416AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51C091BF41F
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34EC840135
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34EC840135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZM6hIm0U0Wf for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 18:47:46 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED6DC40012
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 18:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED6DC40012
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:9668:e224:b510:3431])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 19723B0037C;
 Sun, 22 Oct 2023 20:47:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 20:47:39 +0200
Date: Sun, 22 Oct 2023 20:47:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20231022184739.GU2607@scaer>
References: <20231019203338.6450-1-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231019203338.6450-1-brandon.maier@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698000464;
 bh=plokR3g92d3x+VwBHViV2752RuokftAqFghSFpXmVIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+rP8RXS7Cfd8LuysDD8EJPbxhOrtEfUqD54c1lyfXk9z1NIkfnUo0qRTLk6mI6Sm
 Ii2Dw/otnx3XTWOTIonVYYrK4W/7iFPVbZcMgO1tyuwnNugibMVtjnsgQEXCb0MOwJ
 ZaH7uGuqt4vsEM18buMEv3zRV/GW+jGun2E28eNE/8ukkR3V/TL0Ky7ndzi2Jpl8m7
 SJE5dC67k5X478JTxJST8VRKpOj9UjRYKT5V7blWDMpo5fjFM6bys8Tb5trIwFIjz6
 fRO2rCBg2FX/OuFgSQXX0qg+npgD9r3TCxDJDIAEt0sRFJ3RxGPZtcBqTNMdj6TQLF
 lEAYvcglKs8zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M+rP8RXS
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless_tools: add option to
 build ifrename
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 "Neal J. Buchmeyer" <neal.buchmeyer@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon, Neal, All,

On 2023-10-19 20:33 +0000, Brandon Maier via buildroot spake thusly:
> From: "Neal J. Buchmeyer" <neal.buchmeyer@collins.com>
> 
> Add option to select ifrename tool which is part of the wireless_tools
> suite. Also add an option to disable iwconfig for targets that only want
> the library or ifrename.

Those are two semantically disjoint changes, so they should be two
patches, preferably in this order:
 1. one to allow only building the library (and make iwconfig optional)
 2. one to add ifrename

Plus, see below...

> Signed-off-by: Neal J. Buchmeyer <neal.buchmeyer@collins.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  package/wireless_tools/Config.in         | 12 ++++++++++++
>  package/wireless_tools/wireless_tools.mk | 22 ++++++++++++++++------
>  2 files changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
> index 349908dbde..ad1c2e8e82 100644
> --- a/package/wireless_tools/Config.in
> +++ b/package/wireless_tools/Config.in
> @@ -7,6 +7,18 @@ config BR2_PACKAGE_WIRELESS_TOOLS
>  
>  if BR2_PACKAGE_WIRELESS_TOOLS
>  
> +config BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME
> +	bool "Add ifrename"
> +	help
> +	  Build and install the ifrename tool
> +
> +config BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG
> +	bool "Add iwconfig"
> +	default y
> +	help
> +	  Build and install the iwconfig, iwlist, iwspy, iwpriv, and
> +	  iwgetid tools.
> +
>  config BR2_PACKAGE_WIRELESS_TOOLS_LIB
>  	bool "Install shared library"
>  	depends on !BR2_STATIC_LIBS
> diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
> index 1d29c3b102..210d8aa51a 100644
> --- a/package/wireless_tools/wireless_tools.mk
> +++ b/package/wireless_tools/wireless_tools.mk
> @@ -14,8 +14,14 @@ WIRELESS_TOOLS_CPE_ID_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR)
>  WIRELESS_TOOLS_CPE_ID_UPDATE = pre9
>  WIRELESS_TOOLS_INSTALL_STAGING = YES
>  
> -WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
> -WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
> +ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME),y)
> +WIRELESS_TOOLS_BUILD_TARGETS += ifrename
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG),y)
> +WIRELESS_TOOLS_BUILD_TARGETS += iwmulticall
> +WIRELESS_TOOLS_INSTALL_TARGETS += install-iwmulticall
> +endif
>  
>  ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
>  WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
> @@ -30,13 +36,17 @@ endef
>  endif
>  
>  define WIRELESS_TOOLS_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> -		$(WIRELESS_TOOLS_BUILD_TARGETS)
> +	$(if $(WIRELESS_TOOLS_BUILD_TARGETS),
> +		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
> +		CFLAGS="$(TARGET_CFLAGS)" $(WIRELESS_TOOLS_BUILD_TARGETS))
>  endef

So, if none of ifrename, iwconfig, or the library is enabled, then there
is nothjing to build (or to install, below). In this case, it does not
make sense to enable the package altogether.

I think we must ensure that at least one of those are enabled, and
iwconfig looks like the obvious candidate. So (elided for the sake of
example):

    config BR2_PACKAGE_WIRELESS_TOOLS
        bool "wireless tools"
        select BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG if \
            !BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME && \
            !BR2_PACKAGE_WIRELESS_TOOLS_LIB

Of course, in the first patch, only BR2_PACKAGE_WIRELESS_TOOLS_LIB would
be needed in the condition, with BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME
added in patch 2.

Regards,
Yann E. MORIN.

>  define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true \
> -		$(WIRELESS_TOOLS_INSTALL_TARGETS)
> +	$(if $(WIRELESS_TOOLS_INSTALL_TARGETS),
> +		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" \
> +		LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS))
> +	$(if $(BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME),
> +		$(INSTALL) -D -m 755 $(@D)/ifrename $(TARGET_DIR)/sbin/ifrename)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.41.0
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
