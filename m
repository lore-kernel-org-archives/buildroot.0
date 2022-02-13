Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC690C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67299814B4;
	Sun, 13 Feb 2022 15:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9-S11BHmPd2; Sun, 13 Feb 2022 15:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7438B813DC;
	Sun, 13 Feb 2022 15:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3E291BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEDA6813DC
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLfa95NrWe03 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:18:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CEC181315
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:18:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z13so5314936edc.12
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Ou1BdFoPSQBKAkAX5ciVEV7RgM1Tv2wjuIgqGtXP5wg=;
 b=RnvCQY8I2beRWhzVAgOJnfTG4VJMZ44dhKeC+T4ioNXKZWYHvpkK9wdGBXMbpSSqsQ
 CxiXhpC/smoWR0laDf5kNIZLm9ZXmiHAgThS5/MFGWVlateWf9oErx1toW8S0BXU46hD
 +Os16/dQU/TA0MLXfypYFt531wh5ry6f2aXSz0dfcg/LJ3KoYRGkUe2SqI4Bm0cYkGva
 /Cxe46dGrKdcQas8ZlrrAvgs2e9F/fpfP6iIIppxdbCZkzE4n5WE86yoKW9F5kBqmOe/
 rD7ewn2fz4C/hXifSW7LqF1IyuJRbaSO8KNX6N6xvgUb1EE5NjEfJH5EOxK3212bsjiW
 Zd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ou1BdFoPSQBKAkAX5ciVEV7RgM1Tv2wjuIgqGtXP5wg=;
 b=ZYrLEeM0LPj1yytJ+CKGGH6fuWsVHWSWuWUbCJPoNTBad3mfFhwPzumx0+gXhEe4yZ
 VkvY9CSsQBhWh3TY74mKMvGI6jmu7IrujbAd+jJgjAy4XFY+nbZvt0WbVoRxYzk9qzZq
 fCeQnuuDNIuY7mBXeuaHoLobhiq8GvIUMYnn3nnZsQ231pAM0+kj7AdKDKPAHcQUTjut
 SvFLPSAP128kV/7R/ZPXyxoPxHp5eIL2SJuLvzKx0i9ZZ6Imh/aXryaUhabXrL7ztdMl
 EC8cCql8dmIqXqvEalLIr92K8VL8lma8byqfo+TGAE0bhEWPvxmSvjDV4UQoVRAKNxNG
 2gWA==
X-Gm-Message-State: AOAM531ZjpMTKCCXx7hMMBBQjHQDwlHyPqRF+eV2gzQy3P/1Xch+kfKR
 2VHeZcV14/g2MEG8YGr4t45hlqrjQ+g4yw==
X-Google-Smtp-Source: ABdhPJzuP2vuNIW4oO5iifs/fP6xf/Ys7KUHIWuJ/YoWsyM6wfCOsxaw4TN0O2zIT++UIMao9M1Biw==
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr10982959edc.258.1644765537305; 
 Sun, 13 Feb 2022 07:18:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v16sm9643210ejo.156.2022.02.13.07.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:18:56 -0800 (PST)
Message-ID: <9e24e8c1-2b12-59c1-82a9-6ef49557132f@mind.be>
Date: Sun, 13 Feb 2022 16:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220206095359.854435-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206095359.854435-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/rygel: gobject-introspection is mandatory
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 10:53, Fabrice Fontaine wrote:
> vapi (and gobject-introspection) is mandatory since bump to version
> 0.40.2 in commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:
> 
> valac -C --pkg posix --pkg libxml-2.0 --pkg gmodule-2.0 --pkg gio-2.0 --pkg gssdp-1.2 --pkg gee-0.8 --pkg gupnp-1.2 --target-glib ' 2.56' --pkg glib-2.0 --color=always --directory src/librygel-core/librygel-core-2.6.so.2.0.4.p --basedir ../src/librygel-core --library rygel-core-2.6 --header src/librygel-core/rygel-core.h --vapi ../rygel-core-2.6.vapi --gir ../Rygel-2.6.gir ../src/librygel-core/rygel-build-config.vapi ../src/librygel-core/rygel-connection-manager.vala ../src/librygel-core/rygel-basic-management.vala ../src/librygel-core/rygel-basic-management-test.vala ../src/librygel-core/rygel-basic-management-test-ping.vala ../src/librygel-core/rygel-basic-management-test-nslookup.vala ../src/librygel-core/rygel-basic-management-test-traceroute.vala ../src/librygel-core/rygel-description-file.vala ../src/librygel-core/rygel-dlna-profile.vala ../src/librygel-core/rygel-energy-management.vala ../src/librygel-core/rygel-root-device.vala ../src/librygel-core/rygel-root-device-factory
 .v
