Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031D0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9735E40297;
	Sun, 13 Feb 2022 11:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiw0sXf10_UH; Sun, 13 Feb 2022 11:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B78EC40223;
	Sun, 13 Feb 2022 11:25:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 645EB1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5829C40181
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXm9ddm5k9CX for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:25:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE93E400D1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:25:42 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id j13so1515604ejk.1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=7LMGH9z/+SLPnSj4ppGFVWW4X0zeQ6WuOvgJL9sIXGw=;
 b=b5BDqOPqn6ftkG2ltZg23Nu0nGRABkMzu6xvVbt/r0Kngfj4qe6gx5cbJm56rKk4Hf
 VCWmnYQYmKbjSqAc6S9WrvUb0K8emPEo0rderkoAsJu6m0d0J7EMAQCAMWLp3uiX4ODb
 mTa6RswaXALYkcB7/B5ucqFrz1sTDDhau5/qpnjYVRLYhBsUbZnyGCn6Y8TrkhaePgGM
 s1i5YyvL/5insd/D9HnIZRPVekWjAaQl0LHmhIHDSLjGNmt4sof9PKdxb3/aqax9qYmw
 L47Eqg4wjDAeNHOwhOQwWBUk2CEQGPD4iCMav+s1sn292jtO6MSk5en2G7BJgL3hvb41
 KjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7LMGH9z/+SLPnSj4ppGFVWW4X0zeQ6WuOvgJL9sIXGw=;
 b=Bx0XLGqIW5/u2BD0fCa8hK7xqwFDE8aqhD53W71ifcKHWkpK+xjQvt9JCKKTW9fmsx
 7savKHaK0SI0ognul6flxmzwFp7wAbFYDNZZAm2LO9mezgpBITRFZsJtafNNja2bBnY/
 YEXfs+M0YSlTxYIbbF06Ms4HXHVOlj2cX+FAuisKFq1YTjr8o04my9LYiMXlL29i8VWL
 QZ6BpF7QI9bST2ZmWca/2jY62AK5xX+stwWMMDp4ZLC0jMBKkialeMx/NMayR/GNa38n
 R9AdO5OZE7PNymF855c/Y/r+dQopHnVQXs24zSVb28W3MJijRWTT+kBI8BA7jF8fOQk/
 xsDg==
X-Gm-Message-State: AOAM53262oUN886MdIXQZ/zMwW976emSDeFw/UiFcXRCNaKB2XtmKRnG
 mndw8gJiaGxKZi5tqyXiV5aixb5VcsB7aw==
X-Google-Smtp-Source: ABdhPJzdayIbPwi228/2tfEJ+Kp5FFI4/7j+h9U3Cc6HZHzKgrRStXpA5UobbbvZ62HN8Oxa1mRUGQ==
X-Received: by 2002:a17:906:7948:: with SMTP id
 l8mr7855792ejo.752.1644751540974; 
 Sun, 13 Feb 2022 03:25:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x22sm5896981edd.63.2022.02.13.03.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:25:40 -0800 (PST)
Message-ID: <8c6d99e1-c645-3f6d-cd18-6346f2c3d2a7@mind.be>
Date: Sun, 13 Feb 2022 12:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Andre Renaud <andre@ignavus.net>, buildroot@buildroot.org
References: <8B42D9C7-D86C-4A08-B552-3523E7D0C50D@ignavus.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8B42D9C7-D86C-4A08-B552-3523E7D0C50D@ignavus.net>
Subject: Re: [Buildroot] [PATCH] package/libglfw: bump to 3.3.6 and enable
 Wayland/libGLES support
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



On 01/02/2022 21:43, Andre Renaud wrote:
> Signed-off-by: Andre Renaud <andre@ignavus.net>
> ---
>   package/libglfw/Config.in    | 19 ++++++++++---------
>   package/libglfw/libglfw.hash |  2 +-
>   package/libglfw/libglfw.mk   | 16 ++++++++++++++--
>   3 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/package/libglfw/Config.in b/package/libglfw/Config.in
> index 06f4376453..9705fef432 100644
> --- a/package/libglfw/Config.in
> +++ b/package/libglfw/Config.in
> @@ -1,17 +1,18 @@
>   config BR2_PACKAGE_LIBGLFW
>   	bool "libglfw"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_PACKAGE_HAS_LIBGL
> -	select BR2_PACKAGE_XLIB_LIBXCURSOR
> -	select BR2_PACKAGE_XLIB_LIBXEXT
> -	select BR2_PACKAGE_XLIB_LIBXI
> -	select BR2_PACKAGE_XLIB_LIBXINERAMA
> -	select BR2_PACKAGE_XLIB_LIBXRANDR
> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXINERAMA if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
>   	help
>   	  GLFW is an Open Source, multi-platform library for creating
>   	  windows with OpenGL contexts and receiving input and events.
> 
>   	  http://www.glfw.org
> 
> -comment "libglfw depends on X.org and needs an OpenGL backend"
> -	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
> +comment "libglfw depends on X.org/Wayland and needs an OpenGL/GLES backend"
> +	depends on !(BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND)
> +	depends on !(BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES)
> diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
> index c21a595bbc..5bffc55d26 100644
> --- a/package/libglfw/libglfw.hash
> +++ b/package/libglfw/libglfw.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  98768e12e615fbe9f3386f5bbfeb91b5a3b45a8c4c77159cef06b1f6ff749537  libglfw-3.3.2.tar.gz
> +sha256  ed07b90e334dcd39903e6288d90fa1ae0cf2d2119fec516cf743a0a404527c02  libglfw-3.3.6.tar.gz
>   sha256  149704059b5d0bf551637e50042dd4de9c2cae921021f6636298911e3a5f9462  LICENSE.md
> diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
> index 63d2a88bf8..7daf61af0e 100644
> --- a/package/libglfw/libglfw.mk
> +++ b/package/libglfw/libglfw.mk
> @@ -4,11 +4,19 @@
>   #
>   ################################################################################
> 
> -LIBGLFW_VERSION = 3.3.2
> +LIBGLFW_VERSION = 3.3.6
>   LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
>   LIBGLFW_INSTALL_STAGING = YES
> -LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +LIBGLFW_DEPENDENCIES = xlib_libXcursor xlib_libXext \

  Overriding assignment within conditions is no longer accepted by 
check-package, so I changed this into +=

  I also reordered stuff so the unconditional stuff precedes the conditional 
stuff, and added an empty line between the different conditions.

  Applied to master with those changes, thanks.

>   	xlib_libXi xlib_libXinerama xlib_libXrandr
> +endif
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +LIBGLFW_DEPENDENCIES += libgl
> +endif
> +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> +LIBGLFW_DEPENDENCIES += libgles

  Does the combination X11+GLES work? It wasn't possible before and it is 
possible now.

  I guess the autobuilders will tell us that. However, you're not registered as 
a developer for this package, so you won't get notified. Could you add yourself 
to DEVELOPERS for this package?

  Regards,
  Arnout

> +endif
>   LIBGLFW_LICENSE = Zlib
>   LIBGLFW_LICENSE_FILES = LICENSE.md
> 
> @@ -17,6 +25,10 @@ LIBGLFW_CONF_OPTS += \
>   	-DGLFW_BUILD_TESTS=OFF \
>   	-DGLFW_BUILD_DOCS=OFF
> 
> +ifeq ($(BR2_PACKAGE_WAYLAND),y)
> +LIBGLFW_CONF_OPTS +=  -DGLFW_USE_WAYLAND=1
> +endif
> +
>   ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
>   LIBGLFW_DEPENDENCIES += xlib_libXxf86vm
>   endif
> --
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
