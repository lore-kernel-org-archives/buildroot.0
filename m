Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E59FC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E5AC81F33;
	Tue,  6 Feb 2024 12:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I69M4wmzwiM8; Tue,  6 Feb 2024 12:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 327B981F4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 327B981F4B;
	Tue,  6 Feb 2024 12:38:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9206C1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ADC1402B2
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ADC1402B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKfYKYP2ozH0 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:38:39 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F66D4024C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F66D4024C
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fe282b8adso4446195e9.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 04:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707223117; x=1707827917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YLscTyIf671/DrhZc7RIokjN31nfg8uagyk67nUuAzo=;
 b=n07fBncRAd9V9U/kj7XdqxUIhTi5r5mioLjRPGBxRhhRwp31A3tKJCznDTqVghfMWv
 X1xcs/I2yHZB8qZXizgVVPRow4VfoJpe1FxjpvHa/CEVYpySddRUvsBGfUIaAZ7gZFnm
 FhyCnBohxXoMFiwHemBMIV10/AZ5y4vEp78ozD0wbv5jdf2TYdWUeiEYWMpGxdaSoHbo
 Btv/nR5gG93VhiLXA5s8VzmuXyx7nxi52LdORDuoEYjR4Ks0RvX5sVRhEf3JyOXp3uyu
 H4oj+Iz0JA4CAjgCeuohlQEeFJOc+XlguI+s4kiNFSTiK8SJaqU17TiZ+CUtEjH0Ccsz
 uX0w==
X-Gm-Message-State: AOJu0YwVL5kPaTMiG/P2TccSHmcZMbuoBLz1c4T48iFiWh9NPHUY+VlP
 30VxhIOTAWVIiDswujtk33Jk4c/ua9/LSzkhrxyXQSFYBoBqtrkceNDyi9+Ajr/SmKR/vb+QDGQ
 3
X-Google-Smtp-Source: AGHT+IEOGdRf9OhnettMrTdQwJs/b/tYaFW5Pp5DDMPbKc0l64s/I8T9e1mCi4E1KrMwPr3e29Ch6g==
X-Received: by 2002:a05:600c:3553:b0:40e:fc26:8719 with SMTP id
 i19-20020a05600c355300b0040efc268719mr1896630wmq.35.1707223117352; 
 Tue, 06 Feb 2024 04:38:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXVR+7aesSJMkM/0X9b/ha7NRJmagUku/bdsGnjlTFheQiTsYHDcAdVFLWqNkFs0ICPK9npEb+PvJcYXcXj5/wZ7rUtE4O7C/vZmqsZyyrfLdLnt9F8V3mi5Nc=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 hu23-20020a05600ca29700b0040fdf204fe7sm1842438wmb.38.2024.02.06.04.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 04:38:36 -0800 (PST)
Message-ID: <20938ad1-04e4-4536-8f2c-b85af0c650ca@mind.be>
Date: Tue, 6 Feb 2024 13:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: ~bubu <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <170715586410.13905.2351857620201846100-0@git.sr.ht>
In-Reply-To: <170715586410.13905.2351857620201846100-0@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707223117; x=1707827917; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YLscTyIf671/DrhZc7RIokjN31nfg8uagyk67nUuAzo=;
 b=G3IUwqn8oZzz0Ar5ghsgM83hwEQfUw17J7F/Av4rWBCjQeOxO72iHBWAyHV9wqEaFA
 sXs2x3FXK8q/AYHINvI58Ou0LqV1XBhWPrXI20EDNGDjC1Q0q4CSgysg9KRG4tsqR2Ek
 TedZ5mJ/e2OGyZHdbxRpJsotwJ5vgtEjGIdOvu4+cB/Nzm6KoiOmOzY1kZx02LgireNP
 ZwtBM7m8BM6iuHzvTFPT96d64Avq10HeP5wjcIo8asvZm026Oh4XuwjJcTY4H922slwD
 3zwJX+DdufUiFcoH5iHvC5lb9nf9iWUGpv0YaGeVtptijRpE0/Q51VgVs/LfahUgxtB/
 hsPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G3IUwqn8
Subject: Re: [Buildroot] [PATCH buildroot] package/python-fastapi: bump to
 0.109.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2024 15:12, ~bubu wrote:
> From: Marcus Hoffmann <bubu@bubu1.eu>
> 
> Drop no longer required dependency on python-anyio.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-fastapi/Config.in           | 1 -
>   package/python-fastapi/python-fastapi.hash | 4 ++--
>   package/python-fastapi/python-fastapi.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
> index 7d376d3dd7..d4a527c601 100644
> --- a/package/python-fastapi/Config.in
> +++ b/package/python-fastapi/Config.in
> @@ -1,7 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FASTAPI
>   	bool "python-fastapi"
>   	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
> -	select BR2_PACKAGE_PYTHON_ANYIO # runtime
>   	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
>   	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
>   	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index 3dc1578cb7..c16b7d22de 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
> -sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
> +md5  b48191c0322fb5479773925af005b2c1  fastapi-0.109.2.tar.gz
> +sha256  f3817eac96fe4f65a2ebb4baa000f394e55f5fccdaf7f75250804bc58f354f73  fastapi-0.109.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index dc6d919926..a2191c73b7 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FASTAPI_VERSION = 0.105.0
> +PYTHON_FASTAPI_VERSION = 0.109.2
>   PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/01/d5/33a8992fe0e811211cd1cbc219cefa4732f9fb0555921346a59d1fec0040
>   PYTHON_FASTAPI_SETUP_TYPE = pep517
>   PYTHON_FASTAPI_LICENSE = MIT
>   PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
