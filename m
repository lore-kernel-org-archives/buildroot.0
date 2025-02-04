Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E6C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0500401BF;
	Tue,  4 Feb 2025 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eH80c-zPPTp; Tue,  4 Feb 2025 17:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96EA5401DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96EA5401DF;
	Tue,  4 Feb 2025 17:07:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81BD012A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65E27607A4
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzHRqS9orCIZ for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9260360663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9260360663
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9260360663
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:07:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38daf14018eso554166f8f.1
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 09:07:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738688833; x=1739293633;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1sQAVlaA93ilH2c4VVzj14e9TF9429WYvU6jj2yKGVA=;
 b=ZVjKwEOC3XZvCTUo6Av5CmY99dgxSjxdwmxww4j64hWePPF7hlA1iEx1Trfu965HDQ
 xAp+4QaWpgfUy1ITkfT2RV5w8vQX1CXiZK6BmH3hs9EYJfayUHk+girw3++EF8VdXU9O
 fXi1qCMe6Kbf2hqEQPZ7dtvE1T8uuIvETCna5cGVFbJhKk9er6y67TluFAqWFOwC4oZr
 8Ktu/4B1mepoRzXFcbUW9e2h7MbGV01OnbwoNs565Pyozk1+B/+simAeyRZrCgukpdq8
 e/f7aFlJOfnVQToTpUgCcXbFCb8AnGS4bnm8vmnlQPJ1GfK4IgemOU1Xywd/R35BCybY
 SFKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQTE5hVMfTzck75zk9vLqDnT88FMcp8YZphYH7uLpQgOQ5u7Phq6UeI1x/r5KPFihR/vmaEzJJPG4=@buildroot.org
X-Gm-Message-State: AOJu0YxFGsYj3/ZFDj4Vvc70cCkm748mzqjwRuC6Ekms1G53ZDoDs4DE
 0/Dg7SXr1/qGFt1Tp7/eegbS3wTaCrNs1XF1cFskMv15kaTFtX5H2geTW3GYOVY=
X-Gm-Gg: ASbGnctJUcAZxWmojtJRDJz8dGm3OQ5LVH8uQ3C7CRrh5hbNjOB/v190zRBS/5Iu71p
 +ZdZUfRN6UTHSLY13Y11Yb+Ok94hFcCtV1uqz0ccQ93D5wG6N/M98TM8iSJAn/fZJI4tGBhHnfv
 FI4YQVm6ScFC5w/igR0rz81CuGAnLd7PMp3bR0Vd7LFVzNtWPl1uYL7XXm4FkfsZLK7yL+/1KLy
 QPxh+6fejvONzmrV+JAGSrdDTrwUplJKeVn6SQo2Nx62npm3O16QghxboKBM8c5qBZcxO2YI/m8
 0QaadNRROErY9wz0YRZJXRjeLzG9lovdl7RHRtkE03VH8H4=
X-Google-Smtp-Source: AGHT+IEUX48IcVDbb8lu/AmyD100lxE8jRqzKMOjQ4bDrF1GZsZt2R7BlhxjUD9XaWA/p6LJyKDTwQ==
X-Received: by 2002:a05:6000:1564:b0:385:f44a:a53 with SMTP id
 ffacd0b85a97d-38c5192f4bamr20631939f8f.4.1738688833321; 
 Tue, 04 Feb 2025 09:07:13 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38da676457bsm2772535f8f.101.2025.02.04.09.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:07:12 -0800 (PST)
Message-ID: <05b5558f-a882-4110-ad95-840221b0b239@mind.be>
Date: Tue, 4 Feb 2025 18:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <20250204-repair_mimic-v1-1-c8e8f29b6c1e@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20250204-repair_mimic-v1-1-c8e8f29b6c1e@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738688833; x=1739293633; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1sQAVlaA93ilH2c4VVzj14e9TF9429WYvU6jj2yKGVA=;
 b=DIIxCxfuiY6SnB1Mn0zbXxjQztlOUNF8jocFc+Z08/vu16fJyDXhfyNkpQflH2qgdA
 mpiJChKJY2OVQP2/n+MRz1rWpEmh3bkZm2kGOGYG+OrYYDyAH4qElyoN4IqUHN0NkBnx
 XdAERoLfj0Z3qW/rKgmaKGGXLJ5vY+FWK27OV9mKyoDXpplShTFDv9UTRAPepeOGi38w
 rH1mtwGLVqD4QuHKKvZXPipHmYnkL7zCdluTa3CH4zUl2MXDVR2mbVR5sod0Chbnc/8V
 Yb8RYznoXsofNg5SQhJWhwn5mByQ6ofsESHnMwOkZUJ4r33O5DqsFAr1b1sHsYqrgqgy
 xIqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DIIxCxfu
Subject: Re: [Buildroot] [PATCH] package/mimic: update url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/02/2025 17:16, Thomas Bonnefille via buildroot wrote:
> MycroftAI just moved mimic to "mimic1" on Github as multiple versions of
> it have been released, this cause the sha256 of the package to be
> modified.
> This commit modify the URL of the package to avoid this issue.

  Changing the URL doesn't actually fix the issue: the contents of the tarball 
still have mimic1 in there. We have to change the hash.

  But we can't change the hash without breaking existing downloads and 
sources.buildroot.org. So we also have to change the file name. The easiest way 
to do that is to also bump the package version.

  Or we could drop the package :-)

  BTW I improved the commit message a bit:

     MycroftAI moved mimic to "mimic1" on Github as multiple versions of it have
     been released. Even though the old URL still works, the directory name
     inside the tarball has changed, so the sha256 changes as well.
     We can't change the hash without changing the file name. The easiest way to
     do that is to bump the version to 1.3.0.1 which is already 5 years old.

     Bump mimic to 1.3.0.1 and change the URL to mimic1

  But I actually think removing the package is better.

  Regards,
  Arnout

> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> This package hasn't been updated since 2021 so the issue also affects
> all versions since then.
> ---
>   package/mimic/mimic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mimic/mimic.mk b/package/mimic/mimic.mk
> index 2d246561c96696ae80e97d69a577d8f25180fc06..48ebc479c8cf6d47819aa19ce95197ef08a970ad 100644
> --- a/package/mimic/mimic.mk
> +++ b/package/mimic/mimic.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   MIMIC_VERSION = 1.1.0
> -MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
> +MIMIC_SITE = $(call github,MycroftAI,mimic1,$(MIMIC_VERSION))
>   MIMIC_LICENSE = MIT
>   MIMIC_LICENSE_FILES = COPYING
>   
> 
> ---
> base-commit: d5b3795e92727c6565901cddf0c0f17c7854df56
> change-id: 20250204-repair_mimic-2299861f585b
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
