Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D547AC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FCEE40ADD;
	Mon,  5 Feb 2024 11:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FCEE40ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDOuz-RHh3uw; Mon,  5 Feb 2024 11:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9678A41466;
	Mon,  5 Feb 2024 11:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9678A41466
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44F671BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D5D441889
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D5D441889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1am_OrClGPp for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:05:35 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 027394175E
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 027394175E
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fd6c24812so9483015e9.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 03:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707131133; x=1707735933;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YZUJazBfhjtql981GLKQAYUZ05ErlYHRSYt4ffkhqlA=;
 b=oztLGW8om/8XggDeRFDn4OV2Q3msLn6MVEGPC+nWdoD8VxXuGCx7kzkwW/PT1P7RY5
 EnMQpPHUGE0VWvK6lqISKxbBWc+7akjyRGyxashPxP0oeIpcdZQuCL60gkbqINJB87GB
 3jVP0GmcJof+7dzWO/XHbTiEGWA3XhbWtD8TSqwZHg+nS4b90tq6oRuUHfyFDvo+sG/i
 LF7J8/fu9EXd1ImXwFSz7rLQYkiRT7UHJlff3JWAj0KU846vn7ACM+srtijLGtN4Z4ft
 K7iV4e7tGduJ6ao70t2UMvO58OP3eylWXiB/GHFYdGhq4K7Ts1zwm/vpSHd/hOhrSjH7
 +Zjg==
X-Gm-Message-State: AOJu0YyDkEV1BF5GYwvhdIAs6mP+Wii1tfXpTGT3lLIapMReUB5vKjjq
 U/+ePK1HMpulTv+ZOWHq8+cLE7XkzgezTOuDLgNeF0ToydRDgafuEcnQNvJ5MWE=
X-Google-Smtp-Source: AGHT+IGPPkNTxvysLukdZQZ7S4xVa/vcaCqXI5s/SPZmwNeeWIlVRjmlciVrbZjVr5HJSQgZV5uV4w==
X-Received: by 2002:a05:600c:3b8f:b0:40f:d301:fa81 with SMTP id
 n15-20020a05600c3b8f00b0040fd301fa81mr4491793wms.20.1707131132870; 
 Mon, 05 Feb 2024 03:05:32 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUcY09UvXjh7UMyn8a+eYTbY76ZV0HrKM6WBcvVM2oK6wZG7hDlHEi6xqR7JNGFKn4VIffIOK95XEI+uZz2/dMlakBU78OmEB36YtmAU/YG2SOW6rqjkBabBfrPJeoyjAU=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 w12-20020adfec4c000000b0033b17e18df8sm7839421wrn.12.2024.02.05.03.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 03:05:32 -0800 (PST)
Message-ID: <f2a019a9-60f5-45eb-be00-e6922a28106a@mind.be>
Date: Mon, 5 Feb 2024 12:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111051726.2918732-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111051726.2918732-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707131133; x=1707735933; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YZUJazBfhjtql981GLKQAYUZ05ErlYHRSYt4ffkhqlA=;
 b=D+U0SuDD5tjsBEKJbXJ6jv1UugQqcJO4oKCt651VBlKvAE9HUeErE/bZJ3TqBgKm87
 bSdNPwbEi4CJqVRfIP7kmarlo62wyjfyg9Lahc/GsfOeap/zFAoB8oFw9ravgH6cik60
 mqjm2vaBUwEggBG9lHtl0gr9UC4BNM9ltuD9svv9N94mSypeTcybDTenP87mrPHjSr/M
 8MjRQbX5hs+p8mIaeBLUZeMXGxJWSPlD6p/1SYAQqTtx+prFxIMH5uyYII15L0k+RVjK
 Gi1ttOp9XirOPCze7oQaqFK6BwC0eClqyelbZwLMVOIAhoBNiim7jAgF8bN0ESaEKLvC
 GkGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D+U0SuDD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.16.2
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 06:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-rpds-py/python-rpds-py.hash | 2 +-
>   package/python-rpds-py/python-rpds-py.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
> index b04aa210d3..8c4b6181d0 100644
> --- a/package/python-rpds-py/python-rpds-py.hash
> +++ b/package/python-rpds-py/python-rpds-py.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
> +sha256  861b1fa8c37819b2e2cebbde6dea66ac2fa1247e4a7c3933dbf4c89244d7fecb  rpds_py-0.16.2.tar.gz

ERROR: while checking hashes from package/python-rpds-py//python-rpds-py.hash
ERROR: rpds_py-0.16.2.tar.gz has wrong sha256 hash:
ERROR: expected: 861b1fa8c37819b2e2cebbde6dea66ac2fa1247e4a7c3933dbf4c89244d7fecb
ERROR: got     : bc62a37913de53569414f6eb4a16a005b1dd04afb473c3c27561b11614f92034
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

  This might be the gitattributes issue that Yann has a patch series for. I'm 
marking this patch as Changes Requested, you can try to re-submit after Yann's 
series is merged.

  Regards,
  Arnout

>   # Locally computed sha256 checksums
>   sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
> diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
> index 6f71d02047..5f0d30d002 100644
> --- a/package/python-rpds-py/python-rpds-py.mk
> +++ b/package/python-rpds-py/python-rpds-py.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_RPDS_PY_VERSION = 0.12.0
> +PYTHON_RPDS_PY_VERSION = 0.16.2
>   PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
> -PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
> +PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/c2/63/94a1e9406b34888bdf8506e91d654f1cd84365a5edafa5f8ff0c97d4d9e1
>   PYTHON_RPDS_PY_SETUP_TYPE = maturin
>   PYTHON_RPDS_PY_LICENSE = MIT
>   PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
