Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E69AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A988D4048B;
	Thu,  3 Feb 2022 20:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8CpirADRoecH; Thu,  3 Feb 2022 20:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6B7040133;
	Thu,  3 Feb 2022 20:39:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41E351BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 308DC60A72
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqOY8maAHu0g for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:39:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B81060A6F
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:39:55 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id me13so12395674ejb.12
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0y5CYl9egGjPklCw0UgztG8rUvB2D58RJlA8+5Lr49w=;
 b=EF8XBvMDhhJczHJxjT6Sl4/V//BAKQmqCwper5/Tj+yuQuTKEO33R7t43BQKEVuZ7f
 ZIfVabbAqMyJJlUcBAkfsk4+0VVozWX5xTXKEttXpbwq5LpvxYC1awrYhXKrN5pk5+bm
 LHzTSGIUlHc4xN0YuZ9gjlIHcxLukzB7JiQdW9D0p4qmGl51H0F0SNePS6o8ssMlL6GH
 6xyS27iqQLVKcCtdttxmFylroh/7fSh746gB6kdqerBeRWUQAJ8GYTGszBmsfIMZ9Wp8
 Rg6e13UofJ3yFKwJATpT488afMnesNC6qG19KTCu8Ct/PmK0xK4R2iwOQ57/PYyuYQ3a
 3JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0y5CYl9egGjPklCw0UgztG8rUvB2D58RJlA8+5Lr49w=;
 b=LC1EIaEK9Bbs9TZFeO/6lh8xmcL93zSkQcNppHwVltcfLLRULbkQBTJFLT3iChVuR8
 abFt0BF3p7bdndD0ZfTpk0QgkAvvcao/5VegtbgI2ZClGu1KdQ1cOEUw6VfOoK0zB6kZ
 bp98zqt3Ga62N9NNW5gQuPDqh3NSxm/81V92JcUHbzUNe8PTvoChjjNyL0N3eZ9vGs50
 vZeB03HCxlwlUvtb3FrPd9aupwRiaNcynVFh+wU8LXGaFDQF7gw+UBjclYhwT2sfFObD
 JMcD+ApLt8+fHFfrFgaCPCIz+JIZZcMNmid9DTF3dpQL59BHclqLhHIUzL7wLwO6lj95
 oR6A==
X-Gm-Message-State: AOAM532OKkhLSRAUr+AqlGlXboPRUWt82+mA4pWUxvhQr5vOi6mQRtCM
 gNbGxNq9BGJoRKGKxYxvl31DXg==
X-Google-Smtp-Source: ABdhPJyUFJ2LyLF4RknIIc8OlfHCLlX74z4lbQDPItWpfy+ufYiC7bwJVKgUpjd/Y9rux7mDsRgcJQ==
X-Received: by 2002:a17:907:d13:: with SMTP id
 gn19mr30245372ejc.252.1643920794267; 
 Thu, 03 Feb 2022 12:39:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w25sm22795824edv.68.2022.02.03.12.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 12:39:53 -0800 (PST)
Message-ID: <56d88177-6e09-dba3-6b27-2119cd55db52@mind.be>
Date: Thu, 3 Feb 2022 21:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220113233758.110264-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220113233758.110264-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/kf5/kf5-extra-cmake-modules: do
 not build documentation
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
Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/01/2022 00:37, Adrian Perez de Castro wrote:
> Pass needed CMake options to disable generating documentations. The
> documentation is built using python-sphinx, which is not packaged in
> Buildroot.
> 
> Prior to this change, if the build host would have a Python installation
> with the sphinx module installed the automatic detection tried to build
> documentation, which would fail in cases where the sphinxcontrib-qthelp
> package is missing from the host Python installation. The error message
> in this case was:
> 
>    Extension error:
>    Could not import extension ecm (exception: cannot import name
>      'htmlescape' from 'sphinx.util.pycompat'
>      (/usr/lib/python3.10/site-packages/sphinx/util/pycompat.py))
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to master, thanks.

  (AFAICS the v2 was in fact identical)

  Regards,
  Arnout

> ---
>   .../kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk   | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
> index 3c4281b960..ba2748456e 100644
> --- a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
> +++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
> @@ -14,4 +14,9 @@ KF5_EXTRA_CMAKE_MODULES_DEPENDENCIES = host-pkgconf
>   KF5_EXTRA_CMAKE_MODULES_INSTALL_STAGING = YES
>   KF5_EXTRA_CMAKE_MODULES_INSTALL_TARGET = NO
>   
> +KF5_EXTRA_CMAKE_MODULES_CONF_OPTS += \
> +	-DBUILD_HTML_DOCS=OFF \
> +	-DBUILD_MAN_DOCS=OFF \
> +	-DBUILD_QTHELP_DOCS=OFF
> +
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
