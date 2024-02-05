Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1E9C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E437D40AEE;
	Mon,  5 Feb 2024 11:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E437D40AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1jBuDuWWUI0; Mon,  5 Feb 2024 11:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE8FA40B12;
	Mon,  5 Feb 2024 11:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE8FA40B12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE0D21BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 940AD4174A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 940AD4174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9PHwT6C3iOU for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:29:03 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C73C41742
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C73C41742
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fc654a718so25133505e9.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 03:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707132541; x=1707737341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pLHH6wvrFMh697MJaQnMRQO44aBvEhCv4lcby4nOHoE=;
 b=ezg+x2pZy71mRNqcPH3ClHnwuDgdNGsdZRdFYyY55maWaBnq0+Yn18nGwQR0LJzZKp
 dP6hREyjUo/Mf/ppx5REjDom5+7mg3se5KVPfD66IkKpVM4lp1tpOym3LdUyOtVfxYgN
 ghI6AmiJqNXGercDx8DsDSSP4oJSB36zGZvdMmy4D8+Boni2OadZfSLhVFfyOe9ownIp
 HEXITaIk8sR0+aIkdAVyKYgcFP4doeGx8+ZlYlWFHApOWhzNxxxuKR0TjB71BRMdpyG/
 MILO7fWFqNGoJaNtFho1lugU2+mkb4nWQIuUTXz/OPoQela5QCO32idlYcaUT2VNZBJF
 LCuw==
X-Gm-Message-State: AOJu0Yw5lD+zQQEu8GtQP0ctjmLAJ6bxK1QbgRxw2GQCaO9fy1Wmnhul
 xhrRyHMoJlH4kpVGefyyyeR5PjXnuLF2eF7Zlax+8inYGuKXBGyc0WiJeqpkDiG+0UzgY7+MXOI
 S
X-Google-Smtp-Source: AGHT+IHJqh9Y/Zrwr1aLoFquSk9WhxAUO3K1oZB/OlDFLHTACKK04Fewz0LuT3BySQiW6FYjGWWKHg==
X-Received: by 2002:a05:600c:4f44:b0:40e:d30d:3fe2 with SMTP id
 m4-20020a05600c4f4400b0040ed30d3fe2mr4840208wmq.5.1707132541380; 
 Mon, 05 Feb 2024 03:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUkvtVjCY+o0npoTq9D1CiXVjpEu2HsfKCzKYpRFlhqMPc5jETxnlnKdBBszh/HCZ6JLiWGstWH8rOuPMPMtC62q6F++Y0LEw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0040fbba734f3sm8284389wmb.34.2024.02.05.03.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 03:29:00 -0800 (PST)
Message-ID: <687fa6af-4d6f-4890-bd3a-c420ede9cdfd@mind.be>
Date: Mon, 5 Feb 2024 12:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111052225.2922249-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111052225.2922249-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707132541; x=1707737341; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pLHH6wvrFMh697MJaQnMRQO44aBvEhCv4lcby4nOHoE=;
 b=a8l6YiOAsQbGa3/sNyaZ01pBbMvqg9OAIxJjrO0LTlp6+th8OZnQ9CtgK0N0cLiNGr
 nkIRX9qdl3H8mLgL2YbTcaD7pZpQWPs+tmFNI0tVV0I+WwMgcnzmD6ypI5dqoGTwyBmC
 VERVisKTR6LB6vvNraenhiKKQmhvK2ifgfJgYblehP1Q7VTw12r6EpQbNR5REeE5JDBZ
 Y0u3J5gIWFEt2YRWKVb58PtQo6mH0G/ywuEnya8nB7tEC1S7Dm71afYEZcBbSjJUerYq
 pCbrK6KrN/G68qgY61rEYcxcqim/Z8JsEU0UdhWdLfqrcGeKIWsAFfHohaIS7dKfprBO
 BjHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a8l6YiOA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rtoml: bump to version
 0.10.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 06:22, James Hilliard wrote:
> Migrate from setuptools-rust to maturin infrastructure.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-rtoml/python-rtoml.hash | 2 +-
>   package/python-rtoml/python-rtoml.mk   | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
> index 04d22ed1a4..59f17d9d62 100644
> --- a/package/python-rtoml/python-rtoml.hash
> +++ b/package/python-rtoml/python-rtoml.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  821a430ab6587bdaaf7cb95044e8e0d99c77c6aed0adce5a370045b270f7ee20  rtoml-0.8.0.tar.gz
> +sha256  987d3d9e9d56761b17c3e4e172937cbcc793bf24b0ebb2730647a9a2cf86c789  rtoml-0.10.0.tar.gz

  Same problem:

ERROR: while checking hashes from package/python-rtoml//python-rtoml.hash
ERROR: rtoml-0.10.0.tar.gz has wrong sha256 hash:
ERROR: expected: 987d3d9e9d56761b17c3e4e172937cbcc793bf24b0ebb2730647a9a2cf86c789
ERROR: got     : 624cc1ff2b3fdea42aeee3a4d1537d37431ec001870dfee1e04a12bd3076a2d3


  Regards,
  Arnout

>   # Locally computed sha256 checksums
>   sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
> diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
> index 819dcf3288..16f9dea573 100644
> --- a/package/python-rtoml/python-rtoml.mk
> +++ b/package/python-rtoml/python-rtoml.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_RTOML_VERSION = 0.8.0
> +PYTHON_RTOML_VERSION = 0.10.0
>   PYTHON_RTOML_SOURCE = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
> -PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/33/a6/b42d8e0e28bec9fd7fdbafb2d76db3f8578f151a669eba564d422756d909
> -PYTHON_RTOML_SETUP_TYPE = setuptools-rust
> +PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/ca/b2/0e77a00e75ed582ec1c4c3a9e1eeed886a15c195bcce87b7daf1171c4115
> +PYTHON_RTOML_SETUP_TYPE = maturin
>   PYTHON_RTOML_LICENSE = MIT
>   PYTHON_RTOML_LICENSE_FILES = LICENSE
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
