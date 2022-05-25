Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC725C433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 06:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C851612AE;
	Wed, 25 May 2022 06:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R25-3Eq6OXdl; Wed, 25 May 2022 06:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B0FF61269;
	Wed, 25 May 2022 06:50:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2BF71BF319
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EDEF61269
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vn88vc9RZQpX for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 06:50:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3097060E8F
 for <buildroot@buildroot.org>; Wed, 25 May 2022 06:50:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6823:fe26:3f6d:8e17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EC1CC5FFA7;
 Wed, 25 May 2022 08:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653461425;
 bh=HH2jJoE+TV9pCtDDDsZU1yqYv9RIuygC+dWPSQ0a4yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rDYCHVejuEy5xhObQJBawEj4w89Xm5LX1Ghth+NLTO2orXnFAdah7bAZUAH1GKCCL
 ej7lprnCYi9K12gglAn3B/WS/kLuKpi0KNbdOnKvQpErZO0SiBLtuSO1u5cGqyKEzC
 UPiAaFjv1Ugv7Mr326RWuVJib+/QckGpuHb+HVZXe7748gpXqCE22RiO9gjhd54qff
 PYcWw8LjOrQ3dUm+nfe5NG1UK5vo5Ht6dNPyqagoaSN4HvWyma+Kd/n79P/Bgc/4vj
 tDGX8n7Vr5QtXfC4ktUAiSO9V453fwrBYAMM7L3nop//WiUHRF77fpfpp8HiWh7SRd
 bZD7UvYrjaaaA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 May 2022 08:50:22 +0200
Date: Wed, 25 May 2022 08:50:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220525065022.GC2500@scaer>
References: <20220519045549.2320246-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519045549.2320246-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gcr: don't require gnupg2
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

James, All,

On 2022-05-18 22:55 -0600, James Hilliard spake thusly:
> Requiring BR2_PACKAGE_GNUPG2 introduced a recursive dependency,
> since it appears gcr also supports gnupg we don't need to depend
> on !BR2_PACKAGE_GNUPG and can use gnupg if needed.
> 
> Fixes:
> package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
> package/gstreamer1/gstreamer1/Config.in:5:	symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
> package/webkitgtk/Config.in:90:	symbol BR2_PACKAGE_WEBKITGTK_MULTIMEDIA depends on BR2_PACKAGE_WEBKITGTK
> package/webkitgtk/Config.in:24:	symbol BR2_PACKAGE_WEBKITGTK is selected by BR2_PACKAGE_MIDORI
> package/midori/Config.in:24:	symbol BR2_PACKAGE_MIDORI depends on BR2_PACKAGE_GNUPG
> package/gnupg/Config.in:1:	symbol BR2_PACKAGE_GNUPG is selected by BR2_PACKAGE_PYTHON_GNUPG
> package/python-gnupg/Config.in:1:	symbol BR2_PACKAGE_PYTHON_GNUPG depends on BR2_PACKAGE_PYTHON3
> package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
> package/jack2/Config.in:35:	symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
> package/jack2/Config.in:1:	symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
> package/fluidsynth/Config.in:38:	symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
> package/fluidsynth/Config.in:1:	symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
> package/gstreamer1/gst1-plugins-bad/Config.in:438:	symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gcr/Config.in    | 14 ++------------
>  package/gcr/gcr.mk       | 10 +++++++---
>  package/midori/Config.in |  6 ------
>  3 files changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/package/gcr/Config.in b/package/gcr/Config.in
> index afbec1a317..7c5fdba008 100644
> --- a/package/gcr/Config.in
> +++ b/package/gcr/Config.in
> @@ -1,12 +1,11 @@
>  config BR2_PACKAGE_GCR
>  	bool "gcr"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gnupg2
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_USE_MMU # libglib2
>  	depends on !BR2_STATIC_LIBS # p11-kit
> -	depends on !BR2_PACKAGE_GNUPG # gnupg2
> -	select BR2_PACKAGE_GNUPG2 # runtime
> +	select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG # runtime
> +	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
>  	select BR2_PACKAGE_LIBGCRYPT
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_P11_KIT
> @@ -16,15 +15,6 @@ config BR2_PACKAGE_GCR
>  	  https://developer.gnome.org/gcr/
>  
>  comment "gcr needs a toolchain w/ wchar, threads, dynamic library"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		BR2_STATIC_LIBS
> -
> -comment "gcr is incompatible with gnupg, gnupg2 only"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
> -	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_USE_MMU
> -	depends on !BR2_STATIC_LIBS
> -	depends on BR2_PACKAGE_GNUPG # gnupg2
> diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
> index ef253b4ef9..d479de82d3 100644
> --- a/package/gcr/gcr.mk
> +++ b/package/gcr/gcr.mk
> @@ -15,14 +15,18 @@ GCR_DEPENDENCIES = \
>  	p11-kit \
>  	$(TARGET_NLS_DEPENDENCIES)
>  GCR_INSTALL_STAGING = YES
> -GCR_CONF_OPTS = \
> -	-Dgpg_path=/usr/bin/gpg2 \
> -	-Dgtk_doc=false
> +GCR_CONF_OPTS = -Dgtk_doc=false
>  # Even though COPYING is v2 the code states v2.1+
>  GCR_LICENSE = LGPL-2.1+
>  GCR_LICENSE_FILES = COPYING
>  GCR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>  
> +ifeq ($(BR2_PACKAGE_GNUPG2),y)
> +GCR_CONF_OPTS += -Dgpg_path=/usr/bin/gpg2
> +else
> +GCR_CONF_OPTS += -Dgpg_path=/usr/bin/gpg
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  GCR_DEPENDENCIES += gobject-introspection host-libxslt host-vala
>  GCR_CONF_OPTS += -Dintrospection=true
> diff --git a/package/midori/Config.in b/package/midori/Config.in
> index 308b0a7a42..f45444a289 100644
> --- a/package/midori/Config.in
> +++ b/package/midori/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # webkitgtk -> icu
>  
> @@ -21,15 +20,10 @@ comment "midori needs libgtk3 w/ X11 or wayland backend"
>  	depends on !BR2_PACKAGE_LIBGTK3_X11 && \
>  		!BR2_PACKAGE_LIBGTK3_WAYLAND
>  
> -comment "midori is incompatible with gnupg, gnupg2 only"
> -	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
> -	depends on BR2_PACKAGE_GNUPG
> -
>  config BR2_PACKAGE_MIDORI
>  	bool "midori"
>  	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
>  	depends on !BR2_STATIC_LIBS # webkitgtk
> -	depends on !BR2_PACKAGE_GNUPG # gcr
>  	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
>  	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
> -- 
> 2.25.1
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
