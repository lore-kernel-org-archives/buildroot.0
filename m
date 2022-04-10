Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD584C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 939AD84061;
	Sun, 10 Apr 2022 15:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CDWCn6Svo7y; Sun, 10 Apr 2022 15:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9F28405B;
	Sun, 10 Apr 2022 15:06:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 328321BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FD13415DF
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAgwEDb2ZCSg for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:06:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D930B415DD
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:06:41 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id k23so26112944ejd.3
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 08:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Gqb+zWN4tXzTrS7wen6O5k4ZXPrS6TqMkukbxV03IO8=;
 b=eJ/Z0k940UfdUUz6WGJNvPEgxbqMdHhDfDSdMc8cM4xq3SG7PeMZE/SSm6cWUWi1Ya
 sjAvJsBwxctqeIHzKBLG7fXs/kHs/bneDKjr5oOHrF/I2Ri5M6M1Vj/SruNn7wWW3aPW
 2WVwkCw4YbV+zsyqMFFP0gcjpCPKUBcdsyJiR1CIWIPAjxq2dG7S5W2pmCI2/xZ8RN5T
 YxAGcFjrYVNiclC98TCud5ceJsOtmf/N8HjwxCCLduhVTpswYDnrNxWTvLeearFggJ5m
 eFDeIAVK4LzbjJHLpF2DKKpjyVVuDjGlPrpRPgXUGbEMafAgKvTUvinQScCEosh7ATdp
 6joQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Gqb+zWN4tXzTrS7wen6O5k4ZXPrS6TqMkukbxV03IO8=;
 b=hjcDQWQIi18lDjIFP6yWKOD1JH26l1WNeGCZiSOiKBd69cVt7r+6O6Qdm8nDt76RZz
 Pl7qaXYKmuHCSh+NtUPJfptSXFSSfMO/ILLyc95b2M87LjkBlVAWSqh4glSKQpZryI9M
 vgofhnLeUHknXno1H7rdMLBlRnLZe2yq6mn78G6hSY2TbzzkFEZBWNCdaJeTE6HM1e69
 q4RGw1CleHiIMIBOCy5M3URVW8ALTYUsf0d5KK8tU8swYqJBMuQbP0FtwQdx3lgIM3zi
 7vHraHDVSNoEvGneEErHgw5Ul5TR6U64kbLd1WVMOMwP7yW9NVNoyjLbsiHP24nLAkvC
 soEQ==
X-Gm-Message-State: AOAM533KpOxQP40Zj6RelSKo7EpFFK86lI1AjaiA8lAl7OJTQ2hdJBqA
 tJeY72SZIDzywWUXsA69iYjm3PHqEX/p8A==
X-Google-Smtp-Source: ABdhPJxonUBKU6jORFkS5myHqkiX884K1J2foRUQGXDoj9JhTkZoaztK1h7q2+hvQcuVY5Qbp2vg+g==
X-Received: by 2002:a17:907:724b:b0:6e8:a44:4691 with SMTP id
 ds11-20020a170907724b00b006e80a444691mr26441641ejc.453.1649603199938; 
 Sun, 10 Apr 2022 08:06:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a508d8b000000b0041d70be78f5sm2229401edh.24.2022.04.10.08.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 08:06:39 -0700 (PDT)
Message-ID: <ef5220bd-0791-e6d2-3a1e-b37e8f4c1882@mind.be>
Date: Sun, 10 Apr 2022 17:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220405135111.827101-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405135111.827101-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.0
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



On 05/04/2022 15:51, Adrian Perez de Castro wrote:
> Update to a new major release which brings in improvements and a few new
> features. Release notes:
> 
>    https://wpewebkit.org/release/wpewebkit-2.36.0.html
> 
> None of the new features need additional dependencies. The build option
> USE_SYSTEMD has been renamed to ENABLE_JOURNALD_LOG, though.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wpewebkit/wpewebkit.hash | 8 ++++----
>   package/wpewebkit/wpewebkit.mk   | 6 +++---
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 231bbc447d..1e1aa62117 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.34.6.tar.xz.sums
> -md5  c9705270b342474cca28cf51632ccbbe  wpewebkit-2.34.6.tar.xz
> -sha1  44ae95de1b5ebf0a2b0ea3630b3677153c597402  wpewebkit-2.34.6.tar.xz
> -sha256  301e895c8ed08ce7dccef3192b972f2ccfc2020463244c64069a636f2b05265f  wpewebkit-2.34.6.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.36.0.tar.xz.sums
> +md5  b7b951cd7f6eb4a8585338505ce71234  wpewebkit-2.36.0.tar.xz
> +sha1  904629a9ce3a4ab67d47315b008dc3152d504205  wpewebkit-2.36.0.tar.xz
> +sha256  096aa9f87d9bfbfc80f558388a86721cdcc508b42ddef10bd270aec9aee96d5a  wpewebkit-2.36.0.tar.xz
>   
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index aa04e78623..3ce38d8c27 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WPEWEBKIT_VERSION = 2.34.6
> +WPEWEBKIT_VERSION = 2.36.0
>   WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>   WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>   WPEWEBKIT_INSTALL_STAGING = YES
> @@ -81,10 +81,10 @@ WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
>   endif
>   
>   ifeq ($(BR2_INIT_SYSTEMD),y)
> -WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=ON
> +WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
>   WPEWEBKIT_DEPENDENCIES += systemd
>   else
> -WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=OFF
> +WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
>   endif
>   
>   # JIT is not supported for MIPS r6, but the WebKit build system does not
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
