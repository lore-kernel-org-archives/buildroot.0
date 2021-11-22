Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECBFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 23:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC7880D4F;
	Mon, 22 Nov 2021 23:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYAmkLalPMcF; Mon, 22 Nov 2021 23:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9B780D50;
	Mon, 22 Nov 2021 23:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC4D1BF3E9
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 197BA80D50
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oU6CsUKpo-7b for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 23:06:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19E6E80D4F
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 23:06:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id o20so39290897eds.10
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 15:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZldHBc6dFj5ubUACnpl9SMRKF/QGvC0Wv9P3uTQjLac=;
 b=P1Kb4ML/XWMM/IzOdZuJpLB61X3zHJvMoIb2JMHFl7q2KVvGjUKdwQVHYwBZb/e6LP
 H53OIl/W0on7C1asbc2L3uYFoAVT1XWXIOwvR13HnoylK65sMr7T2Nr2SMAjDf5NOJMS
 Ba/wRZaQx0ZlX9Ov5MS++vCzYyXteCykZjeUJ0aSLgBpm7BEMvMUiBLMiuTW6e1HuAHN
 sFT19dp4JbZkxwuWJIPvAEUO6fcNQWdRNBF7zPeJPRBpz6s7ry89CeoXMfwIXsmGsiFM
 ASUlgbs2dV56xFu+5w540Y36RaeeDQ8Sd0KbtFpRL42F++zPVNkIpeNgbA3Pz3qIBryb
 R3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZldHBc6dFj5ubUACnpl9SMRKF/QGvC0Wv9P3uTQjLac=;
 b=dGD2U2lOsrraYX150XG9ZCVK1iXNX6M2TaRxhjh9MI5ufi9nBjjygAU/KtnU/qAQkr
 DeyMZu95wbCx+7Y5uEj3tYF2iG8R1fjUYwmVNQDiI7yskKexxBv2ln59gGOGnUpDIUvz
 WptiefQ1QqQp36itGb0UTSjFwPb/Ye9gQhvrrT7Q0gIIt4hsz++q/GjOo8GZGd4XMXva
 21uR1UiiO20RuTCKZSnmtIupIEPYhVIRG8JTKgm8MA6tUvx2bFI70JCjnHRNGzZUPOpf
 IMh0mOr9Oy9QcbkcJKLAeJXSf/bbggi9t5Khpzvu/63Uwc6XWwP8f/sjh6rF7V/Ibp4h
 D/rQ==
X-Gm-Message-State: AOAM531PG/KVoyjA460fOAcrRXnN2tgf34kmu5V5ZWZTk1ZPLUZE8MIu
 lGZy1B4ESLF3iiNqd5i8uxpHGw==
X-Google-Smtp-Source: ABdhPJw0OcL7pazzRWEsb5W/HHSaPyFYZobSjTXUAXiybGlDSisrW3qxnvqPbxuC0RYlckztru0F1Q==
X-Received: by 2002:a05:6402:4394:: with SMTP id
 o20mr1315148edc.342.1637622377085; 
 Mon, 22 Nov 2021 15:06:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id el20sm4299033ejc.40.2021.11.22.15.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 15:06:16 -0800 (PST)
Message-ID: <cbd23dbb-78b1-e517-f26b-3b64fab1ecbc@mind.be>
Date: Tue, 23 Nov 2021 00:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211104003607.2022984-1-aduskett@gmail.com>
 <20211104003607.2022984-5-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211104003607.2022984-5-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH vRFC 4/4] package/midori: bump to version 9.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2021 01:36, Adam Duskett wrote:
> This is a substantial update as the last time the midori version was bumped
> was on Fri Apr 29 2016 commit 54bbd88b1f0c4de25688dae1d0c30d222722feb4.
> 
> Changes:
> 
> package/Config.in: Move midori out of the "X applications" submenu and into
> the "Graphic applications" submenu, as it is not dependent on X.
> 
> - Drop the two existing patches as they no longer apply.
> - 0001-disable-vala-fatal-warnings.patch: new patch. This patch fixes
>    errors when building midori in a buildroot source repository that is also
>    a git project.
> 
> - 0002-add-option-to-specify-path-to-g-ir-compiler.patchL new patch.
>    This patch introduces a new option that allows the make system to specify
>    a path to the g-ir-compiler, or else the host path's g-ir-compiler is used
>    which results in failed builds.
> 
> - Change the site to the github repository, as that is where the latest
>    releases are published.
> 
> - New dependencies: gobject-introspection, json-glib, libarchive, and libpeas.
> - gcr is no longer an optional dependency.
> - host-python3 is now a mandatory dependency.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/Config.in                             |  2 +-
>   .../0001-disable-vala-fatal-warnings.patch    | 30 ++++++++++++
>   package/midori/0001-fix-bug-1492932.patch     | 44 ------------------
>   ...ion-to-specify-path-to-g-ir-compiler.patch | 37 +++++++++++++++
>   package/midori/0002-gcr-for-x11-only.patch    | 32 -------------
>   package/midori/Config.in                      | 46 ++++++++++++++-----
>   package/midori/midori.hash                    |  4 +-
>   package/midori/midori.mk                      | 19 ++++----
>   8 files changed, 112 insertions(+), 102 deletions(-)
>   create mode 100644 package/midori/0001-disable-vala-fatal-warnings.patch
>   delete mode 100644 package/midori/0001-fix-bug-1492932.patch
>   create mode 100644 package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch
>   delete mode 100644 package/midori/0002-gcr-for-x11-only.patch
> 
[snip]
> diff --git a/package/midori/Config.in b/package/midori/Config.in
> index e2cc2ac612..6dbdbb764e 100644
> --- a/package/midori/Config.in
> +++ b/package/midori/Config.in
> @@ -1,31 +1,53 @@
> -comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7, host gcc >= 4.9"
> +config BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_USE_MMU
>   	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>   	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
> +	depends on !BR2_BINFMT_FLAT # webkitgtk -> icu
> +
> +comment "midori needs a glibc toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 8"
> +	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9 || \
> -		!BR2_TOOLCHAIN_USES_GLIBC
> +		!BR2_HOST_GCC_AT_LEAST_8 || \
> +		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +
> +comment "midori needs libgtk3 w/ X11 or wayland backend"
> +	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
> +	depends on !BR2_PACKAGE_LIBGTK3_X11 && \
> +		!BR2_PACKAGE_LIBGTK3_WAYLAND
>   
>   config BR2_PACKAGE_MIDORI
>   	bool "midori"
> -	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
> -	depends on BR2_PACKAGE_LIBGTK3
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # webkitgtk
> +	depends on !BR2_STATIC_LIBS # webkitgtk
>   	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
>   	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
> -	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
> -	# GCR can only be used with the X11 backend
> -	select BR2_PACKAGE_GCR if BR2_PACKAGE_LIBGTK3_X11
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
> +	depends on BR2_USE_WCHAR # granite, gcr, libsoup, libpeas, gobject-introspection
> +	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS

  We don't have a hard rule for it, but arch dependencies make more sense at the 
