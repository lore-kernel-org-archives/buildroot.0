Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616E4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E118C40133;
	Sun, 27 Mar 2022 15:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxAfGcY3SysI; Sun, 27 Mar 2022 15:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61CA240179;
	Sun, 27 Mar 2022 15:58:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66D011BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55AAD81D7C
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CWyIFFzNIgY for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 098EA81678
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:58:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j15so24012527eje.9
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8OSiggrTwZ+I1QeW5dnabKKy61MRIL+Ct0iz2tbJ1So=;
 b=Phl5DJLbUxd+32qzjftxWk5sGshRhxCR0opaTERQPqZ0Vx5Er1C5YkQzE61/HAYrxy
 0OSkk6R719MP2YqgkDEEbBQPFgAGk2eEqv+PPADxqdgHQgn8Y+/GqXo5b/scioYxrbVP
 WAt2nyxgTZr/PBjhBIHBtWcrv3tGZPsLT/gKZ07DFTXuoHz7MAXDd38r5vGJZ3RVr/pl
 6XRgyXJXGwu3ChWzxKOhBsMSbyoPjpmv7f7XFIYocDLNOL0tKVLBmZJOg/tCQWh8RP4L
 ZLGkNpHDhE9q5j9E3eXo5Hl3Gn3TSL1f0KAqxjYf9AIJdYhX+C7Crgk/RMDYRVgHcNb6
 dmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8OSiggrTwZ+I1QeW5dnabKKy61MRIL+Ct0iz2tbJ1So=;
 b=6AhivwcAWlik+r4HRy6kClRIEpBNP+P2oi7mDaGih4oNeg2LBwvUyvsfvbs3+3eXSb
 fiWLma2dzAzM1a5c/VK3PstOFRFYew09mGY2/dRaAALpDL9ObnI0KuRovPZo1VYD8Tma
 UZ4R2f4DYS32lO9S8LP2bBw/fTTTzDwFpq30MgFJJPwP64ELXxeVXfGC7NkDOPb409/e
 tCaVJBk43cHc+fv9wGqOcEEdi3J79YX2Ypv8zi+aVvC+YNqcIqm66rHEUZf7j1AkEm8I
 K10oZK76H9F1IFBIGhs1lOwDL68pHjwhmAAdk7821n0t9CqjzXfL7Jl9/i7o/+xx3Bwf
 Gnjw==
X-Gm-Message-State: AOAM533mn0OHjOSqNTk0cvpO1K6AWriizLkAFeD+MGHEnxl6AqYebt5X
 wfMWoklzKpQ+OjY0H6jJ8ppPbRbrsYkuoA==
X-Google-Smtp-Source: ABdhPJyrFDS/2iwCFEQhsu3OxHTTmRk2We9bvoatSs9b72PRAm2z7sPTgBePjlfipfcE2pCgXqYdNQ==
X-Received: by 2002:a17:907:761c:b0:6d6:e553:7bd1 with SMTP id
 jx28-20020a170907761c00b006d6e5537bd1mr22214983ejc.5.1648396684185; 
 Sun, 27 Mar 2022 08:58:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 js20-20020a17090797d400b006dfad24c5efsm4706460ejc.44.2022.03.27.08.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:58:03 -0700 (PDT)
Message-ID: <020967d3-bcea-3192-6532-4a8b3d64e298@mind.be>
Date: Sun, 27 Mar 2022 17:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220320162012.1527261-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220320162012.1527261-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: hid and hog needs
 headers >= 3.18
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marcin Bis <marcin@bis.org.pl>,
 Samuel Martin <s.martin49@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>, Mario Lang <mlang@blind.guru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/03/2022 17:20, Fabrice Fontaine wrote:
