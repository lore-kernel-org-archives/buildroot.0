Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4F1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 403AC41A53;
	Wed, 27 Apr 2022 18:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMJ2HHyxKDMC; Wed, 27 Apr 2022 18:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2184741A4C;
	Wed, 27 Apr 2022 18:54:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B411F1BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A232241A4F
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bus-yHyhC8tx for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:54:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F0E4418D4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:54:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id k23so5222684ejd.3
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k1+mPnKP0GBpoitFl92jC+nY/E28Tu09E1VP6+FnPs0=;
 b=Ky0lTrb9/9kCXkMjZgAhbqXf7mytu6YzwD1RtgRX9zbbDSEbXM9M7RUhu21o5pWs9W
 4SYmKkB9t4TgsB7kw8mQ0SvG1C4oPiP9a8W0Xbqz0YkZ6HbXPwryyOcAZgEOxcTD4znd
 wD7ZL5Bw4/cc1oHTWTW+MVyHz4FkpVxpGuaQqQ02eDeyJ7KkjeQK3jzpn0GafXhogPXI
 8qXnSDCPYxYGr84sFosT/9dD5FfqS/izSKwu/YiHfpU4YzRY2iIBOgQaWYY6NR1Qtb71
 oWy8T+gJPl9XDXovSo0DmvqctbKO0NmsQFbGoSDj2uEbwSv4O8YVpuhBNjFK8NmMPxo0
 zTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k1+mPnKP0GBpoitFl92jC+nY/E28Tu09E1VP6+FnPs0=;
 b=o/MokiHDKsrXxEhWQEY3EelqVrvTdNj8MweKU6Q8rNWt/SBmv+btqHAcsyXY0c18IC
 i80mJpnP32r7Xb5+7/ifmVDJDNtBby1k0x/rcLJlWNg27hr7ltTM187ldiP3v/qcReiK
 XogrwgcA2SD4RNYas0dk5e4pIZrooqi1f33jvMMm2RTmurZ19td/wGLuNsIinpdKJLM2
 vUYxZ+Ga+4vdjg+Lkq9WrAZDy6/c67jpx56QzSDC0E0HhNRNb62g/A/CMmYtMmrG/EKs
 WfY7XI64ekBT2cYfl/OXPt/i9eM7Je4UMEdZm2SQXPVHs4rLhSx1je30+aDPhXm7yV7q
 /7JQ==
X-Gm-Message-State: AOAM530YIhjf74O6yAuEDe5ySveQ1YRQ2Inzjt751V3hGmxomtA72NIC
 1tC64FWXSL9FhDEKN7+8k2LGuA==
X-Google-Smtp-Source: ABdhPJwLhta3jF4Dhj00JK4CFBoPpXt3v/qDEIn92VdX5TnrZCq6/1NA1n+WTGMrrmtxzyF5s4RLYQ==
X-Received: by 2002:a17:907:3f82:b0:6df:919c:97a with SMTP id
 hr2-20020a1709073f8200b006df919c097amr27627176ejc.19.1651085646821; 
 Wed, 27 Apr 2022 11:54:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 dc16-20020a170906c7d000b006f391eafd1esm4922131ejb.67.2022.04.27.11.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:54:06 -0700 (PDT)
Message-ID: <6c086cc6-93d6-0c45-83cb-98283fe9976f@mind.be>
Date: Wed, 27 Apr 2022 20:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220425220602.1077854-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425220602.1077854-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wtfutil: add CPE variables
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 00:06, Fabrice Fontaine wrote:
> cpe:2.3:a:wtfutil:wtf is a valid CPE identifier for this package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awtfutil%3Awtf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wtfutil/wtfutil.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
> index 6e841411a9..54fea09574 100644
> --- a/package/wtfutil/wtfutil.mk
> +++ b/package/wtfutil/wtfutil.mk
> @@ -8,5 +8,7 @@ WTFUTIL_VERSION = 0.41.0
>   WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
>   WTFUTIL_LICENSE = MPL-2.0
>   WTFUTIL_LICENSE_FILES = LICENSE.md
> +WTFUTIL_CPE_ID_VENDOR = wtfutil
> +WTFUTIL_CPE_ID_PRODUCT = wtf
>   
>   $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
