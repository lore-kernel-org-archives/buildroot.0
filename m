Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5128C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73B8040108;
	Mon,  5 Feb 2024 10:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73B8040108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_9ooYuO2TjJ; Mon,  5 Feb 2024 10:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 369D640168;
	Mon,  5 Feb 2024 10:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 369D640168
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3111BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 836E140168
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 836E140168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qT_ZJQkvTQN4 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:53:25 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E57140108
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E57140108
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fc65783aeso26069605e9.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130403; x=1707735203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YD+0WOvEKT9Agn0oiu08cmcdAiZGNsdOPcOxaJxcTPs=;
 b=R8rVRACZPupotg1dmEXXVZktfEV4Otdhvnx9A7NVzxDyqVqvnZ3ZOdbBNbnEwByiL/
 SnAUH44mub3dqLTS5CxEmNoXuFrx9rot5jVHe4MYr/XHtCmakyJmssj3TpL1XhcbHRbF
 HEFexPTYvbWz+IOLxoKRQXejzCMKnH1YBA8TlvQncMnW61bWu3RW8dDP+/9XyaU6cOJr
 +CUFwG810tML1J7wA6FKyaslQ3ULyAu4vNDmROni1fSEB2vFVARRM9QcBtfXMIaRlaCn
 WBnPgpESdFT3x9i99Sy03YDf+BPxfhrHLWBYeiIM9TVwMMqLE879BhLp4FWnqHECruUe
 mOXQ==
X-Gm-Message-State: AOJu0Yxrm5Q1f00y/Lk9DqERjBKlfF8G9ijlGZZvJy67PGCik4mW27O3
 G+Bf14X/GFBuzbZe8vhVNOf/KwPS4CH0foqx8CFSTQy4HABs+qo1Pj3gGlo6irU=
X-Google-Smtp-Source: AGHT+IEMRS0TobrVDngkBwZIJLiTCEtVAaPFLSJYzmiZL9uLiMpi6FC8xXFwORDFVFov/RUE5sD2jg==
X-Received: by 2002:a05:600c:1d23:b0:40e:b29c:7103 with SMTP id
 l35-20020a05600c1d2300b0040eb29c7103mr4624800wms.8.1707130403239; 
 Mon, 05 Feb 2024 02:53:23 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXWyzmeQm6PcShyaQ7Abl+WwVuR4agOm5vMM6lwDkNCbCWI5xvStf38KT5aFMSnPB6yhJeM2dczdtaR6eXTUQX/9LPerUB0tA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8101947wmb.26.2024.02.05.02.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:53:22 -0800 (PST)
Message-ID: <f1a6c111-4e3c-4ba6-bdec-486cdec2affd@mind.be>
Date: Mon, 5 Feb 2024 11:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111051107.2905870-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111051107.2905870-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130403; x=1707735203; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YD+0WOvEKT9Agn0oiu08cmcdAiZGNsdOPcOxaJxcTPs=;
 b=GxLE3ESj5XsqIdPgKvjgsQuTyDmUe+p/fWpLiFWpFRyKLNresLeYz4vE2cuzjn2XP9
 jYBri10pe0Kjs4MAWG6dh58UzOPpJMe9L2hWVhLYTL+US+byhssbz29BdPb8YJR8LMZm
 IXR1cM+0RQsCRYiXOXgSA1qTFRpT3jjABG36CZacbxTRiLgApaXfnOIp8i7yMBvKfNTM
 H9L7GwDj7emLi27CX9cIzhcwaSUxbx8hMOm+xvWLuvce2zvP6x1WY6Mej1n7xDNRNiz2
 fr4uJh6Jxw6hUOfc9efSFbCpAf2AVe1++Xr4MfRR54+OwVlbLGBPpd3JAE0WGSLeUV0r
 QndQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GxLE3ESj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-requests-toolbelt: bump
 to version 1.0.0
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



On 11/01/2024 06:11, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-requests-toolbelt/Config.in                    | 2 +-
>   .../python-requests-toolbelt/python-requests-toolbelt.hash    | 4 ++--
>   package/python-requests-toolbelt/python-requests-toolbelt.mk  | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-requests-toolbelt/Config.in b/package/python-requests-toolbelt/Config.in
> index ba2b95152e..7d5b4b65c2 100644
> --- a/package/python-requests-toolbelt/Config.in
> +++ b/package/python-requests-toolbelt/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT
>   	help
>   	  A utility belt for advanced users of python-requests.
>   
> -	  https://toolbelt.readthedocs.org
> +	  https://toolbelt.readthedocs.io/
> diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
> index 28abf2c628..12bc58131d 100644
> --- a/package/python-requests-toolbelt/python-requests-toolbelt.hash
> +++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/requests-toolbelt/json
> -md5  636d226d03632d013269aebbc85f4f4b  requests-toolbelt-0.10.1.tar.gz
> -sha256  62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d  requests-toolbelt-0.10.1.tar.gz
> +md5  6a8348cfc9991b44e499345db1c6f925  requests-toolbelt-1.0.0.tar.gz
> +sha256  7681a0a3d047012b5bdc0ee37d7f8f07ebe76ab08caeccfc3921ce23c88d5bc6  requests-toolbelt-1.0.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  1f8cf8bdacd98ed6d36d0fec0c07f7765acebd6e81205962ab5146023b3c858d  LICENSE
> diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
> index 8c141e3aa9..d0bcb1bb21 100644
> --- a/package/python-requests-toolbelt/python-requests-toolbelt.mk
> +++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_REQUESTS_TOOLBELT_VERSION = 0.10.1
> +PYTHON_REQUESTS_TOOLBELT_VERSION = 1.0.0
>   PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
> -PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/0c/4c/07f01c6ac44f7784fa399137fbc8d0cdc1b5d35304e8c0f278ad82105b58
> +PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/f3/61/d7545dafb7ac2230c70d38d31cbfe4cc64f7144dc41f6e4e4b78ecd9f5bb
>   PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
>   PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
>   PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