> Fix the following build failure with hid and hog raised since their
> addition in commit fb9fc969d91f69851b4c70dba512b607e52bda7b and
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9b58288693680b021e5dcbc6f8bea80b5be89311
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=646db71713b05d50b2b0c421da34e80ed4c54fbd
> because UHID_GET_REPORT is only available since kernel 3.18 and
> https://github.com/torvalds/linux/commit/fa71f32b5de2be1644ee671ddbe211d79be7847f:
> 
> profiles/input/device.c: In function 'uhid_send_get_report_reply':
> profiles/input/device.c:222:24: error: 'union <anonymous>' has no member named 'get_report_reply'
>    if (size > sizeof(ev.u.get_report_reply.data))
>                          ^
> profiles/input/device.c:223:21: error: 'union <anonymous>' has no member named 'get_report_reply'
>     size = sizeof(ev.u.get_report_reply.data);
>                       ^
> profiles/input/device.c:231:12: error: 'UHID_GET_REPORT_REPLY' undeclared (first use in this function)
>    ev.type = UHID_GET_REPORT_REPLY;
>              ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1db406eac7620e3f76d997414eb7af7d2ac6cfe6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bluez5_utils/Config.in | 16 ++++++++++++++++
>   package/brltty/Config.in       |  2 +-
>   package/cwiid/Config.in        |  6 +++---
>   package/kodi/Config.in         |  6 +++---
>   package/supertuxkart/Config.in |  2 +-
>   5 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> index 2eea8c7ced..49bb719102 100644
> --- a/package/bluez5_utils/Config.in
> +++ b/package/bluez5_utils/Config.in
> @@ -79,15 +79,23 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
>   
>   config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
>   	bool "build hid plugin"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
>   	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
>   	help
>   	  Build plugin for HID (input) profiles.
>   
> +comment "hid plugin needs a toolchain w/ headers >= 3.18"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> +
>   config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
>   	bool "build hog plugin"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
>   	help
>   	  Build plugin for HoG (input) profiles.
>   
> +comment "hog plugin needs a toolchain w/ headers >= 3.18"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> +
>   config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
>   	bool "build mesh plugin"
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
> @@ -126,11 +134,15 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
>   config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
>   	bool "build sixaxis plugin"
>   	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # hid plugin
>   	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
>   	help
>   	  Build sixaxis plugin (support Sony Dualshock
>   	  controller)
>   
> +comment "sixaxis plugin needs a toolchain w/ headers >= 3.18"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> +
>   comment "sixaxis plugin needs udev /dev management"
>   	depends on !BR2_PACKAGE_HAS_UDEV
>   
> @@ -142,11 +154,15 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
>   config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
>   	bool "build hid2hci tool"
>   	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # hid plugin
>   	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
>   	select BR2_PACKAGE_BLUEZ5_UTILS_TOOLS
>   	help
>   	  Build hid2hci tool
>   
> +comment "hid2hci tool needs a toolchain w/ headers >= 3.18"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> +
>   comment "hid2hci tool needs udev /dev management"
>   	depends on !BR2_PACKAGE_HAS_UDEV
>   
> diff --git a/package/brltty/Config.in b/package/brltty/Config.in
> index c728cb7e20..3527df6161 100644
> --- a/package/brltty/Config.in
> +++ b/package/brltty/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_BRLTTY
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
> +	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # runtime
>   	help
>   	  A daemon providing access to the Linux console for a blind
>   	  person using a refreshable braille display.
> diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
> index 6ae2ac9405..7e8cdc3086 100644
> --- a/package/cwiid/Config.in
> +++ b/package/cwiid/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
>   	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, alsa-lib, libglib2
>   	depends on BR2_USE_MMU # bluez5_utils -> dbus, libglib2
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # bluez5_utils hid plugin
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
>   	select BR2_PACKAGE_BLUEZ5_UTILS
>   	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
> @@ -28,9 +28,9 @@ config BR2_PACKAGE_CWIID_WMGUI
>   	select BR2_PACKAGE_LIBGTK2
>   endif
>   
> -comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.4"
> +comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.18"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
>   	depends on !BR2_USE_MMU
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index c8e1e5d0ed..4c6e01745c 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -130,7 +130,7 @@ config BR2_PACKAGE_KODI_AVAHI
>   
>   config BR2_PACKAGE_KODI_BLUEZ
>   	bool "bluetooth"
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # bluez5_utils hid plugin
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
>   	select BR2_PACKAGE_BLUEZ5_UTILS
>   	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
> @@ -138,9 +138,9 @@ config BR2_PACKAGE_KODI_BLUEZ
>   	help
>   	    Enable bluetooth support
>   
> -comment "bluetooth support needs a toolchain w/ headers >= 3.4"
> +comment "bluetooth support needs a toolchain w/ headers >= 3.18"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
>   
>   config BR2_PACKAGE_KODI_DBUS
>   	bool "dbus"
> diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
> index 1dd5dcf058..319415754a 100644
> --- a/package/supertuxkart/Config.in
> +++ b/package/supertuxkart/Config.in
> @@ -24,7 +24,7 @@ config BR2_PACKAGE_SUPERTUXKART
>   	select BR2_PACKAGE_SDL2
>   	select BR2_PACKAGE_XLIB_LIBXRANDR
>   	select BR2_PACKAGE_ZLIB
> -	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
> +	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # runtime
>   	help
>   	  Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
>   	  racer with multiple karts, tracks and modes you can play.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
