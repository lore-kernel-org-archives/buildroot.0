Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDAEC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E6F4177D;
	Mon,  5 Feb 2024 10:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E6F4177D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rL3VvznJ9cKW; Mon,  5 Feb 2024 10:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDFF941749;
	Mon,  5 Feb 2024 10:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDFF941749
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66FBC1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F05741749
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F05741749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XUIsZc-Tg7A for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:13:20 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19EF24152D
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19EF24152D
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5114cd44fdbso1674468e87.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707127998; x=1707732798;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwPdvx7I8X5Pbmg/8qMy1iCQo85fEabD/1dl/SCerdg=;
 b=AMwImebcXSjj3w62q/DBd+iNLSzDsuRwIR3bhw5OVhscHI0ePda95ygd6Wj7BeQEdt
 tel9xlS0KxsBpJBBU0wHwIWEE6bdEOpqqiSAXSjC/H7t3QVAUw6MEPyG52BPLiux6udN
 j00i71mHOWAR28rnCGTne0It+N5GmsKBRSGxfP1UDVqueWAG0ZYObszmn43RkPmpYQ4b
 9cS8EWIIFEeEMiABizrTjKhMmY0JPcrwED4L/kUeq30sAiPtAra8YrThb0UOS48XcrW3
 +5GLNBGkX3hgbldQtTlQHj070dbW2IhGXJaUEdwJffe4xXC9EpPqfJbxcErms0NDGEW3
 1o8w==
X-Gm-Message-State: AOJu0YwnwYpKufeN97UhyIgXLeK17qrZZ8CTOwkGKUEKlyAQmNWxuZ/e
 crk6hmGnd0/c98gLAK6pmCmelrkcjfxMKKF5U+lLqvrz0Gr1hZnD4DK4tLVqBXY=
X-Google-Smtp-Source: AGHT+IFcEGzBLjTst2/s2Da605aKfwv8umglUfwe8+4bLAjYEOTcQh/HoY4LYpwoN9Dlxx4Xy48fxg==
X-Received: by 2002:a05:6512:358e:b0:511:4f74:43f6 with SMTP id
 m14-20020a056512358e00b005114f7443f6mr1418845lfr.65.1707127997970; 
 Mon, 05 Feb 2024 02:13:17 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUYPjO83A/Qge6Mxn0EpYGvE9e7+yFig6RX1XHD4iehhlwlnmfJsmfmjfqcUeW8S1r1QoUyhCc/j2OTBELqYsGojJLZ1T9BpME9/Nn8fDSQ+W6wn9kzZfI0KQA=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a5d64a1000000b0033b1a40120esm7740991wrp.2.2024.02.05.02.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:13:17 -0800 (PST)
Message-ID: <3500c600-833a-46d9-a6e6-83ed46554f8c@mind.be>
Date: Mon, 5 Feb 2024 11:13:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111014940.2567842-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111014940.2567842-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707127998; x=1707732798; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bwPdvx7I8X5Pbmg/8qMy1iCQo85fEabD/1dl/SCerdg=;
 b=DBhXqn5Q5P/baT4Qhhg6gsjlZIFJJ1wKGH8TpYS/rBME+WZzkATeaiZNG6PcPtwOfR
 VIBM/eE1hGQaz9DGzBE/CWTiRWNW53o7g5KMIP5znRmEjSdD65Fcy4FkUaenN2hJMggF
 sYxVOP+FGg+4raFy0ZB0NiWlojfKKlGnK3gsWOOHhKD0EnKX4Qqf9PR/SFZ3uMiq3JYQ
 VLkvk+RqdMLJ9gnYI5k0U7G30ZE+Akgeuusv2Qvr9W3eiZwUr20vnI8gd/dTG0CQ9yvG
 KQvlJ6VmkHplZd0rlJQwq/GF/pe1mU8X2tOslZSMa7s8ewgKbvruoJgEo1CbxdL9HDDV
 qNgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DBhXqn5Q
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymysql: bump to version
 1.1.0
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
Cc: Steve Calfee <stevecalfee@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 02:49, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pymysql/python-pymysql.hash | 4 ++--
>   package/python-pymysql/python-pymysql.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
> index dd81bdab7e..641d5dba97 100644
> --- a/package/python-pymysql/python-pymysql.hash
> +++ b/package/python-pymysql/python-pymysql.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pymysql/json
> -md5  3fe6ff2eefb58af5c54d335c6e0216de  PyMySQL-1.0.2.tar.gz
> -sha256  816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36  PyMySQL-1.0.2.tar.gz
> +md5  81d559c87414017075de030d8ce93257  PyMySQL-1.1.0.tar.gz
> +sha256  4f13a7df8bf36a51e81dd9f3605fede45a4878fe02f9236349fd82a3f0612f96  PyMySQL-1.1.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
> diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
> index 3703572f35..c600fe515c 100644
> --- a/package/python-pymysql/python-pymysql.mk
> +++ b/package/python-pymysql/python-pymysql.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYMYSQL_VERSION = 1.0.2
> +PYTHON_PYMYSQL_VERSION = 1.1.0
>   PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
> -PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/60/ea/33b8430115d9b617b713959b21dfd5db1df77425e38efea08d121e83b712
> +PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/41/9d/ee68dee1c8821c839bb31e6e5f40e61035a5278f7c1307dde758f0c90452
>   PYTHON_PYMYSQL_LICENSE = MIT
>   PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
>   PYTHON_PYMYSQL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
