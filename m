Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1016AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 21:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3E0840321;
	Tue,  1 Feb 2022 21:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdkafniNE978; Tue,  1 Feb 2022 21:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E617A4030D;
	Tue,  1 Feb 2022 21:54:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 553FC1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 439BC60767
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWNzkQnI0YUZ for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 21:54:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 248BD606E7
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 21:54:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id jx6so58929178ejb.0
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 13:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=kHCLSgfRiMc7dns9dFOpKaBlQfIrHRgJ/1V83IYpvzk=;
 b=aZxTVG5045IuMTkJJVLdiln524yMh7H7wJL2BI644rzku/N75JCG1acEBqRGTT200R
 f8dT5/HeuZRa/2GnVRCbXeaI4RXyeCFNiy9OKAZeVAML5rXSp8DakXmibiDSfutWpSnA
 mK12q+QlUDaT35HGRdqCuUMx75+RGJDzv1KvdmLGfJEPXnOphmpqbwGsNCSn1rcb52BC
 lavHt2C8VKmFmWF2BuHtt5T/OqUK9qi88piwq0MdQRuQkJ6WynhZuwhS7aPiIlXMRKdy
 8XO50w3vx5Z8BlJjm9Ckzl1HtGLr6JBenQW+8L9Gau81zxSessE0ZJOXO94AVwEkBLVY
 6UFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kHCLSgfRiMc7dns9dFOpKaBlQfIrHRgJ/1V83IYpvzk=;
 b=GHm6mMifhNduB/IE7P4qPzFDfGpDXgwmghERDlb98gM40dCXtr/+/pBUYAErzaIk4Q
 JZtL3db+J6xECHFjOPuhe90nrAMMjXGiMOBRN/rdgroWY7FknNdRbYSZd/ysihooYOx5
 5IqJTf1YpHaYZ9NOvrE9MyGSGCnLG0ot6DBviQhXCHSVAhlwm3lAIJXt1erN4TWlIsYV
 vavfKenQ5dDSuUVKdg5UXfqjlXhIB1G8mWmT6vCXi8dj2Aedj9mStWFswu4Ubf1DzbDp
 AK5p2+mxwVcGDETw/IsSF2W6OyR0+S8xTcauEezLIGK9/rlTADNAuyN0xCHrTTpO02bQ
 z8vQ==
X-Gm-Message-State: AOAM531SVjtO9o95dOLRkyD7a9z1E4Of8ypjisGeOE913ug+QIII4RCH
 ysvGkhPwRVo66uJa4Iv6R7DagG4Kwy3lrA==
X-Google-Smtp-Source: ABdhPJwJrrTuEJqJ4VKQfQ/xoqGNhhpFR2rvi3PEjeZff2YYU6ZqwukrFSeez6BMVojAd2Z1+qTaTg==
X-Received: by 2002:a17:907:2cc6:: with SMTP id
 hg6mr24174645ejc.755.1643752463346; 
 Tue, 01 Feb 2022 13:54:23 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id my25sm14992175ejc.104.2022.02.01.13.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:54:22 -0800 (PST)
Message-ID: <1af59aa3-4881-be25-e092-b09931bd20d3@mind.be>
Date: Tue, 1 Feb 2022 22:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Ye9BMW0NhkDBKOCL@waldemar-brodkorb.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <Ye9BMW0NhkDBKOCL@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.40
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/01/2022 01:15, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/uclibc/uclibc.hash | 4 ++--
>   package/uclibc/uclibc.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index 25bbabf2ea..989c9d887a 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.uclibc-ng.org/releases/1.0.38/uClibc-ng-1.0.39.tar.xz.sha256
> -sha256  cb089dfe14867a38f222d6428e85d0e1191dcbb66dd9b1a671484f6bc7c81920  uClibc-ng-1.0.39.tar.xz
> +# From https://downloads.uclibc-ng.org/releases/1.0.40/uClibc-ng-1.0.40.tar.xz.sha256
> +sha256  d863f01815a64174d5019c73475e8aff5b60848a13876e79daf5d3d83ce7f889  uClibc-ng-1.0.40.tar.xz
>   # Locally calculated
>   sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 0feedb6cfa..d79eaa1d0d 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UCLIBC_VERSION = 1.0.39
> +UCLIBC_VERSION = 1.0.40
>   UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>   UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>   UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
