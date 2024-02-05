Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3E0C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00FC3417D0;
	Mon,  5 Feb 2024 10:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00FC3417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3XFadTf8-NN; Mon,  5 Feb 2024 10:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA3E41798;
	Mon,  5 Feb 2024 10:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA3E41798
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B254B1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9876B826BB
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9876B826BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcHkhLDHlLBv for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:31:14 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EAF28268F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EAF28268F
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b1d7f736bso2145996f8f.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:31:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707129072; x=1707733872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BZRbIdKnda4zRxCH/uR7TcLFDwJvWbdEHXhn2v39rfc=;
 b=Fp5KH5aRUXr071RPKCSn0d9zMxhqaNA0WTOp4c5NAx9QXnP/S9BChxCG5W7N4DMZvb
 z0qGMyR6LPzRLVDmqkVCgYGdnaKvKAzOAGCCv4Nv4TTRs2lZX7gUD9EkXRMF0rLRjcSh
 FZb2kbFvEyEvqeFUMoKu8fG2b6lh5PXJ6T/5sP4w2g4QJa91NiXoGrk0zOINm5w+h3mB
 RlUVblm1FbPX4IVz4BiPwNYsIbrVK45HxDMcg41hsQVeMVLaP38XtcCIc07rtawjyus8
 pidwhMRIbCBm8kAhv8P9WFjoWFqfeK4rHOIcxtiJgC3J+LXaG/HjZNmx+UVunV7Qx/uU
 oFzA==
X-Gm-Message-State: AOJu0Yx7p2my7bxcx98ZlI2bQJm1Ijc2IKkf43CA4GfPaTePIC38lVlL
 yNf7Rh8H4D7bkGAaFbg5MA8A9kl0e/STNWRD/+Zz2uyOw4CPFpP8AoPDAWFdfBk=
X-Google-Smtp-Source: AGHT+IFnxNQN4dz3YGsRb1UULw+sj5O4yKGPP+fjAR8HdAycnFSPw4UTqZ9ARfnkSzmSeFlgWmHcAQ==
X-Received: by 2002:a5d:64c3:0:b0:33b:3adb:c67d with SMTP id
 f3-20020a5d64c3000000b0033b3adbc67dmr3200661wri.39.1707129072117; 
 Mon, 05 Feb 2024 02:31:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW2piHob6HbfceJXFKn94V4iX9EHO4klJO7Jd7qJfe5B/2LQEC4U8G9KX949Eu3RPyyV1xUo7BDjKXpApl3kZx/wm/3XfhRM67AdHgZb1TxUzJP8MQ39B96fTo=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b0033b3ca3a255sm2185221wro.19.2024.02.05.02.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:31:11 -0800 (PST)
Message-ID: <d0c12395-6819-4ddc-aa86-0d9575361ad4@mind.be>
Date: Mon, 5 Feb 2024 11:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111031649.2684726-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111031649.2684726-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707129072; x=1707733872; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BZRbIdKnda4zRxCH/uR7TcLFDwJvWbdEHXhn2v39rfc=;
 b=bTDzVXgX5/1U6kJuOOezroNY34loFk5Yo2KYxIstDJg16alG7Se9eMW/5P4QxDjqoZ
 HDqCVnxUkv9AeKcFwxPygGn29uvhosIP2/npd1lws5pEfCcFpNq6L9h/0aajiXdsmE25
 OZ7ObAHnBDTHJPTT20SBFejJ+GvtvtR8LOTUe3tm1CTDMcNipQl2fz26D7kWymUS2IDj
 C5XgBJAd4OrTptTsRb3LF8vhtaCzKTNFloYB3TpfbpQ3F46GHE8eehSMX6zWftRC1yjY
 17xK22vg7cvguIZvqrs7xhO7qRKO+jPAkmJyEU8exdA1oKmNbFCUAGT2AL3Jra8UO0Xm
 R+iQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bTDzVXgX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytest: bump to version
 7.4.4
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 04:16, James Hilliard wrote:
> Drop no longer required python-py runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Thank you Marcin for reviewing.

  Regards,
  Arnout

> ---
>   package/python-pytest/Config.in          | 1 -
>   package/python-pytest/python-pytest.hash | 4 ++--
>   package/python-pytest/python-pytest.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
> index c8f9a6eb5b..b42457e67d 100644
> --- a/package/python-pytest/Config.in
> +++ b/package/python-pytest/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_PYTEST
>   	select BR2_PACKAGE_PYTHON_INICONFIG # runtime
>   	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
>   	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
> -	select BR2_PACKAGE_PYTHON_PY # runtime
>   	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
>   	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
>   	help
> diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
> index 7f79b94d8d..e710003535 100644
> --- a/package/python-pytest/python-pytest.hash
> +++ b/package/python-pytest/python-pytest.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pytest/json
> -md5  8620558e8971b11207b2d6b083906cf9  pytest-7.4.2.tar.gz
> -sha256  a766259cfab564a2ad52cb1aae1b881a75c3eb7e34ca3779697c23ed47c47069  pytest-7.4.2.tar.gz
> +md5  e2ac4c70861f26d735b64e5687bb218e  pytest-7.4.4.tar.gz
> +sha256  2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280  pytest-7.4.4.tar.gz
>   # Locally computer sha256
>   sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
> diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
> index 326d951a32..3170a1a9db 100644
> --- a/package/python-pytest/python-pytest.mk
> +++ b/package/python-pytest/python-pytest.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYTEST_VERSION = 7.4.2
> +PYTHON_PYTEST_VERSION = 7.4.4
>   PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
> -PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/e5/d0/18209bb95db8ee693a9a04fe056ab0663c6d6b1baf67dd50819dd9cd4bd7
> +PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/80/1f/9d8e98e4133ffb16c90f3b405c43e38d3abb715bb5d7a63a5a684f7e46a3
>   PYTHON_PYTEST_SETUP_TYPE = setuptools
>   PYTHON_PYTEST_LICENSE = MIT
>   PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
