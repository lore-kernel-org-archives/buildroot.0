Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCB1C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80D6417CB;
	Mon,  5 Feb 2024 10:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E80D6417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xtd2g8t2BG5g; Mon,  5 Feb 2024 10:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF70241802;
	Mon,  5 Feb 2024 10:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF70241802
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B95F1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D923660F51
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D923660F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyPYZrEHTnJZ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:25:51 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFF3060F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF3060F31
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fccd09082so18801355e9.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707128749; x=1707733549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHYqHwdmTRU7hQ2T5HCkRWkooQAufQyyW57l2GBQRvg=;
 b=lKUNFvsQiCVxb1ZRxq5zT9FvGHv/D/sYJ/+d2W8NB3RLxPG7OJaM/0Ezi3+FbhSVgb
 1i9yJumvnuqq/I3Vo3HMbTlJTfrRiTripJi3yHtp0rntHXMdpA74065hLw3l6s4ox/Ts
 RRhK2omEbpF0Rh8mHIQH/dvfFRTqMZk97vRHXsNFTWnXT6cUU6LTpQ1vSBR3BqTrizIr
 emmgfU6O8B/tVO+yZ/w6CrZjcUv9TEvnXkUdfSkpKcVqtrvHFZ1NRHs1QJOU2lp3DCcM
 J1BYzzF5dmgIPiVpaLjGP6/a1VBOpp2XChUwf7VRt7i/rHVOHnMI3p8+JOxzCsJ3Jgif
 6gaw==
X-Gm-Message-State: AOJu0YzLrL27LdTqvRyd5B9r4gJWn4X7R92nmZvVZh7DlNB+b+GvSzur
 IuTySfWpfvOlCjyPs+mv8CWbGkxkUZ7Yswj80drxRqPLVT00PxTIuZzbFDRyMHYYgL1Ll/L3e43
 d
X-Google-Smtp-Source: AGHT+IHOxJ2c6wYWssPVXOAClR9lYR8wErqo9wn11SxRICe+K1+6HHIvG7mved4KPG+mdocXygm5tg==
X-Received: by 2002:a05:600c:474d:b0:40f:dd79:b731 with SMTP id
 w13-20020a05600c474d00b0040fdd79b731mr742282wmo.35.1707128748995; 
 Mon, 05 Feb 2024 02:25:48 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUzxwGH+sVS0ImxykHlMAe9+SNlDhhRuj3gw32D6lGx0ABdLvwGFrUWRRs0oRFHwHud7enHZXCHWf3cVv061OGr/4n2UlIYBQ24bMNtBefi1RgTjNdUQFu2XhmQluqCyrjr0zWhmg==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b0040fb0c90da6sm8099964wmq.14.2024.02.05.02.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:25:48 -0800 (PST)
Message-ID: <55897da4-f07d-4456-b3e5-8f5210e4e5b4@mind.be>
Date: Mon, 5 Feb 2024 11:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111025127.2671669-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111025127.2671669-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707128749; x=1707733549; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHYqHwdmTRU7hQ2T5HCkRWkooQAufQyyW57l2GBQRvg=;
 b=ifw+CZPEqKjhBgRmTuoxVlV8vQmFmmJgVDG1trk24J1c7S5BJ79iyfWmP/A4BcB01z
 5x241Orm5YJjFtXd2YYJQYzpUFr6C3P7VEvt88jpa3ivSn9XLlLocnJPPPc+sBLbHfYr
 DaaFRLybrg87NsqaDwd3szBXjtMhvAEOX6PsOkowaFysZHFmxkjPKuo2vothP8vmf/iS
 plNZmzkwRHpGPVt/gdXZLCwWFhRWqguwsoD5+2N0Jw5juoEgJGJ60kQQ61RgKtLOWa7/
 ZP5KIPPTNB2rMybWhb42JEsBbVyk++9Pv36LreByqJkvu9TxH6ushbCSsJTPO8snxV0E
 IvsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ifw+CZPE
Subject: Re: [Buildroot] [PATCH 1/2] package/python-path: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 03:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/Config.in                    |  1 +
>   package/python-path/Config.in        |  6 ++++++
>   package/python-path/python-path.hash |  5 +++++
>   package/python-path/python-path.mk   | 15 +++++++++++++++
>   4 files changed, 27 insertions(+)
>   create mode 100644 package/python-path/Config.in
>   create mode 100644 package/python-path/python-path.hash
>   create mode 100644 package/python-path/python-path.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5b8b15fa54..5ef72e15e2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1217,6 +1217,7 @@ menu "External python modules"
>   	source "package/python-paramiko/Config.in"
>   	source "package/python-parso/Config.in"
>   	source "package/python-passlib/Config.in"
> +	source "package/python-path/Config.in"
>   	source "package/python-pathpy/Config.in"
>   	source "package/python-pathtools/Config.in"
>   	source "package/python-pathvalidate/Config.in"
> diff --git a/package/python-path/Config.in b/package/python-path/Config.in
> new file mode 100644
> index 0000000000..df1eb81a59
> --- /dev/null
> +++ b/package/python-path/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PATH
> +	bool "python-path"
> +	help
> +	  A module wrapper for os.path.
> +
> +	  https://github.com/jaraco/path

  This is actually python-pathpy, so why create a new package?

  Regards,
  Arnout

> diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
> new file mode 100644
> index 0000000000..73723302f3
> --- /dev/null
> +++ b/package/python-path/python-path.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/path/json
> +md5  e4fe8dac2ad5d6e7ea539bdb26d47329  path-16.9.0.tar.gz
> +sha256  dfd31c2af60e8889a13538bef302ade7adacdb5351836be22638e2349ddd5d7b  path-16.9.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
> new file mode 100644
> index 0000000000..620fc88e53
> --- /dev/null
> +++ b/package/python-path/python-path.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-path
> +#
> +################################################################################
> +
> +PYTHON_PATH_VERSION = 16.9.0
> +PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
> +PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/8d/50/2a1a3287715c87d135dd1dcbd9f7bca4200302cfcc8c28ced1a8035d7894
> +PYTHON_PATH_SETUP_TYPE = setuptools
> +PYTHON_PATH_LICENSE = MIT
> +PYTHON_PATH_LICENSE_FILES = LICENSE
> +PYTHON_PATH_DEPENDENCIES = host-python-setuptools-scm
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