>   ala ../src/librygel-core/rygel-dbus-interface.vala ../src/librygel-core/rygel-log-handler.vala ../src/librygel-core/rygel-meta-config.vala ../src/librygel-core/rygel-plugin-loader.vala ../src/librygel-core/rygel-recursive-module-loader.vala ../src/librygel-core/rygel-plugin.vala ../src/librygel-core/rygel-resource-info.vala ../src/librygel-core/rygel-media-device.vala ../src/librygel-core/rygel-configuration.vala ../src/librygel-core/rygel-base-configuration.vala ../src/librygel-core/rygel-cmdline-config.vala ../src/librygel-core/rygel-environment-config.vala ../src/librygel-core/rygel-user-config.vala ../src/librygel-core/rygel-state-machine.vala ../src/librygel-core/rygel-v1-hacks.vala ../src/librygel-core/rygel-icon-info.vala ../src/librygel-core/rygel-xml-utils.vala ../src/librygel-core/rygel-plugin-information.vala
> error: Package `gssdp-1.2' not found in specified Vala API directories or GObject-Introspection GIR directories
> error: Package `gupnp-1.2' not found in specified Vala API directories or GObject-Introspection GIR directories
> 
> Depends on BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES instead of selecting
> it to avoid the following recursive dependency:
> 
> package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
> package/gstreamer1/gstreamer1/Config.in:5:	symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1
> package/rygel/Config.in:46:	symbol BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1 is part of choice <choice>
> package/rygel/Config.in:39:	choice <choice> contains symbol <choice>
> package/rygel/Config.in:39:	choice <choice> contains symbol BR2_PACKAGE_RYGEL
> package/rygel/Config.in:1:	symbol BR2_PACKAGE_RYGEL depends on BR2_PACKAGE_PYTHON3
> package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
> package/jack2/Config.in:35:	symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
> package/jack2/Config.in:1:	symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
> package/fluidsynth/Config.in:37:	symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
> package/fluidsynth/Config.in:1:	symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
> package/gstreamer1/gst1-plugins-bad/Config.in:425:	symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1

  I think that now python2 has been removed, we can select python3 for 
gobject-introspection instead of depending on it, and that that would break this 
circular dependency.

  select python3 would also allow us to remove the python3 dependency from all 
transitive dependencies of gobject-introspection.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/027ce84895fab6fb251dd37cd5cfb7169287a2de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>   - Depends on BR2_PACKAGE_{PYTHON3,GSTREAMER1_EDITING_SERVICES}
> 
>   package/rygel/Config.in | 23 +++++++++++++++++------
>   package/rygel/rygel.mk  |  9 ++-------
>   2 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/package/rygel/Config.in b/package/rygel/Config.in
> index df48918833..30e8430537 100644
> --- a/package/rygel/Config.in
> +++ b/package/rygel/Config.in
> @@ -2,8 +2,14 @@ config BR2_PACKAGE_RYGEL
>   	bool "rygel"
>   	depends on BR2_USE_WCHAR # gupnp-av
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # gupnp-av
> -	depends on BR2_USE_MMU # gupnp-av
> +	depends on BR2_USE_MMU # gupnp-av, gobject-introspection
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
> +	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
>   	select BR2_PACKAGE_GDK_PIXBUF
> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION
>   	select BR2_PACKAGE_GUPNP_AV
>   	select BR2_PACKAGE_GUPNP_DLNA
>   	select BR2_PACKAGE_LIBGEE
> @@ -39,14 +45,19 @@ config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_SIMPLE
>   
>   config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1
>   	bool "gstreamer1"
> -	select BR2_PACKAGE_GSTREAMER1
> -	select BR2_PACKAGE_GST1_PLUGINS_BASE
> -	select BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
> +	depends on BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
> +
> +comment "gstreamer1 needs gst1-editing-services"
> +	depends on !BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
>   
>   endchoice
>   
> -comment "rygel needs a toolchain w/ wchar, threads"
> +comment "rygel needs a glibc toolchain w/ wchar, threads, gcc >= 4.9, host gcc >= 8"
>   	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_8
>   
>   endif # BR2_PACKAGE_RYGEL
> diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
> index c541cdc0ed..bfcd5df3c6 100644
> --- a/package/rygel/rygel.mk
> +++ b/package/rygel/rygel.mk
> @@ -12,6 +12,7 @@ RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
>   RYGEL_LICENSE_FILES = COPYING COPYING.logo
>   RYGEL_DEPENDENCIES = \
>   	gdk-pixbuf \
> +	gobject-introspection \
>   	gupnp-av \
>   	gupnp-dlna \
>   	libgee \
> @@ -24,16 +25,10 @@ RYGEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>   RYGEL_CONF_OPTS += \
>   	-Dapi-docs=false \
>   	-Dexamples=false \
> +	-Dintrospection=enabled \
>   	-Dtests=false
>   RYGEL_PLUGINS = external,lms,mpris,ruih
>   
> -ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -RYGEL_CONF_OPTS += -Dintrospection=enabled
> -RYGEL_DEPENDENCIES += gobject-introspection
> -else
> -RYGEL_CONF_OPTS += -Dintrospection=disabled
> -endif
> -
>   ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1),y)
>   RYGEL_CONF_OPTS += \
>   	-Dengines=gstreamer \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
