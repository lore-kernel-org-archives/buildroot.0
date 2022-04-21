Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED21FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB0BE4114A;
	Thu, 21 Apr 2022 19:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IA5fXX3OpRy; Thu, 21 Apr 2022 19:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E2B8410CA;
	Thu, 21 Apr 2022 19:33:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59C2D1BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47C8B410CA
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ki9UCFdb8f9f for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:33:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BBEB40A98
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:33:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso4077068wml.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WxO1MTugtJezK12dOxGyX7Udeiw2tTNdAxO8YKXnAPM=;
 b=Vz8Xm9MuHXNrpZrvmC2EltO7s3miIEwS22RIzcL3nxjbzpVSks1e4rRnUxrW90rmbF
 1AamjFKR+OoIl5PdacvqwQkfUtiS69fhrX8CxxJsO04LDISvqI7QSuY6pDdC8WSBvc0i
 cD4LUfIPdEz/+vOY6oKN/F88HVtTgyTVXlF3qms+sgQUzSluL+va22mJFlStY4yZ7kyl
 eN4WU48KAYoSvEMRJhkQTQffef0M9YdZnNoP5iU8yqkdvDEpofdjbkqZjLV4vA+FwIOp
 uGMUmKkZ46RiMLpLoOs59KmhZRl8rDOLRJvYFTrGSReBmsfFnDD2Flqq1dP2D1J6AsJP
 /QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WxO1MTugtJezK12dOxGyX7Udeiw2tTNdAxO8YKXnAPM=;
 b=omrCRRNAgFpWn82dtMP5o8LBbgdW4ocBHlS3Bl/SchGEc8a8FJnYn85qb9ucNXN2XI
 2SuEXiWWKF976Uql38Hqig9bLJP6y/CbikVnyvf9qxLqZJOdfJ6FcrM9SbOsSRzmlfe2
 qrttgQ1B7fyANfR3m8gAVyLyXR0MpCgS3oChB2x7CqWkJZyWWvl6mvE9R/YZQKyvEVke
 F2hC1L+uyfjYAHM5B7GLbQJmA6ppG73503HH34i5dK/JjRjiaewteT86IOXC/vHlf4g0
 g6cnBGjIVSlSb1g9R4NZI4RAKKMfMNK1b8XWeLlaJjP2IJcAMNlaPVNikN5C8Rv5dh4D
 zUWQ==
X-Gm-Message-State: AOAM533g2jDH77XubLYZ+YrWzRE56LeAH3JV/B2ptmSjcEgoCdx263Rv
 eaXB8dR5ecUwbINluMSiyu1Mgw==
X-Google-Smtp-Source: ABdhPJw65IRia+Twhdf5jqF3T4/nDmjZNg/gwxkOpxGp7CySB17Spa6oqy6yAXdqkwI+/EbcdRrvFg==
X-Received: by 2002:a05:600c:1d29:b0:38e:c4d1:a41b with SMTP id
 l41-20020a05600c1d2900b0038ec4d1a41bmr9933906wms.70.1650569623612; 
 Thu, 21 Apr 2022 12:33:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a0560001a8d00b0020aab7cefc4sm2918625wry.46.2022.04.21.12.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:33:43 -0700 (PDT)
Message-ID: <5a73b671-4ed6-38ab-19fc-5fcdb598df0b@mind.be>
Date: Thu, 21 Apr 2022 21:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220414194048.422920-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220414194048.422920-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.18.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2022 21:40, Christian Stewart via buildroot wrote:
> The latest Go release, version 1.18, is a significant release, including changes
> to the language, implementation of the toolchain, runtime, and libraries.
> 
> https://go.dev/doc/go1.18
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/go/go.hash | 2 +-
>   package/go/go.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 85e6adfb8c..37c34b8b64 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,3 +1,3 @@
>   # From https://golang.org/dl/
> -sha256  2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a  go1.17.8.src.tar.gz
> +sha256  efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088  go1.18.1.src.tar.gz
>   sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 3df16c9a68..cf90ac8765 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GO_VERSION = 1.17.8
> +GO_VERSION = 1.18.1
>   GO_SITE = https://storage.googleapis.com/golang
>   GO_SOURCE = go$(GO_VERSION).src.tar.gz
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
