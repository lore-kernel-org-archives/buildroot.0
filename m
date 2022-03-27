Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65AAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F048193E;
	Sun, 27 Mar 2022 15:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9gEFbEh3XKJ; Sun, 27 Mar 2022 15:58:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E00A818AC;
	Sun, 27 Mar 2022 15:58:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48B071BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35ACB40104
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Qpceu05TiJS for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:58:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D46AB40179
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:58:41 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a8so23997821ejc.8
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FgFd5/sqm8UIl6VlpD3yMt88QtBt4gwD3cwdXG80CmI=;
 b=WL9nD9r2TsPaGltmHsFZYWxkqLb08XZ3NGOlmGzllfzkYSXSDjvXQsf6IJVH+NF6Xl
 T0V3VsDdypH1iUK5VT+EJ+Q2nUb6Gcm0t/uxeDOISk28YQbdcsr2vaB9EYXz2KFpIoIz
 VE4kMEnkCtSSzGF3IUbLpoggAGzZXrCkYFhowm6i/RWpfEif0XcnEGeqlYRT6J4DMhsU
 9NILT5AyMsB3Cu8tQRpUFAq8KggkS6SDPPur12wWm5XhiAUc6AIZ+kgD59ye8fFJkdnC
 3GgnDgUhoUISbXODEdXOdRwC9uhpXFQARTaa49yqnCWLlcVD0Cug79ytBfS2pFv/fFAG
 f6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FgFd5/sqm8UIl6VlpD3yMt88QtBt4gwD3cwdXG80CmI=;
 b=1A11kCgjpCpHI7GDbjXHgWK+dof/nZQq54gaetUxaPm9FGzfTRCQDS0OpJMlf8iJcG
 92MKIzBbUnNu9hpqXZQxmVnU6HxIV1SkAnV5W171/iJkJCd0g0kPz5/vv88LabLy0l2a
 FooJ2hGkI0Blf87d/qGEL1GlkZ6xzzl8/0uTgizJxze0ixx0wER2YO64LpFH88R6RmeM
 dIDmfZmdUPYIDfdDoBgbTXDFvBKJvumG7iAny0sdcjRQmS+ulchky80YiocjFTRBJQpZ
 /Qs62RtjAh+bt17X/ymvDVwr/nvv2NjBB4K4wNC3UtGd610Mvq2lx95gY4ndD2TyG2F1
 XVjA==
X-Gm-Message-State: AOAM533nLKQKodirkjVsc2lWd3JGPF6KiNVOEvWmZCiXfChLKT/kJlSR
 VCwJC2VZnM5fHvCqWIAqrGKzJ4t7j9whLw==
X-Google-Smtp-Source: ABdhPJyeLDE7FBZ5FXVqFXKB47q9i+pmiy4tJhN8g3TyHhwoPG19MTQv24/NtD5PWrHQ4DPOTF8KZg==
X-Received: by 2002:a17:907:7255:b0:6df:6b81:3872 with SMTP id
 ds21-20020a170907725500b006df6b813872mr23011851ejc.461.1648396720135; 
 Sun, 27 Mar 2022 08:58:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gb29-20020a170907961d00b006e00c7b0f5asm4815966ejc.0.2022.03.27.08.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:58:39 -0700 (PDT)
Message-ID: <feb09d87-5bf6-b51c-ba3d-36d8d4a6a905@mind.be>
Date: Sun, 27 Mar 2022 17:58:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220320211815.1798812-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220320211815.1798812-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/jack1: libsamplerate is
 optional, not mandatory
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
Cc: Adam Heinrich <adam@adamh.cz>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/03/2022 22:18, Fabrice Fontaine wrote:
> libsamplerate is only needed to build the NetJack backend and internal
> client
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/jack1/Config.in | 1 -
>   package/jack1/jack1.mk  | 6 +++++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/jack1/Config.in b/package/jack1/Config.in
> index 1c67f10332..625afdf8c1 100644
> --- a/package/jack1/Config.in
> +++ b/package/jack1/Config.in
> @@ -10,7 +10,6 @@ config BR2_PACKAGE_JACK1
>   	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
>   	select BR2_PACKAGE_ALSA_LIB_SEQ
>   	select BR2_PACKAGE_BERKELEYDB
> -	select BR2_PACKAGE_LIBSAMPLERATE
>   	select BR2_PACKAGE_LIBSNDFILE
>   	help
>   	  JACK Audio Connection Kit (JACK 1 implementation).
> diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
> index 311f7c9ba0..39183826a4 100644
> --- a/package/jack1/jack1.mk
> +++ b/package/jack1/jack1.mk
> @@ -11,7 +11,11 @@ JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
>   JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
>   JACK1_INSTALL_STAGING = YES
>   
> -JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsamplerate libsndfile
> +JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsndfile
> +
> +ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
> +JACK1_DEPENDENCIES += libsamplerate
> +endif
>   
>   ifeq ($(BR2_PACKAGE_READLINE),y)
>   JACK1_DEPENDENCIES += readline
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
