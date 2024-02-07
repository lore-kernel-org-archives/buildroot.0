Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5821EC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23B3382726;
	Wed,  7 Feb 2024 16:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnCirfBKGGAx; Wed,  7 Feb 2024 16:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C3E383C1A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C3E383C1A;
	Wed,  7 Feb 2024 16:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9C431BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0F9283C32
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0DPJakXpC2a for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80D7683C12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D7683C12
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80D7683C12
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:38:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33b0f36b808so658489f8f.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707323906; x=1707928706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OKBP0mR3EQEF3oR+a6dpICDE2vmSWxkF0nYIWAxZK10=;
 b=TwPeBdwC2YaqRuHb5/ZjINK5JFwNthhqoFDxF01h7N08E3YBH/yKd7Wtbg8UkSsRIw
 G3cEdNXO5UokFddwhp3ZOmi5NyfDUSpEAJphrMefu/wUSyHNkDoQq7JVWx3/d52ahY34
 DUUg10fKK8b9dJntm9NrrsS5zMl0zJaRBGBURC/NzdrxeAET1qeakrJgmJa4zR3rNRbP
 rHMnc9lO7LDyLYop+PF2CpXt5Ak587dan4JDpqzBFEJ+NOMqvNGapZfza/k5Tp7RpUUs
 60+/o4I0Ey3mFmsAqDkWppD5QoyD0EfZuParzMSKyI93SO1Xdbf+sNAq5JA8DmCtwnv4
 K4TA==
X-Gm-Message-State: AOJu0YxKIC1RKUp2kaMxdUK8gTNiQ4tg5YOzFQfevZr5kuY3A+Hi7AA4
 rHRmAIEde2CCZNSBPBOiD2j3wWOT+mon6oIzcVuPc9EO/s5L1ohRXH1KP5aEKuU=
X-Google-Smtp-Source: AGHT+IF/wJX2bZQ2YwAPlTjyxe3u2ShtPZZjKcTkuKgpsOnHxyQdqxM4zYx8gJVLYf305sPZJWzX+A==
X-Received: by 2002:a05:6000:1372:b0:33b:44d0:63ea with SMTP id
 q18-20020a056000137200b0033b44d063eamr3986378wrz.59.1707323906213; 
 Wed, 07 Feb 2024 08:38:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXcx5mt5f2yTRe6Ni8VjlKaB5Qq+B1jCzRIG2lHW3GN5+8QOXCOT7M7VXR+mujb7e01x4pdASe9u6cxi8S8roRRV2dR+onzKw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n15-20020adff08f000000b0033b1c321070sm1855608wro.31.2024.02.07.08.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:38:25 -0800 (PST)
Message-ID: <01de635a-74e6-4784-9b1a-d5b357a41603@mind.be>
Date: Wed, 7 Feb 2024 17:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111064140.3051598-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111064140.3051598-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707323906; x=1707928706; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OKBP0mR3EQEF3oR+a6dpICDE2vmSWxkF0nYIWAxZK10=;
 b=NqmGDrRlnQOXhDVMwhi74DZ86gJyk2lsLVaIpXWcIDOPPvMQG6Ze4Khp292UuWshc+
 3gVkxw7FyJSUt+IM9iX4l2feEaSVHmbFVd8LfTNZuOBiWUTSHcxGxpDb4RuvcCBOTlK+
 AC25SaIQBzZPS3zm1ztPQycSkyT1t/TToSrXe6y+ZbGdmnrqNqybaQGbbvegjU0b1GaP
 0cN45fuwCP1MaFc7U1xxJDP3b6qfRVCalfbx1P5q+z3IbUkF0T5ZnC5+M0ORusXFF6L9
 jTtGo2KCNEyaKmXeIYsu0bU0Kcvnpd0NC+V/HquFmlCSOo9ms9hberyfOrZ47HzQqvY7
 VD/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NqmGDrRl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 69.0.3
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



On 11/01/2024 07:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools/python-setuptools.hash | 7 ++++---
>   package/python-setuptools/python-setuptools.mk   | 4 ++--
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index 6e1df42e3f..7f13ac3896 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,4 +1,5 @@
> -# From https://pypi.org/pypi/setuptools/json
> -md5  d967ca2ba7f46db887daee2d5c9bd6a2  setuptools-68.2.2.tar.gz
> -sha256  4ac1475276d2f1c48684874089fefcd83bd7162ddaafb81fac866ba0db282a87  setuptools-68.2.2.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/setuptools/json
> +md5  b82de45aaa6b9bb911226660212ebb83  setuptools-69.0.3.tar.gz
> +sha256  be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78  setuptools-69.0.3.tar.gz
> +# Locally computed sha256 checksums
>   sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index f26f427ccc..0aea3c6cfa 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_VERSION = 68.2.2
> +PYTHON_SETUPTOOLS_VERSION = 69.0.3
>   PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/cc/93f7213b2ab5ed383f98ce8020e632ef256b406b8569606c3f160ed8e1c9
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/c9/b146ca195403e0182a374e0ea4dbc69136bad3cd55bc293df496d625d0f7
>   PYTHON_SETUPTOOLS_LICENSE = MIT
>   PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>   PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
