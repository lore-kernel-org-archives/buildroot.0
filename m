Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83892C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3166960EB1;
	Thu, 21 Apr 2022 17:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GCUfFF7KrXYc; Thu, 21 Apr 2022 17:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E76F60B17;
	Thu, 21 Apr 2022 17:55:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2E311BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E07A64046B
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCLoq6S-beY6 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:55:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC6B54015D
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:55:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so3931079wmn.1
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=zxATyafX+C4r8Oy6kImRRvLYPjPTGOOD8JgZiVOTDMY=;
 b=MYSvWRjd9fUSakpHIMWebbtP2WZ0CWvKAHIMFfAwmGtYwo8XIEfv4qLuJf+93yLvkM
 762RV61tgSwHV/+uLv360nKzdK+kxw/Tlj1rLG0Jn/XmkBKVmpn8TRv6nBTuFvtnO/g3
 XLvbQGUpjmpkKijJz/ot8kiOLT4jFLkU3ebw880uuQMC7pj9PNCS2BKU6H1C7nZAT2Nu
 Az6WLZSh9dnGNJ/mIxS3bGrMyUVIrHZmL5cICftm2LMKUdGDnnb8CDtKYomQk/7oGL5z
 rzYKOFRmkS2dRwa+c+u8uGeNiWRhiWpHwpJ1vNrTvgVpKQbNX4tIpwKZFthqu21NJBzb
 NXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zxATyafX+C4r8Oy6kImRRvLYPjPTGOOD8JgZiVOTDMY=;
 b=peONMSfaO8qeAu+z+98sWQxckjHdEWmGTYx0WItjxcehZqunLusir199uRFdYE+bqX
 hBb94NHi4xSbHZuwPgDHkNerM6RttnP4j3+hG3IlGqvixIrv9TsY8M3TfcQvjMpj3rTR
 A41QtWpMT9JztSo5MRebNxpNL5uvj9s1Q+0w9s9fyGkZ4EjsVJ4vVmu1kMU/WwTs8uew
 jTgTp68dFVTqx9RZ82s+PuRb9996TsImQFSX73TxW3YKQYQiVnKPIAWW+/Ud4lIVOAah
 FzYtVoHV/0V8HXcinY6TSEwypSVFVLEOLVu4l1vuO4FDIDiGKQcr5XQL5+PPLhwMwslz
 dD4A==
X-Gm-Message-State: AOAM531r58yzla561iuVifUD6RKU63up4eLVp6+ATFCMWdFkmkl253ZT
 iahWSRFYZTXuSsFQzZGniBKeGMkr4fRt6Q==
X-Google-Smtp-Source: ABdhPJypduMpv4sAOSv/ePgYg+vkftXTfq4FmHOSvu33wVUGJji/almmM83GvUBbCbRbl0sZi/ooXg==
X-Received: by 2002:a7b:c403:0:b0:38e:7c57:9af7 with SMTP id
 k3-20020a7bc403000000b0038e7c579af7mr478893wmi.144.1650563745061; 
 Thu, 21 Apr 2022 10:55:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05600c22d400b0038c8dbdc1a3sm2550859wmg.38.2022.04.21.10.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:55:44 -0700 (PDT)
Message-ID: <3eb4b64d-f59d-845a-ce26-f49d3fb9dd98@mind.be>
Date: Thu, 21 Apr 2022 19:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220411212234.257672-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220411212234.257672-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/startup-notification: bump to
 version 0.12
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



On 11/04/2022 23:22, Fabrice Fontaine wrote:
> xcb-util is mandatory since
> https://cgit.freedesktop.org/startup-notification/commit/?id=15c0bae76e0bcd5d2839a791cf51c8b22e615fe2
> https://cgit.freedesktop.org/startup-notification/commit/?id=57816a46aa32d0bd667661ce6aaaa187f84ec889
> 
> https://cgit.freedesktop.org/startup-notification/tree/NEWS?h=STARTUP_NOTIFICATION_0_12
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/startup-notification/Config.in                 | 1 +
>   package/startup-notification/startup-notification.hash | 2 +-
>   package/startup-notification/startup-notification.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
> index 88d18174bc..606276e484 100644
> --- a/package/startup-notification/Config.in
> +++ b/package/startup-notification/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_STARTUP_NOTIFICATION
>   	bool "startup-notification"
>   	depends on BR2_PACKAGE_XORG7
>   	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_XCB_UTIL
>   	select BR2_PACKAGE_XLIB_LIBX11
>   	help
>   	  Startup-notification is a library used to monitor
> diff --git a/package/startup-notification/startup-notification.hash b/package/startup-notification/startup-notification.hash
> index 474c8bd92c..9c5713213b 100644
> --- a/package/startup-notification/startup-notification.hash
> +++ b/package/startup-notification/startup-notification.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  c2fa09f9a49d8b319e79638e49e967c682df8726006e03059b1ffca5ab82099c  startup-notification-0.9.tar.gz
> +sha256  3c391f7e930c583095045cd2d10eb73a64f085c7fde9d260f2652c7cb3cfbe4a  startup-notification-0.12.tar.gz
>   sha256  29935974beae046f50da806b5f4e54532401dd7bcfbc696a0b645f4cbcce9dbb  COPYING
> diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
> index b3314087f5..4a9e33e5ed 100644
> --- a/package/startup-notification/startup-notification.mk
> +++ b/package/startup-notification/startup-notification.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -STARTUP_NOTIFICATION_VERSION = 0.9
> +STARTUP_NOTIFICATION_VERSION = 0.12
>   STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification/releases
>   STARTUP_NOTIFICATION_INSTALL_STAGING = YES
> -STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
> +STARTUP_NOTIFICATION_DEPENDENCIES = xcb-util xlib_libX11
>   STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
>   STARTUP_NOTIFICATION_CONF_OPTS = --with-x \
>   	--x-includes="$(STAGING_DIR)/usr/include/X11" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
