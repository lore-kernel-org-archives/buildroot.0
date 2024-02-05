Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5333C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FCD341802;
	Mon,  5 Feb 2024 10:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCD341802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMeyXVfnz3_6; Mon,  5 Feb 2024 10:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE08A417EA;
	Mon,  5 Feb 2024 10:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE08A417EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D59921BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEC9D60F72
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC9D60F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ViwBi8X615X for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:33:17 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC87060F51
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC87060F51
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fd6c24812so9225705e9.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707129195; x=1707733995;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/hMcMSLhlVjjhj3n/D9o791jkT/lUSCYgKj6ilBOERY=;
 b=W4FLgeUy37lm7Y1ICW9evY0989HoREjwf974KosAknqae9Vli/MepQiKlHTiNA4ZGn
 vy5HukGNB1GsUGZtgrWlqp2u90/uaiB1HRlcfMwwKVI2OaInKYeec0IaGe8yqGFCKK52
 ywOnyc1oiQy2O1e9s0kx8ezFDfb61o6OxnDakhUUciYQzCsiYq221LdRMVpCLgm9jgyq
 ipjuaDV+NSJj6P7wHKZpalrVSKbKEK2uTd2Mu7R6TrKVgJNMq30OzY7niEBMbZv8/Ol+
 bSRmAE91fsPywyhyWlpMcbSnpKUzqXTzfKMDxw50oTHaI8f5HOCnMgGWlPUZ/l/u/NsP
 y6WA==
X-Gm-Message-State: AOJu0YzY138d9v9KdimMr7S7TnBtykq5VCqnyPl2LXaIpejar7T7GPvx
 6A/f98yt/JeEG1RcLXvAZfnfhXsipgpkOpTyjAaWVyVaC2iYT0z+fylw4YcFrcw=
X-Google-Smtp-Source: AGHT+IESMIP7pzxQun+Svym9N+ibcDzCWkBu9yYFNjmfyAago3wrm0voHFyVWBDiYvRCrVbW3aw1/A==
X-Received: by 2002:a05:600c:4fcb:b0:40f:d14a:624a with SMTP id
 o11-20020a05600c4fcb00b0040fd14a624amr4178332wmq.18.1707129194802; 
 Mon, 05 Feb 2024 02:33:14 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUvi+gmqHuYzPvv7s19fz774hsoVWGUXb89qsF7BSbXYHNGFGt3NKoxMw2O/L3pDz8WNNZ3+sUvDQBskUqitZiaQGcR91qsHw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b0033b3ca3a255sm2185221wro.19.2024.02.05.02.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:33:14 -0800 (PST)
Message-ID: <c50c617e-9781-47d5-9187-0105de78ee19@mind.be>
Date: Mon, 5 Feb 2024 11:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111041150.2704233-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111041150.2704233-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707129195; x=1707733995; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/hMcMSLhlVjjhj3n/D9o791jkT/lUSCYgKj6ilBOERY=;
 b=cWnhK7xqLhC9/2HbV5MY9XBOdk19FvO9wnqtGz9Gh0spsHlWDAWjjNA7LIEdVpwiFu
 6NNJcr4J1aXN3Q0M5T/EBrIJ7OXah95LSsG0BClpBozU6raIpPSOsQXvFTTqb7wVxFH5
 M8wrPVNKPxQgg8gHvwJGDaWy02eRM722pM1N9sCFX9oG1F5z+eEByi+Vrw7nqvG47Yio
 Jpyc0qG6jo5llDZ9ferReb2HoMdJPhdy/YemLeXchhvCnC6N9afYUfaI8u/Lt25qP/Q1
 JSkGW3lYIOb6E2do7E79e32weH2SHWBeT67vEtcalg4Dk9WmfBLyD3Wf7cJkNuXOA6nZ
 NHmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cWnhK7xq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version
 2023.3.post1
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



On 11/01/2024 05:11, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pytz/python-pytz.hash | 4 ++--
>   package/python-pytz/python-pytz.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
> index 861f9d6f35..be6f0e976b 100644
> --- a/package/python-pytz/python-pytz.hash
> +++ b/package/python-pytz/python-pytz.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pytz/json
> -md5  fe54c8f8a1544b4e78b523b264ab071b  pytz-2023.3.tar.gz
> -sha256  1d8ce29db189191fb55338ee6d0387d82ab59f3d00eac103412d64e0ebd0c588  pytz-2023.3.tar.gz
> +md5  84e6569fcc917b096cca1063819c4ab0  pytz-2023.3.post1.tar.gz
> +sha256  7b4fddbeb94a1eba4b557da24f19fdf9db575192544270a9101d8509f9f43d7b  pytz-2023.3.post1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
> diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
> index 4754efe41a..182d8156fc 100644
> --- a/package/python-pytz/python-pytz.mk
> +++ b/package/python-pytz/python-pytz.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYTZ_VERSION = 2023.3
> +PYTHON_PYTZ_VERSION = 2023.3.post1
>   PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
> -PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/5e/32/12032aa8c673ee16707a9b6cdda2b09c0089131f35af55d443b6a9c69c1d
> +PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/69/4f/7bf883f12ad496ecc9514cd9e267b29a68b3e9629661a2bbc24f80eff168
>   PYTHON_PYTZ_SETUP_TYPE = setuptools
>   PYTHON_PYTZ_LICENSE = MIT
>   PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
