Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01476C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 18:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F5828139F;
	Thu, 11 Jan 2024 18:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F5828139F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ctln7rPvB_z; Thu, 11 Jan 2024 18:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF05F81325;
	Thu, 11 Jan 2024 18:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF05F81325
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF3E1BF255
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 650E8812DA
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 650E8812DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BBOFnVo3o0z for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 18:38:27 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B63BD8128F
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 18:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B63BD8128F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0E3DEB0051B;
 Thu, 11 Jan 2024 19:38:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 19:38:23 +0100
Date: Thu, 11 Jan 2024 19:38:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaA1nyP4wekxU6FQ@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-7-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-7-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704998306;
 bh=k+G2dEc9kZlvr0DGbx5QXpciaKpnmOK6tgeB9rb+cAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KE9N70/9Li5QuMfC7ewGphF9uypkNnStEw4U4gxR8jl9q3Imb59EJDLF89O2wVw5K
 5AcTu9wZz+JVsI2ZVKW036LvRXcCynDLcpuy9xPErqXCmdL5f1tFJC4pqaiy34zIhR
 f3PP52zzTScOxiL9UKEg9pWn93kJdmnw0Ts7Qfd/oDaUmy28eKRIVHazmZv5Tk02OD
 op+NxGGrp57qKHYMRDoEwNZ2x0FTfV+1dcCevOv+pX/j9DBCQRD/fK/WJv89cE8h4s
 4sufDLh94qrQkY8QeLJYwYqydWDkF21wVPKNFZUdvrkSA3sECAQWYjjkAjLnpAsGsA
 QCopU+hJUIKdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KE9N70/9
Subject: Re: [Buildroot] [PATCH v3 06/11] package/flutter-pi: add the
 charset converter plugin as a menuconfig option
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

Adam, All,

On 2024-01-02 16:59 -0700, Adam Duskett spake thusly:
> Commit 6a28738 introduces the charset_converter, which is a platform-side
> implementation of the charset_converter plugin found here:
> https://pub.dev/packages/charset_converter
> 
> The charset_converter plugin does the following:
> ```
> Encode and decode charsets using platform built-in converter.
> This plugin saves app package size as you don't need external charset maps or
> whole libraries like iconv. This package doesn't even contain any Dart
> dependencies. However, this comes with the dependency on the platform.
> ```

I moved the description to the help text, so that users have a bit more
details to decide whether to enable it or not.

>   - Remove -DBUILD_CHARSET_CONVERTER_PLUGIN=OFF as the default in
>     FLUTTER_PI_CONF_OPTS.
> 
>   - Add a new Menuconfig option BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
>     with a brief description about the new plugin and a link to the plugin that
>     provides a full explination.
> 
>   - Add logic around the BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN option
>     to enable or disable the plugin if selected or not.

This commit log is otherwise just descriptive of the change, not
explanatory, but there's not much to explain, and the title text (which
I slightly reworded) says it all, so that's fine to have  mostly empty
commit log sometimes. ;-)

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flutter-pi/Config.in     | 7 +++++++
>  package/flutter-pi/flutter-pi.mk | 7 ++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
> index ecebfad89b..45b6b4faef 100644
> --- a/package/flutter-pi/Config.in
> +++ b/package/flutter-pi/Config.in
> @@ -23,6 +23,13 @@ if BR2_PACKAGE_FLUTTER_PI
>  
>  comment "plugins"
>  
> +config BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
> +	bool "charset converter"
> +	help
> +	  Adds platform-side implementation of charset_converter plugin.
> +
> +	  See: https://pub.dev/packages/charset_converter
> +
>  config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
>  	bool "gstreamer audio player"
>  	depends on BR2_PACKAGE_HAS_LIBGLES
> diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
> index 4ec89bdfad..ab640d704a 100644
> --- a/package/flutter-pi/flutter-pi.mk
> +++ b/package/flutter-pi/flutter-pi.mk
> @@ -27,7 +27,6 @@ FLUTTER_PI_CONF_OPTS = \
>  	-DENABLE_VULKAN=OFF \
>  	-DFILESYSTEM_LAYOUT=meta-flutter \
>  	-DLINT_EGL_HEADERS=OFF \
> -	-DBUILD_CHARSET_CONVERTER_PLUGIN=OFF \
>  	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
>  	-DTRY_BUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF \
>  	-DTRY_ENABLE_OPENGL=OFF \
> @@ -43,6 +42,12 @@ else
>  FLUTTER_PI_CONF_OPTS += -DLTO=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN),y)
> +FLUTTER_PI_CONF_OPTS += -DBUILD_CHARSET_CONVERTER_PLUGIN=ON
> +else
> +FLUTTER_PI_CONF_OPTS += -DBUILD_CHARSET_CONVERTER_PLUGIN=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN),y)
>  FLUTTER_PI_DEPENDENCIES += gstreamer1 gst1-plugins-base
>  FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=ON
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
