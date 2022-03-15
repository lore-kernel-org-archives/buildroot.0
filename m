Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36467C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C751D4056D;
	Tue, 15 Mar 2022 21:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11hDxu0Vh5hn; Tue, 15 Mar 2022 21:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87FB0404EB;
	Tue, 15 Mar 2022 21:47:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84FA61BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7400A84176
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBP6RkuAybjT for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:47:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6586984166
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:47:36 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y22so531712eds.2
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=s7MMjX5zMD751xK0K8emT1qVc4FQRwB9t4bPcboAf7U=;
 b=cwMDdQiIXrxrRdk2wVtmhN++rhpSRlXTnh0gBspLCc5GLzs8NEDhhAKd1iS2pSiNpT
 /oX/n6LIb+lGBzm68UdOvGYVHTeck/3oXOS4fsDa9Onjn/g9XUkLbhOph4hI4kfzyh7+
 bot8Zv7Hf0+F+IG4zGwc+bIYEh1JEz73/Dboh6N8m59wnMWADPYOSxQHICSN9fn8SwGF
 FdpUkuG1WrwxOsVKLU65Cem1VuS4M+KI1ycpvCwjRgV+sZhhnAPUrzVmHa9xCg/vlQ0b
 gq2u4hshC2IpZGefjm6D+ar48NmHgQK2kn2iGYwZVpuN7lP6ydRZkiKEpYnF1pK3rRz0
 sUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=s7MMjX5zMD751xK0K8emT1qVc4FQRwB9t4bPcboAf7U=;
 b=zqL4f3rwxXtthYOsmyW/lTMCKokJoKrottsQKILgMLbkWGR1634xQqFDJAQTHQqbqT
 z0qXKIcqQpqmJOglHopuFsb6OAVRGrkBE282eSWryisMkJYom39AQe8qfOA/SvPRHVBT
 04GsEEK8S3fRiAIi/oduDOeRfMnfmuYpTUZkmNh8ZatMU2LJPjgnpdV+hiHEF/4CxTDh
 JG8uWoTjI0rDmiplvZhzi1JUfU29f80h7skV1N4WSyvFfexe2ELHL630B/Ad7UedDKi/
 OtAwRwB+eQg5/m1omZvt7yz3TgXy1Dct9y1XH2L9uyfxkUz1Gy42XMa8pm4EEXa0IScI
 TRvg==
X-Gm-Message-State: AOAM532vDhuim2eKf5VBBcz5WxfxQPimHicyrvAtaxymr7OUc1+DH/Zp
 pgeIoQ8MxsPwHN1VAgqXP990jg==
X-Google-Smtp-Source: ABdhPJyuORjThtxiOj8VpQJMFBZBZMqPON0eBCBhUvAQksfxGYR/WnJsuAUU/lArqYFsbV3x8WoUhA==
X-Received: by 2002:a05:6402:d09:b0:418:7a4a:c3f2 with SMTP id
 eb9-20020a0564020d0900b004187a4ac3f2mr12702112edb.366.1647380854616; 
 Tue, 15 Mar 2022 14:47:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a170907914400b006d9e0b46fabsm77934ejs.193.2022.03.15.14.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:47:34 -0700 (PDT)
Message-ID: <fac0d780-b534-d53c-cf59-9f1ca17bc75e@mind.be>
Date: Tue, 15 Mar 2022 22:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220309210953.540376-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309210953.540376-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/xscreensaver: bump to version
 6.03
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2022 22:09, Fabrice Fontaine wrote:
> xlib_libXft and xlib_libXi are now mandatory
> 
> https://www.jwz.org/xscreensaver/changelog.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xscreensaver/Config.in         |  2 ++
>   package/xscreensaver/xscreensaver.hash |  2 +-
>   package/xscreensaver/xscreensaver.mk   | 18 +++---------------
>   3 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
> index 10b2b7012c..48eefdfa70 100644
> --- a/package/xscreensaver/Config.in
> +++ b/package/xscreensaver/Config.in
> @@ -14,6 +14,8 @@ config BR2_PACKAGE_XSCREENSAVER
>   	select BR2_PACKAGE_LIBXML2
>   	select BR2_PACKAGE_JPEG
>   	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXFT
> +	select BR2_PACKAGE_XLIB_LIBXI
>   	select BR2_PACKAGE_XLIB_LIBXT
>   	help
>   	  XScreenSaver is the standard screen saver collection shipped
> diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
> index 26ecd8bbbf..27ef7d8f00 100644
> --- a/package/xscreensaver/xscreensaver.hash
> +++ b/package/xscreensaver/xscreensaver.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  7016df6736ba0126a68c1f35abcf411a695fe93bc01a18ebd9df46c9a9f4d50d  xscreensaver-5.45.tar.gz
> +sha256  328d51797352acf58ca5bab49e76fbf26034e7cad785f651ea11ce7b43fba25a  xscreensaver-6.03.tar.gz
>   sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
>   sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
> diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
> index 46dedc3211..0a91d22d14 100644
> --- a/package/xscreensaver/xscreensaver.mk
> +++ b/package/xscreensaver/xscreensaver.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XSCREENSAVER_VERSION = 5.45
> +XSCREENSAVER_VERSION = 6.03
>   XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
>   
>   # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
> @@ -20,6 +20,8 @@ XSCREENSAVER_DEPENDENCIES = \
>   	libgtk2 \
>   	libxml2 \
>   	xlib_libX11 \
> +	xlib_libXft \
> +	xlib_libXi \
>   	xlib_libXt \
>   	$(TARGET_NLS_DEPENDENCIES) \
>   	host-intltool
> @@ -51,20 +53,6 @@ else
>   XSCREENSAVER_CONF_OPTS += --with-systemd=no
>   endif
>   
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
> -XSCREENSAVER_CONF_OPTS += --with-xft=yes
> -XSCREENSAVER_DEPENDENCIES += xlib_libXft
> -else
> -XSCREENSAVER_CONF_OPTS += --with-xft=no
> -endif
> -
> -ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
> -XSCREENSAVER_CONF_OPTS += --with-xinput-ext=yes
> -XSCREENSAVER_DEPENDENCIES += xlib_libXi
> -else
> -XSCREENSAVER_CONF_OPTS += --with-xinput-ext=no
> -endif
> -
>   ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
>   XSCREENSAVER_CONF_OPTS += --with-xinerama-ext=yes
>   XSCREENSAVER_DEPENDENCIES += xlib_libXinerama
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