beginning IMHO, so I moved this up.

  Applied to next, thanks!

  Regards,
  Arnout

> +	depends on BR2_PACKAGE_LIBGTK3
> +	depends on BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND
> +	select BR2_PACKAGE_GCR
>   	select BR2_PACKAGE_GRANITE
> +	select BR2_PACKAGE_JSON_GLIB
> +	select BR2_PACKAGE_LIBARCHIVE
> +	select BR2_PACKAGE_LIBPEAS
> +	select BR2_PACKAGE_LIBPEAS_WIDGETS
>   	select BR2_PACKAGE_LIBSOUP
>   	select BR2_PACKAGE_LIBSOUP_GNOME
>   	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_PYTHON3 # gobject-introspection
>   	select BR2_PACKAGE_SQLITE
>   	select BR2_PACKAGE_WEBKITGTK
>   	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>   	help
>   	  Midori is a lightweight web browser based on WebKit
>   
> -	  http://www.midori-browser.org/
> +	  https://github.com/midori-browser/core
> diff --git a/package/midori/midori.hash b/package/midori/midori.hash
> index d8fd1b7a26..d0be396a5a 100644
> --- a/package/midori/midori.hash
> +++ b/package/midori/midori.hash
> @@ -1,5 +1,3 @@
> -# From download link @ http://midori-browser.org/download/source/
> -sha1	64c86935028feb5f89d799c2acacaad67764da6f	midori_0.5.11_all_.tar.bz2
> -
>   # Locally computed
> +sha256  913a7cba95ddcc3dc5f6b12d861e765d6fa990fe7d4efc3768d3a3567ea460db  midori-9.0.tar.gz
>   sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/midori/midori.mk b/package/midori/midori.mk
> index eebec815c0..693507dbb3 100644
> --- a/package/midori/midori.mk
> +++ b/package/midori/midori.mk
> @@ -4,9 +4,8 @@
>   #
>   ################################################################################
>   
> -MIDORI_VERSION = 0.5.11
> -MIDORI_SOURCE = midori_$(MIDORI_VERSION)_all_.tar.bz2
> -MIDORI_SITE = http://midori-browser.org/downloads
> +MIDORI_VERSION = 9.0
> +MIDORI_SITE = $(call github,midori-browser,core,v$(MIDORI_VERSION))
>   MIDORI_LICENSE = LGPL-2.1+
>   MIDORI_LICENSE_FILES = COPYING
>   MIDORI_CPE_ID_VENDOR = midori-browser
> @@ -15,10 +14,14 @@ MIDORI_DEPENDENCIES = \
>   	host-librsvg \
>   	host-pkgconf \
>   	host-vala \
> -	host-python \
> -	$(if $(BR2_PACKAGE_LIBGTK3_X11),gcr) \
> +	host-python3 \
> +	gcr \
> +	gobject-introspection \
>   	granite \
> +	json-glib \
> +	libarchive \
>   	libgtk3 \
> +	libpeas \
>   	libsoup \
>   	libxml2 \
>   	sqlite \
> @@ -26,10 +29,6 @@ MIDORI_DEPENDENCIES = \
>   	$(TARGET_NLS_DEPENDENCIES) \
>   	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>   
> -MIDORI_CONF_OPTS = \
> -	-DHALF_BRO_INCOM_WEBKIT2=ON \
> -	-DUSE_GRANITE=ON \
> -	-DUSE_GTK3=ON \
> -	-DUSE_ZEITGEIST=OFF
> +MIDORI_CONF_OPTS += -DGIR_COMPILER_PATH=$(STAGING_DIR)/usr/bin/g-ir-compiler
>   
>   $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
