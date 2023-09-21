Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCC8E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4763141DC8;
	Thu, 21 Sep 2023 20:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4763141DC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H88o9tJ7DyUf; Thu, 21 Sep 2023 20:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD9C42125;
	Thu, 21 Sep 2023 20:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD9C42125
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84FA61BF2B8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BC8A40A4B
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BC8A40A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elepaTu1dUMG for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 20:56:48 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4132F40253
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 20:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4132F40253
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e186:59f:97d4:33d1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D7B9C19F57B;
 Thu, 21 Sep 2023 22:56:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Sep 2023 22:56:37 +0200
Date: Thu, 21 Sep 2023 22:56:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230921205637.GN512384@scaer>
References: <20230921203237.1249291-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921203237.1249291-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695329805;
 bh=igXcxEJtM1xRWW+PrDOdZSZbkvS/x7LeE/M41KmuV+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EeAqloM2mb2xALVWXpLXBdBiQ5knS3jdHJ3MERWDxJihC1OJ/tCZFaiPfYnYPmSA8
 gghW/F8hWszmInd5/7nSC+Hp9o5sWgbZiphWLgONBZIUK9vSjOUoh7y/4nyY13O60k
 JWCfUW5780BWfzFBjM1ghHukYvItePJGqcjLoQMXktErxs0I2njwapV9NHHkJcYNB2
 Z/R3W0MVCIgL4pwEfE74Vfa+Isn8vXfbEPMXzvAD7Rdu49ldrQyYQfio2E68UzSS7n
 IfIW4Haz4bywD6PMFGtANGTbTO/H7KGNHggHlX8QXTRLuRGrmInl0b9gMIRnELVavh
 VnqhNR6nIY1vQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EeAqloM2
Subject: Re: [Buildroot] [PATCH v4] package/apache: add option
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

You sent your v4 while I was writing my review of v3, so you could not
have adressed my comments. Concurrency in computers is really hard, but
is even harder with humans! ;-)

This is however a good opportunity to add what I forgot...

On 2023-09-21 22:32 +0200, Giulio Benetti spake thusly:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> With option BR2_PACKAGE_APACHE_DAEMON disabled only htdigest and htpasswd
> are built and installed. By default BR2_PACKAGE_APACHE_DAEMON is enabled
> and entire apache daemon is built. This is useful for Mongoose credentials
> handling.

Your commit log must not describe the commit; it must explain it. Start
with the problem you have, and then explain how you fixed it. E.g.:

    package/apache: add option to disable server

    Other packages (e.g. mongoose) can use htdigest and htpasswd, but
    those are only available with apache.

    We don't want to build the whole apache server just for those tools,
    so we add an option to disable the server; it is enabled by default
    for legacy purposes (so that existing (def)configs still work).

(adapt the following:)

    However, there is not way to tell the apache buildsystem to only
    build those two tools, so we have to provide custom build and
    install commands; they are statically linked against the apache
    internal helper libs, so we have nothing to install besides those
    two executables.

About that last part: if --disable-http et al. really do the job, then
it is moot, of course: adapt it appropriately.

Regards,
Yann E. MORIN.

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
> V3->V4:
> * drop --with-static-* options as suggested by Arnout
> ---
>  package/Config.in        |  2 +-
>  package/apache/Config.in |  9 +++++++++
>  package/apache/apache.mk | 20 +++++++++++++++++---
>  3 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index cc99be39fb..cd7fe056b8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2279,7 +2279,7 @@ menu "Networking applications"
>  	source "package/alfred/Config.in"
>  	source "package/aoetools/Config.in"
>  	source "package/apache/Config.in"
> -if BR2_PACKAGE_APACHE
> +if BR2_PACKAGE_APACHE_DAEMON
>  menu "External Apache modules"
>  	source "package/modsecurity2/Config.in"
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
> +	bool "apache-daemon"
> +	default y
> +	help
> +	  Provide entire Apache daemon, otherwise only htdigest and htpasswd
> +	  will be built and installed.
> +
> +if BR2_PACKAGE_APACHE_DAEMON
>  choice
>  	prompt "Multi-Processing Module (MPM)"
>  	default BR2_PACKAGE_APACHE_MPM_WORKER
> @@ -40,6 +48,7 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
>  	  Implements a hybrid multi-threaded multi-process web server
>  
>  endchoice
> +endif
>  
>  endif
>  
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 320a6ad20e..994842b455 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -12,8 +12,6 @@ APACHE_LICENSE_FILES = LICENSE
>  APACHE_CPE_ID_VENDOR = apache
>  APACHE_CPE_ID_PRODUCT = http_server
>  APACHE_SELINUX_MODULES = apache
> -# Needed for mod_php
> -APACHE_INSTALL_STAGING = YES
>  # We have a patch touching configure.in and Makefile.in,
>  # so we need to autoreconf:
>  APACHE_AUTORECONF = YES
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
> +
> +APACHE_CONF_OPTS += \
> +	--sysconfdir=/etc/apache2 \
>  	--enable-http \
>  	--enable-dbd \
>  	--enable-proxy \
> @@ -121,5 +125,15 @@ define APACHE_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/apache/apache.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
>  endef
> +else
> +define APACHE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
> +endef
> +
> +define APACHE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
> +	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
> +endef
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
