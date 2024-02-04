Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706CDC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 16:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6B7B821CB;
	Sun,  4 Feb 2024 16:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6B7B821CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfx2eMKEKn7C; Sun,  4 Feb 2024 16:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7952821BE;
	Sun,  4 Feb 2024 16:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7952821BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2C6D1BF41B
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 16:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B2DD400E4
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 16:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B2DD400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rnOiPWB7IWk for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 16:09:55 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3278400C4
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 16:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3278400C4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 52767B00539;
 Sun,  4 Feb 2024 17:09:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 17:09:48 +0100
Date: Sun, 4 Feb 2024 17:09:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Ott <stefan@ott.net>
Message-ID: <Zb-2zGHgEAZJkkiF@landeda>
References: <20240203030138.1934339-1-stefan@ott.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203030138.1934339-1-stefan@ott.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707062992;
 bh=XpomxmbqOU4QgYnmyx2U/8/NTNCy7PPfZR+qTC9yxrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TrZQcIjclZuH1rXbpEeN2P3gSnaI+oykLmjqPWQ6dpieDwiQpLo/YfSAPqialsCdM
 b8izrPJWywebPmKJnkMPN8PZkndjD2cPjxW1JbHVNZ+Tyt1Ow4+Ndb72wsH9h3nfR7
 J17PHY8PsNdVlJl/d4MtFrj169tQKKqrKGGB6SVpmemCnfNJcz0Bvi2840hOPCvwmg
 lwOJ4RpWLFmObyRpAsk2sEepKEDzVKlYPmMdQv9wX+/UWsacEteKLdxF+jq3vYtSQf
 ZXxwA4yBRcnB0TA2JCzBgUHmZKxgiI5zxbHYpbk8xOzaXyTO/zlO4dpXSpRfKJNVsf
 V2zbeeXMmU/Mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TrZQcIjc
Subject: Re: [Buildroot] [PATCH v4] package/sway: make systemd optional
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2024-02-03 04:01 +0100, Stefan Ott via buildroot spake thusly:
> Sway works perfectly fine without it.

Thanks for this new iteration. However, there are a few issues with it
yet.

First, your commit log is way too short to explain the changes:
  - why is it OK to drop the swaybar option altogether?
  - why is there no value set for -Dsd-bus-provider when systemd is not
    enabled?

You provided answers to the second, and you did the first because it was
suggested, but the explanations really belong to the commit log. Indeed,
when we look at the git tree in the future, we need to have that
information available right there, rather than buried and lost in a few
threads in the mailing list.

Also, even though it may make sense to always enable the waybar with
systemd, this is semantically a separate change, and should be done in a
separate commit (possibly coming before the one making systemd
optional). If that were not possible, then this should be dully
motivated in the commit log.

So, could you please rework this change, so that:

  - the first patch makes building waybar non-optional once systemd is
    enabled; note in the commit log that there is no need for legacy
    handling (I'll let you dig why! ;-))

  - the second patch removes the systemd dependency on sway oitself, and
    explains why the non-systemd case has no otpion set for
    -Dsd-bus-provider

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Stefan Ott <stefan@ott.net>
> 
> ---
> Changes v3 -> v4:
>   - Automatically enable tray support if systemd is enabled (suggested
>     by Raphael Pavlidis)
> Changes v2 -> v3:
>   - Make BR2_PACKAGE_SWAY_SWAYBAR_TRAY depend on systemd and set
>     sd-bus-provider=libsystemd if SWAY_SWAYBAR_TRAY is enabled
> Changes v1 -> v2:
>   - Automatically enable systemd integration for builds with systemd
>     support (suggested by Thomas Petazzoni)
> ---
>  package/sway/Config.in | 15 ++-------------
>  package/sway/sway.mk   | 10 +++++-----
>  2 files changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/package/sway/Config.in b/package/sway/Config.in
> index 4f6d9fb215..d2fcdc6d70 100644
> --- a/package/sway/Config.in
> +++ b/package/sway/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_SWAY
>  	bool "sway"
> -	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
>  	depends on !BR2_STATIC_LIBS # wlroots
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
>  	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
> @@ -38,15 +37,6 @@ config BR2_PACKAGE_SWAY_SWAYBAR
>  	help
>  	  Enable support for swaybar
>  
> -if BR2_PACKAGE_SWAY_SWAYBAR
> -
> -config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
> -	bool "swaybar tray"
> -	help
> -	  Enable support for swaybar tray
> -
> -endif # BR2_PACKAGE_SWAY_SWAYBAR
> -
>  config BR2_PACKAGE_SWAY_SWAYNAG
>  	bool "swaynag"
>  	help
> @@ -54,9 +44,8 @@ config BR2_PACKAGE_SWAY_SWAYNAG
>  
>  endif # BR2_PACKAGE_SWAY
>  
> -comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
> -	depends on !BR2_PACKAGE_SYSTEMD || \
> -		!BR2_PACKAGE_HAS_UDEV || \
> +comment "sway needs udev, EGL w/ Wayland backend and OpenGL ES support"
> +	depends on !BR2_PACKAGE_HAS_UDEV || \
>  		!BR2_PACKAGE_HAS_LIBEGL || \
>  		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
>  		!BR2_PACKAGE_HAS_LIBGLES
> diff --git a/package/sway/sway.mk b/package/sway/sway.mk
> index 0aad9de712..089b533baf 100644
> --- a/package/sway/sway.mk
> +++ b/package/sway/sway.mk
> @@ -8,13 +8,12 @@ SWAY_VERSION = 1.8.1
>  SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
>  SWAY_LICENSE = MIT
>  SWAY_LICENSE_FILES = LICENSE
> -SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
> +SWAY_DEPENDENCIES = host-pkgconf wlroots json-c pcre cairo pango
>  SWAY_CONF_OPTS = \
>  	-Dwerror=false \
>  	-Dzsh-completions=false \
>  	-Dfish-completions=false \
> -	-Dman-pages=disabled \
> -	-Dsd-bus-provider=libsystemd
> +	-Dman-pages=disabled
>  
>  ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
>  SWAY_CONF_OPTS += -Dxwayland=enabled
> @@ -53,8 +52,9 @@ else
>  SWAY_CONF_OPTS += -Dswaynag=false
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
> -SWAY_CONF_OPTS += -Dtray=enabled
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +SWAY_DEPENDENCIES += systemd
> +SWAY_CONF_OPTS += -Dtray=enabled -Dsd-bus-provider=libsystemd
>  else
>  SWAY_CONF_OPTS += -Dtray=disabled
>  endif
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
