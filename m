Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03348C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D39A404B5;
	Thu,  5 May 2022 20:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jfm8jMcH3O97; Thu,  5 May 2022 20:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 815FA4049E;
	Thu,  5 May 2022 20:02:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C276D1BF376
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE0E260B8B
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChionX1M0mrB for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:02:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 643B160A84
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:02:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id i19so10703813eja.11
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FJnkldqfipbIkMPY3VffaBmBzYLhgLO6NUcZboEiFZo=;
 b=XVzhJ5CnLfOoNwMx1iK1GFxNIrPB3MF1oPCt8rHbZ23GmKW6atVNE/+VN21eY6GG9Y
 K6s7m6J50Vvra3E/3d1c8tjMmPjcX5nzedBH5t2frEGvwfd7gp6TE+Ot6PSesXGF67xj
 k/ax9mCKh0l1zhfC42om2V2Pvnh58sU9qVre4IH2YD8AAGGY6EzWGMAQZfqw8lpdJ5cP
 5E2ZELK8nEtp+lMn4cV+nkYKUMF/o7+dLeS/DShzdKQeXNNNMTPleZBl8IsO8WxE7md3
 BSLVSx5TqrgKvXntOm0CiUEa2yxvppu6qQm4JeKf/t+zwUvJinWGUZ2Lcs7W3H0lRNWy
 JOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FJnkldqfipbIkMPY3VffaBmBzYLhgLO6NUcZboEiFZo=;
 b=aLnSCIgNQwzB3c0cWUQkE3U46nN9mKRXBE8qmS3LT8GzWOxbiTu1EojF4rvDgiiG5U
 0DwDBwfZpn1p5zrdR/R9RxEgmCoQljtBHR2hKF1MkJYlMtsWWn+8wXE3ygLiAoOgGfQp
 slxfvjVf4oUr1SFFR8Lp0ubTZmHZIQqEvhneQ+pW47n2yjxu/MWaEJZo3sTZInCBLL4j
 q5t58JBBToMIYiaflDlfun/+FjjmCI+5AWgAzfTpDhQGa4nGsJNKnKmx4IhF8JjaBYmX
 04zKaFGxx/Oh0R8ocZQO4hAShoXIEmGQHtm2edwWVMMbvc7ntlHwm45Okftmf+L9NY7f
 wRDQ==
X-Gm-Message-State: AOAM532MZUwoQsZ+XRayv5kyK0dmnvWUaz18aJjdVdENsalN9E1f3ZK0
 2uLQjZVeSNE1UliurJSpU2yHbMbY3+owxg==
X-Google-Smtp-Source: ABdhPJxMunM0vF50wLIkfIXPSD3lr0036ga4lQr7ZS1EaPzc9DmhINirwnmz+Bxhs8Ye1nhE2Z8iIA==
X-Received: by 2002:a17:907:8a0b:b0:6f4:4899:db98 with SMTP id
 sc11-20020a1709078a0b00b006f44899db98mr21798959ejc.622.1651780963544; 
 Thu, 05 May 2022 13:02:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 zd9-20020a17090698c900b006f3ef214e28sm1135121ejb.142.2022.05.05.13.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:02:43 -0700 (PDT)
Message-ID: <e4ccdb7f-f09f-ffbd-4450-4dcf459a6ee9@mind.be>
Date: Thu, 5 May 2022 22:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220505064009.2542433-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505064009.2542433-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: use meson to
 build/install packages
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
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 08:40, James Hilliard wrote:
> As of version 0.54.0 meson has had the ability to build and install
> packages rather than having to run ninja directly as before.
> 
> This will allow us to use features such as meson install tags in
> the future which require meson to be used for the installation.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   .../gobject-introspection.mk                  |  4 +-
>   package/pkg-meson.mk                          | 52 ++++++++++++++-----
>   package/systemd/systemd.mk                    |  4 +-
>   3 files changed, 41 insertions(+), 19 deletions(-)
> 
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index 41d64171a7..ea5100247d 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -30,14 +30,14 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
>   	host-python3
>   
>   # g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
> -GOBJECT_INTROSPECTION_NINJA_ENV += \
> +GOBJECT_INTROSPECTION_MESON_ENV += \

  If there are external packages that use this, they'll need to be updated as 
well. Yann, Peter, do you think that's acceptable?

  For sure, the documentation docs/manual/adding-packages-meson.txt will need to 
be updated.

  Regards,
  Arnout

>   	CC="$(TARGET_CC)"
>   
>   # When building, gobject-introspection uses tools/g-ir-scanner to build several
>   # .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
>   # links to the system-installed libglib2 path. To remedy this issue, defining
>   # LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
> -HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> +HOST_GOBJECT_INTROSPECTION_MESON_ENV += \
>   	LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
>   
>   # Use the host gi-scanner to prevent the scanner from generating incorrect
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index f1390a18d0..bdea893d93 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -21,13 +21,13 @@
>   ################################################################################
>   
>   #
> -# Pass PYTHONNOUSERSITE environment variable when invoking Meson or Ninja, so
> +# Pass PYTHONNOUSERSITE environment variable when invoking Meson, so
>   # $(HOST_DIR)/bin/python3 will not look for Meson modules in
>   # $HOME/.local/lib/python3.x/site-packages
>   #
> -MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> -NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
> -NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
> +MESON              = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> +MESON_BUILD_OPTS   = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
> +MESON_INSTALL_OPTS = --no-rebuild
>   
>   # https://mesonbuild.com/Reference-tables.html#cpu-families
>   ifeq ($(BR2_arcle)$(BR2_arceb),y)
> @@ -172,13 +172,23 @@ $(2)_DEPENDENCIES += host-meson
>   ifndef $(2)_BUILD_CMDS
>   ifeq ($(4),target)
>   define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> +	$$(TARGET_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		compile \
> +		$$(MESON_BUILD_OPTS) \
> +		$$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   else
>   define $(2)_BUILD_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> +	$$(HOST_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		compile \
> +		$$(MESON_BUILD_OPTS) \
> +		$$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   endif
>   endif
> @@ -189,8 +199,12 @@ endif
>   #
>   ifndef $(2)_INSTALL_CMDS
>   define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +	$$(HOST_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		install \
> +		$$(MESON_INSTALL_OPTS) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   endif
>   
> @@ -200,8 +214,13 @@ endif
>   #
>   ifndef $(2)_INSTALL_STAGING_CMDS
>   define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +	$$(TARGET_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		install \
> +		$$(MESON_INSTALL_OPTS) \
> +		--destdir $$(STAGING_DIR) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   endif
>   
> @@ -211,8 +230,13 @@ endif
>   #
>   ifndef $(2)_INSTALL_TARGET_CMDS
>   define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
> -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> +	$$(TARGET_MAKE_ENV) \
> +	$$($$(PKG)_MESON_ENV) \
> +	$$(MESON) \
> +		install \
> +		$$(MESON_INSTALL_OPTS) \
> +		--destdir $$(TARGET_DIR) \
> +		-C $$($$(PKG)_SRCDIR)/build
>   endef
>   endif
>   
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b309507e12..ea6f5febc2 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -746,7 +746,7 @@ endef
>   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
>   
>   SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> -SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> +SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
>   
>   define SYSTEMD_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
> @@ -849,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
>   	host-gperf \
>   	host-python-jinja2
>   
> -HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> -
>   # Fix RPATH After installation
>   # * systemd provides a install_rpath instruction to meson because the binaries
>   #   need to link with libsystemd which is not in a standard path
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
