Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95A7E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 20:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DCD442122;
	Thu, 21 Sep 2023 20:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DCD442122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ClA7F0ELRnk1; Thu, 21 Sep 2023 20:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3927E42124;
	Thu, 21 Sep 2023 20:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3927E42124
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0460A1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF5F9613D7
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF5F9613D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHVx6UZoHiSl for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 20:45:14 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 582E160AFD
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 20:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 582E160AFD
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e186:59f:97d4:33d1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9010F19F5BE;
 Thu, 21 Sep 2023 22:45:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Sep 2023 22:45:03 +0200
Date: Thu, 21 Sep 2023 22:45:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230921204503.GM512384@scaer>
References: <20230921193111.1136943-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921193111.1136943-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695329111;
 bh=VvWH8VHD0WTB016y8pO73o7ZNMuCyaM4sl6pFMDRxW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WSn9/YvL4PYu+JBVr8M+EUUMN4y0hVashNLerjsssPqd4rslevXfdV8b6dzW6av5W
 NGlZRpqNtzezI/2/4SGL950qiJRkP48bEE0QuFs/MTkP/eitx6AxMbZ/Go+40JUNkl
 jPAlcD7ncFr87RyA9GtX81+c6GgYh7ZLYzQd4A7qPg1Z1NsKOzxP1TIzwJPz/pgDSi
 kvxojnnu3n2Ib1odJQ3SxG62p6ErAqetXzG7hWAPK5ZkLB5iSVia9l0xIIbnn7Ybu7
 QHIgF0ks8oW1EFChWj+ww5oh3OULbex3dqcS+nNZ8xu2hVO2QmDymk4B0F0ElKIVMf
 XOmQ7lcGJuldQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WSn9/YvL
Subject: Re: [Buildroot] [PATCH v3] package/apache: add option
 BR2_PACKAGE_APACHE_DAEMON
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
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 buildroot@buildroot.org, Jim Reinhart <jimr@tekvox.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

TBH, I am not too fond of this two-in-one package... :-(
However, it is not that ugly, so let's give it a look. See below...

On 2023-09-21 21:31 +0200, Giulio Benetti spake thusly:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> With option BR2_PACKAGE_APACHE_DAEMON disabled only htdigest and htpasswd
> are built and installed. By default BR2_PACKAGE_APACHE_DAEMON is enabled
> and entire apache daemon is built. This is useful for Mongoose credentials
> handling.
> 
> Cc: Jim Reinhart <jimr@tekvox.com>
> Cc: James Autry <jautry@tekvox.com>
> Cc: Matthew Maron <matthewm@tekvox.com>
> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> ---
> V1->V2:
> * Hide "External Apache modules" if BR2_PACKAGE_APACHE_UTILS_ONLY is enabled
> V2->V3:
> as suggested by Arnout:
> * change negative option BR2_PACKAGE_APACHE_UTILS_ONLY to BR2_PACKAGE_APACHE_DAEMON
> * set a common APACHE_CONF_OPTS and only add specific options for
>   BR2_PACKAGE_APACHE_DAEMON enabled or not
> diff --git a/package/Config.in b/package/Config.in
> index e8dbadadf3..aa5e9b5a98 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2278,7 +2278,7 @@  menu "Networking applications"
>  	source "package/alfred/Config.in"
>  	source "package/aoetools/Config.in"
>  	source "package/apache/Config.in"
> -if BR2_PACKAGE_APACHE
> +if BR2_PACKAGE_APACHE_DAEMON
>  menu "External Apache modules"
>  	source "package/modsecurity2/Config.in"

package/modsecurity2/Config.in also has a redundant dependency on
BR2_PACKAGE_APACHE, which is now even less relevant.

>  endmenu
 
> diff --git a/package/apache/Config.in b/package/apache/Config.in
> index 270296bce4..5e9e4c5f9d 100644
> --- a/package/apache/Config.in
> +++ b/package/apache/Config.in
> @@ -17,6 +17,14 @@ config BR2_PACKAGE_APACHE
>  
>  if BR2_PACKAGE_APACHE
>  
> +config BR2_PACKAGE_APACHE_DAEMON

This new config... [0]

[--SNIP--]
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 320a6ad20e..83df3854a3 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
[--SNIP--]
> @@ -32,10 +30,16 @@ APACHE_MPM = worker
>  endif
>  
>  APACHE_CONF_OPTS = \
> -	--sysconfdir=/etc/apache2 \
>  	--with-apr=$(STAGING_DIR)/usr \
>  	--with-apr-util=$(STAGING_DIR)/usr \
>  	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
> +
> +ifeq ($(BR2_PACKAGE_APACHE_DAEMON),y)
> +# Needed for mod_php
> +APACHE_INSTALL_STAGING = YES

[0] ... means that BR2_PACKAGE_PHP_SAPI_APACHE will have to be made
dependent on it rather than on plain BR2_PACKAGE_APACHE.

Beside modsecurity2 and php, there are no other package that refer to
apache;

    $ git grep -E '(select|depends on) BR2_PACKAGE_APACHE'
    package/modsecurity2/Config.in: depends on BR2_PACKAGE_APACHE
    package/php/Config.in:  depends on BR2_PACKAGE_APACHE

> +APACHE_CONF_OPTS += \
> +	--sysconfdir=/etc/apache2 \
>  	--enable-http \
>  	--enable-dbd \
>  	--enable-proxy \
> @@ -121,5 +125,19 @@ define APACHE_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/apache/apache.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
>  endef
> +else
> +APACHE_CONF_OPTS += \
> +	--with-static-htdigest \
> +	--with-static-htpasswd

Why don't you --disable-http --disable-dbd and so on?

> +define APACHE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd

If it is possible to properly disable everything else, then we would
not need custom commands, neither for build...

> +endef
> +
> +define APACHE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
> +	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
> +endef

... nor for install.

And thus this would look less than two-packages-in-one, and more like
how we handle libcurl, so that would be even better.

Regards,
Yann E. MORIN.

> +endif
>  
>  $(eval $(autotools-package))
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
