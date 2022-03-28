Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E80C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB72B415AE;
	Mon, 28 Mar 2022 19:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEYpCRfblsr0; Mon, 28 Mar 2022 19:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE162415A7;
	Mon, 28 Mar 2022 19:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 573AB1BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44615415A7
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwleZnpRO-RO for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:57:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5974C4017F
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:57:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y10so18193386edv.7
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vWw1iK7Lp3X7wx7yl7AxaJA6O5BrwG2+rcXfPMU6OdI=;
 b=YVQqHc01mhTrWM4ZGxttyldyBQt1YaLv27bspSdXVfXHd0nIj8jkZyWJYfZj2lrpdV
 2G6Ajvva3zZxGw07h6t0cf82KYZ7t/GSDBfpJznvJ80bCbXsrtMTsEtldigKDyBI1Wac
 aVdlDU/OyBjG2kkgqXMHYMAcBwTrHBgxO+KZTdYmPSanIt2jMS0st3OYwLTQsiWB+tpX
 h69GcRDPIvyWriK7Mko/N0w8KNRLJUK4F7WeJIZ3NkOpO5LSkF4Efn9ynicR7gJI7wss
 an4B8jeNy5hbkfEFLGBZ6+uLVrUfFKIQi4ywdW9LDVaW8+B0SMiP0FgWF+k9fda+95kT
 JiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vWw1iK7Lp3X7wx7yl7AxaJA6O5BrwG2+rcXfPMU6OdI=;
 b=wAulmE5Gu/SpQfpDBQwlPRSLFWTINR7RwSaHbXo6ZmCaA7DV6onsSVOWvX8srSRRgU
 m6Owegsuy9HJ6T1LBCOVXS/GLcjtJGxa5FFqz70cNLCWZuEIKnGblBkGJ58tVES1PMcI
 rdWii4CopqSMj6pSrnUhooRV6yRNAr4dCGCmL+73SS0/7kf+As3fIQav+ESxWS62IHbM
 KFBJ4jBr2ZTrRh7cgGQFl2o7U87LKsXbybfLISR/nGkXQ823EwJjTPUhOQwGeYjIqc/L
 ZSHhEVPy2bNq29lRDSX2jqKNAPu5i31JWEcds7vd1/iWcPZHNNb7Hg72sT7b+aqDoZMW
 1yYg==
X-Gm-Message-State: AOAM532aJCb8oXLlTkx2GrtfPMD7fT+9IYxw6O2KRjM9zSjNpQ19XUhx
 32FDgVv9h5vLl/JotbGpF53m3JgceCwVNw==
X-Google-Smtp-Source: ABdhPJwR0+kTDBnTuQ2KgFECKQvb1e54oamtX6ZvuGXd5/PCkTsfmH7iA6p1ch9IrLek1a5Q+t5JLQ==
X-Received: by 2002:aa7:cb8b:0:b0:410:9aaf:2974 with SMTP id
 r11-20020aa7cb8b000000b004109aaf2974mr18334533edt.173.1648497460583; 
 Mon, 28 Mar 2022 12:57:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfd7dee980sm6263418ejc.30.2022.03.28.12.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:57:39 -0700 (PDT)
Message-ID: <f6cf3b9a-8610-9d7a-2cdd-4d60adaac810@mind.be>
Date: Mon, 28 Mar 2022 21:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220327192613.1239929-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327192613.1239929-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/jack1: bump to version 0.126
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



On 27/03/2022 21:26, Fabrice Fontaine wrote:
> - Switch site to get latest release
> - libsndfile and readline are not a dependency since removal of
>    example-clients and tools with
>    https://github.com/jackaudio/jack1/commit/ca3af4b0d8a8a8fd6c4ae72c24e4df6e18f83af9
> - Update indentation in hash file (two spaces)
> 
> https://jackaudio.org/news/2022/01/15/jack1-v01260-and-jack2-v1920-releases.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/jack1/jack1.hash |  8 ++++----
>   package/jack1/jack1.mk   | 14 +++-----------
>   2 files changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/package/jack1/jack1.hash b/package/jack1/jack1.hash
> index d7787ac2ad..d82b9daffd 100644
> --- a/package/jack1/jack1.hash
> +++ b/package/jack1/jack1.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256 3517b5bff82139a76b2b66fe2fd9a3b34b6e594c184f95a988524c575b11d444  jack-audio-connection-kit-0.125.0.tar.gz
> -sha256 661fe53a7e3fce790b185e35c60b7ed80d7efdf25fd7df5af6814a9a215a538f  COPYING
> -sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
> -sha256 ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING.LGPL
> +sha256  7b290e9dc7b9262ac328d41eef80c1053c97013efacbefa30477cb9b2a5445ea  jack1-0.126.0.tar.gz
> +sha256  661fe53a7e3fce790b185e35c60b7ed80d7efdf25fd7df5af6814a9a215a538f  COPYING
> +sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
> +sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING.LGPL
> diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
> index 6dca56001f..4e16d7e96e 100644
> --- a/package/jack1/jack1.mk
> +++ b/package/jack1/jack1.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -JACK1_VERSION = 0.125.0
> -JACK1_SOURCE = jack-audio-connection-kit-$(JACK1_VERSION).tar.gz
> -JACK1_SITE = http://jackaudio.org/downloads
> +JACK1_VERSION = 0.126.0
> +JACK1_SITE = \
> +	https://github.com/jackaudio/jack1/releases/download/$(JACK1_VERSION)
>   JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
>   JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
>   JACK1_INSTALL_STAGING = YES
> @@ -17,14 +17,6 @@ ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
>   JACK1_DEPENDENCIES += libsamplerate
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
> -JACK1_DEPENDENCIES += libsndfile
> -endif
> -
> -ifeq ($(BR2_PACKAGE_READLINE),y)
> -JACK1_DEPENDENCIES += readline
> -endif
> -
>   JACK1_CONF_OPTS = --without-html-dir --disable-oss
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
