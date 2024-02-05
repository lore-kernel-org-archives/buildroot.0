Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F449C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA3BD60F31;
	Mon,  5 Feb 2024 13:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA3BD60F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKzQWPeoXwWL; Mon,  5 Feb 2024 13:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 421D860EF8;
	Mon,  5 Feb 2024 13:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 421D860EF8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB071BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2880860E50
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2880860E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CowX-Y4NDHBQ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:22:05 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBE5560EF8
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE5560EF8
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fc6343bd2so27027495e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139323; x=1707744123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uE2cUsotrmLthQg537KqBVZRTUvpJr4M3HByx7h6xr8=;
 b=jWaDtX76GP79aRVHmwHPGNSnLzQeNztKKBxzxgy+Mbp/jZQcGmCXJhv1dB5sJ+fh4i
 vmacERYoaPs1ZZ7KaN0ainqMq9bkfEZebJCrq8L8p/x4WY2Xl83t2YVUUBIhmPrnMI6y
 QKLgut/vqnVvKBNPFyX3OsoRdine5ID7CbKINoXQMPhTmJrwDBDDbxenMYak97bFY4Hk
 T2SJgMZEqyhfw5Y7u6lGdOjNq5f1xVy2xqCAZ//wh1/XOgyXVVbRSkJKIZH+2ZhbzbpD
 MZTZcgMFp17XMrZ0Kz/vfkiHf2MBkT7atHhO+VzwNlWcwdSF3iHs61hDwDQYVmWv+Yba
 zpYw==
X-Forwarded-Encrypted: i=0;
 AJvYcCVzyhG94hioHBVq48BwFKBSNPfrwPjie5L6K8niXRFNCk8C1jKP3OyQZdeHFeiNCfsBH1O8VR2UitL8uNEpChWmoSw6Hf0JaA==
X-Gm-Message-State: AOJu0Yx32hlgyD1RiaOkzhJd5HF++3A7eDA6JhZUDITbYpxf7jYC6WJx
 HVExjjbTSxLuAMm9qxOk6pNScS03yXGpAeTuW/hZ8Mog2NgNTli1vUnN0JBhqus=
X-Google-Smtp-Source: AGHT+IG9sA9wWQRZ9N8B5NwP5ofZ4RzFowENvWkqeIUUbPUG3j3U7XpPaIuuxq/14GE3EnuMi4WF0Q==
X-Received: by 2002:a5d:6a07:0:b0:33b:318f:cb0f with SMTP id
 m7-20020a5d6a07000000b0033b318fcb0fmr3912132wru.59.1707139322743; 
 Mon, 05 Feb 2024 05:22:02 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUF9EZUdjk+IVnoE26QFYBQMTNMRe4hZNaghhHc1vvCABS4864v6rkfbT1E3ZU4X/z+zIXTKkeWqZlXXd93xnxMWPal00xWOQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2282272wrt.44.2024.02.05.05.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:22:02 -0800 (PST)
Message-ID: <b62faa8a-f87e-4941-a884-f764d0e01939@mind.be>
Date: Mon, 5 Feb 2024 14:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240107203517.3310719-1-james.hilliard1@gmail.com>
In-Reply-To: <20240107203517.3310719-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139323; x=1707744123; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uE2cUsotrmLthQg537KqBVZRTUvpJr4M3HByx7h6xr8=;
 b=fzoSpYZhCvujuaLHLeAwbzoinlmojzc0TZ+bNH4bg3LSLU8nmmtWpvd9ckazPwAU0d
 32hQGDyhR8GWXhPTTDXyJh7sml9euH/VexLTYt7jDKZ/3dVgjR9YibcjbwrCop+2v0ck
 OZ2wYT+hYZ4k5bbTLJmHL+1V5HBnOV2Z8C0kVxJWbxLN8K1Dj/QL3Es8qyDbmxT9JMIH
 VCl1L03416Q4TGXxDyW+NOyr3/LCftF15/RhBSf5OcSxMZEwAXBO8LH2fWblnrBWkvPx
 us4GL9WzfC34zqgQYoCG2gM+fCalKAAYH2eE1Mx2RnGsLKV61HmT+7o4aQcZkGv02YwZ
 Oedw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fzoSpYZh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to
 version 0.7.0
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



On 07/01/2024 21:35, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aioconsole/python-aioconsole.hash | 4 ++--
>   package/python-aioconsole/python-aioconsole.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
> index b8237ed76c..b52140cca5 100644
> --- a/package/python-aioconsole/python-aioconsole.hash
> +++ b/package/python-aioconsole/python-aioconsole.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aioconsole/json
> -md5  0f7e4db85113d1ffdc5f0fa1dc0a37de  aioconsole-0.6.2.tar.gz
> -sha256  bac11286f1062613d2523ceee1ba81c676cd269812b865b66b907448a7b5f63e  aioconsole-0.6.2.tar.gz
> +md5  e8cb2e4dc434e20a3e75acb54d89bdf3  aioconsole-0.7.0.tar.gz
> +sha256  c702d24406378d37d9873f91e03ce71520bac503d5ab03f81d8b563ff010bd54  aioconsole-0.7.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704  LICENSE
> diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
> index 602564c290..b109d8e358 100644
> --- a/package/python-aioconsole/python-aioconsole.mk
> +++ b/package/python-aioconsole/python-aioconsole.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOCONSOLE_VERSION = 0.6.2
> +PYTHON_AIOCONSOLE_VERSION = 0.7.0
>   PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
> -PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5f/14/e5c634fad6a95ffd602fbbd1aa107f05a8ffb79d33ec0d0477f3b137f8a9
> +PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/85/da/6a238a72274fa338b2ff20007f026944a6721245fa65d3bd4adeb83be419
>   PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
>   PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
>   PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
