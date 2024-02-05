Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C320C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 559DF4182F;
	Mon,  5 Feb 2024 10:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559DF4182F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMBQGOZq-d8W; Mon,  5 Feb 2024 10:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D10C417D0;
	Mon,  5 Feb 2024 10:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D10C417D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC3D1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 149F660F58
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 149F660F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3peOcfhoRB0B for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:32:37 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEBDA60F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEBDA60F31
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b29b5ea96so969533f8f.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707129155; x=1707733955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xC6Fb+vniXkGmcsOYk/H8f4TKku/DjcYixZwJaUzTAw=;
 b=h9Qgr4QMRc7Vrid7dy/Zn+YeiwG+3V7Cclv28D42ySvEfxZLN/jMAq7RUxMzmZafwL
 iWT/Kl8Tc+kDrpkYcDk8j8wZSKUKuOXhqhdstxvEtUKXw0M1GbB2FoGQt5TH51MxYCtO
 5LTbR9ioRKijFK8dLbH/E/qwK8esfutxGjV+dPBeCRjD+bBz3xUPE3afOJfm7ywK9oZ+
 vVXNRpDBQW1ukPN2ekjQCYwg/TNQ9RUKlNwb3HRuq+wD3P15ILClUstjeG4a+urBsoYE
 UKOt7CimX/9uCrLyVjN45DxLzKMZG69ARueFVAHG6r+xnlu5dnOcGDop3abL/R+F83+5
 fqAw==
X-Gm-Message-State: AOJu0Yw0VtngxoPQhQ/iEA0cBOdPLfefFiZDujLIwYmjp0KlMB1yJn9Z
 IYrPmL0Zy/kIOcZUVFA+nLWMOIhDWJdJ1C++Yvftquj+JqZ51bRidHnWIUxzPkI=
X-Google-Smtp-Source: AGHT+IElCJ6DLElwpB2rfxrug562xHkiu9EetUO7rzzFIIzyU6NMVMUR41Y9FMeYslXANEN5jwYNWQ==
X-Received: by 2002:a5d:5f4f:0:b0:33b:17f1:c70e with SMTP id
 cm15-20020a5d5f4f000000b0033b17f1c70emr4968918wrb.24.1707129154889; 
 Mon, 05 Feb 2024 02:32:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUGKj/7MNlJtUlHIrQhKu2Ee2I/s/BcenCrPwBNoWZPPzAEdTolfiTGJ72PMNn3o0JRCGj5Uypiq7B2igc+3UYtmnqxV2RnGAG/MaajGs4r0O0ZJNEulY5Prno=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b0033b3ca3a255sm2185221wro.19.2024.02.05.02.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:32:34 -0800 (PST)
Message-ID: <eedf51fc-3ac3-4ecd-9ef3-caacf633f8f7@mind.be>
Date: Mon, 5 Feb 2024 11:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111040835.2702608-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111040835.2702608-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707129155; x=1707733955; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xC6Fb+vniXkGmcsOYk/H8f4TKku/DjcYixZwJaUzTAw=;
 b=VAXHSEA8NrdEEhaK5ZfdMvMFwRJ1pmjFDFApn8iamAy88jS1vMFiTW6SkQOIj9dStl
 W9LtAK4N/gKiS5//u9A3wpL5nV2lugELqdKEdDOzVkVgrP3F3vL5nnYHQ1j7wK35RVVC
 /MVA2+M1miS/VAa49ZaGoEI5SgBhvQ8nRV0MFcPU3zQfRSW4RdKYNnk0EUuEvB79bGNr
 8avj4sT3aQanXmc2+JvQ417c9YGq6l2Tx0F9V2tRecuwR8kDDdfXXQYQEpCnC6uuomL+
 ypw8gWSVVlrU4sxriDAYe+CqKeIDlVeUY5M66kvoqm5GFo4ThplU3V+7pZ1gUvpKw3wj
 Mj3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VAXHSEA8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pythran: bump to version
 0.15.0
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 05:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pythran/python-pythran.hash | 4 ++--
>   package/python-pythran/python-pythran.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
> index 2dfc445b2f..a46825c933 100644
> --- a/package/python-pythran/python-pythran.hash
> +++ b/package/python-pythran/python-pythran.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pythran/json
> -md5  3090288af50566af75cb058d1878aaad  pythran-0.13.1.tar.gz
> -sha256  8aad08162f010e5425a7b254dd68d83311b430bb29f9252dce2eff3ba39497dd  pythran-0.13.1.tar.gz
> +md5  cc6fa05e583733182d06d2e41e03cc10  pythran-0.15.0.tar.gz
> +sha256  f9bc61bcb96df2cd4b578abc5a62dfb3fbb0b0ef02c264513dfb615c5f87871c  pythran-0.15.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
>   sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
> diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
> index 25735ad95a..43853a514d 100644
> --- a/package/python-pythran/python-pythran.mk
> +++ b/package/python-pythran/python-pythran.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYTHRAN_VERSION = 0.13.1
> +PYTHON_PYTHRAN_VERSION = 0.15.0
>   PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
> -PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/8d/d8/b27e8dc3f3a03dcd317d40d9df0ae07ebbd85444585973ceba07716934d0
> +PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/82/31/cc6fd7a2b91efc6cdb03e7c42df895b4a65a8f049b074579d45d1def746f
>   PYTHON_PYTHRAN_SETUP_TYPE = setuptools
>   PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
>   PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
