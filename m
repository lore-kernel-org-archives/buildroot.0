Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DA3C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E46340108;
	Mon,  5 Feb 2024 10:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E46340108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7V54vaFAS01E; Mon,  5 Feb 2024 10:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DCD740168;
	Mon,  5 Feb 2024 10:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCD740168
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C20C21BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7F5460F7B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7F5460F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J18r96IpneD7 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:51:46 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49EEA60F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49EEA60F31
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5100cb238bcso7658698e87.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130304; x=1707735104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KKz7qErWDKHBng1WWJ5M7zsYYSYCx8WzAtm50m3kVV0=;
 b=c5dkGVSaou/xPkO7DPYzrVwYt50xOqa+vPhxftkcGrVlIkRn2Y/X9jtaA8w7f/NGD9
 a4BerDGxJ6GQqEtQ/CzIf3nhidLYc5ikRiT9ybMk61DMA9iXBchNp8PrQnLDH6o6u2P4
 t853Cd9EVGipkA0C1gppSymDJG+dtFU7OvzQ+/gvhC0ot33YQlcZ6TWxYODBLMH/05jF
 0t4VzweXAujAsKjaftQ/hhJMPArst69VWllQxbzhzJA9H8jvd239XoDbitAJvegudHny
 d459nGJBT7RvSjkf5GxJwMOr7Wxg/NMHT0BJoOnbAzBECB5LFVgPgt70dj/7sm4oY6kp
 957Q==
X-Gm-Message-State: AOJu0YyvKHOWZyaOZq7X2ShmsEdzcGJOYGwqAB+UiqluC441xImtJKSV
 qRebAST5ziAc03X1U/QMsKRe240lOS3hjNQAnfCFzcpQICDvt61TrqePPn2Qns8=
X-Google-Smtp-Source: AGHT+IHXFAk5VtFY4NDyJ7v33h8OHpd//pWmT8KN2XY2gyDtCjxPV1nyNMGpVPqwnYljsDsVPSympQ==
X-Received: by 2002:a05:6512:2829:b0:510:141b:4f94 with SMTP id
 cf41-20020a056512282900b00510141b4f94mr7357091lfb.52.1707130304179; 
 Mon, 05 Feb 2024 02:51:44 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWWTXqv+gtyutow4xKwJiPGDA4kFax0LsAwoF17YuUBU97rnzktnceWwd4fn9egHG+a3pRixVCxWPw6L6HaM7r8AraOMszt1w==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8101947wmb.26.2024.02.05.02.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:51:43 -0800 (PST)
Message-ID: <69cfc932-d7dc-4ee8-ab41-609e0900db99@mind.be>
Date: Mon, 5 Feb 2024 11:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111050729.2902435-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111050729.2902435-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130304; x=1707735104; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KKz7qErWDKHBng1WWJ5M7zsYYSYCx8WzAtm50m3kVV0=;
 b=aTXKUNTmkpjPcaMwtm5IzaylmxIWFCgy+rGxHsUYBYWos0n6OkPH2+vLglYSIIbLUw
 TKKGdFLMSW18fpdCu8IhL3Sm9gXP5yxXl3jvTcgAF113y4EkN66rR/A4AyooUp/m1tCf
 F0JReqcHtxcmM6ahMIACUA7hVLuFcJH9altIQwddXfXvBXiWRVQoUC8+JHOebkqRLxEl
 R+W42jYNRjr+BzYAhb0IfnjtEOePjnRbyUyJpvuDeBE9LMEEZbDBSRPwa20rRtTRsyMH
 9FWzmzyy+GxA8CxmgawfJnT1OB11UwpZqzZ58UicgfMy0U3A29sydncWcHk39JkmfOS5
 f2qA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aTXKUNTm
Subject: Re: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2023.12.25
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



On 11/01/2024 06:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-regex/Config.in         | 2 +-
>   package/python-regex/python-regex.hash | 4 ++--
>   package/python-regex/python-regex.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-regex/Config.in b/package/python-regex/Config.in
> index 5f582d085a..89ead69c04 100644
> --- a/package/python-regex/Config.in
> +++ b/package/python-regex/Config.in
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_REGEX
>   	help
>   	  Alternative regular expression module, to replace re.
>   
> -	  https://bitbucket.org/mrabarnett/mrab-regex
> +	  https://github.com/mrabarnett/mrab-regex
> diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
> index 11a5765e41..7454db99bb 100644
> --- a/package/python-regex/python-regex.hash
> +++ b/package/python-regex/python-regex.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/regex/json
> -md5  a85ced10be8bfe76fed4f30c42d32d5c  regex-2022.10.31.tar.gz
> -sha256  a3a98921da9a1bf8457aeee6a551948a83601689e5ecdd736894ea9bbec77e83  regex-2022.10.31.tar.gz
> +md5  3f97f0aef9bf334fe50ae5980b183e68  regex-2023.12.25.tar.gz
> +sha256  29171aa128da69afdf4bde412d5bedc335f2ca8fcfe4489038577d05f16181e5  regex-2023.12.25.tar.gz
>   # Locally computed sha256 checksums
>   sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
> diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
> index 81bd460ecc..6b1938bc0c 100644
> --- a/package/python-regex/python-regex.mk
> +++ b/package/python-regex/python-regex.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_REGEX_VERSION = 2022.10.31
> +PYTHON_REGEX_VERSION = 2023.12.25
>   PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
> -PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/27/b5/92d404279fd5f4f0a17235211bb0f5ae7a0d9afb7f439086ec247441ed28
> +PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/b5/39/31626e7e75b187fae7f121af3c538a991e725c744ac893cc2cfd70ce2853
>   PYTHON_REGEX_SETUP_TYPE = setuptools
>   PYTHON_REGEX_LICENSE = Apache-2.0
>   PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
