Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76438C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 12:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1D5A6101B;
	Mon,  5 Feb 2024 12:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1D5A6101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbmdhKb5EyYs; Mon,  5 Feb 2024 12:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F5060FC6;
	Mon,  5 Feb 2024 12:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F5060FC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC3E1BF2CE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 12:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1327141A7D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 12:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1327141A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8On1DV2jGBe for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 12:47:31 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8595841A7A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 12:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8595841A7A
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-511538be947so610630e87.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 04:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707137247; x=1707742047;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DMaPddCvkfZtuTGik7Boqs4NIIA6+COnWH+hZLxEQZ4=;
 b=lIjt1Ebi1ajvjOEenVCsGvimxWJZqkE7qKgojA0SGFgqmEHC45nSm5vqUDnzMfBVEG
 Z72m9i6R58+b9RGQxUhvK2FZJkhteJcoL3rS+jkZbEF3DeiXgtI7mJ43IAl54jlZeJbD
 rYYSRHLIlIE7xyAVX6InP69ESpFa8QAWaQhj/V+tjoIYEZo0iP4PZ1SSUltp2V4XnvY6
 4KFcibLOuBbE+6WMmhj1nJBynwLh1c3Q/0OM7LfDprdt9pajweSUWn/I0xPhx70eYu3P
 b130rJ+HdJIRLbS+1ZtF2b4Sk3srAQFrKgwx/FK1XORfcBAtTjHIIRcKgcDxVNPUECVn
 OaZQ==
X-Gm-Message-State: AOJu0YyZ0PGPVEmnRd5BQYC9pWH1GYd8ref22Dond/yhDrm/xrz8o3bX
 NXxBioGfnz5ZGPcHxSqPGayKQ57qodHhHQUlzOs4Zp1vVqzT2/ztGIkse5h3SxKM0J7ORuEjBD9
 j
X-Google-Smtp-Source: AGHT+IGLPaeF1Mhajw5LUcXm7Okc9k8664Y7C6XaWhyDhJU7vp52tqjHKsr0u6L2pHN4qFhHoqBf1Q==
X-Received: by 2002:a05:6512:3048:b0:510:1797:14dc with SMTP id
 b8-20020a056512304800b00510179714dcmr9524256lfb.10.1707137247239; 
 Mon, 05 Feb 2024 04:47:27 -0800 (PST)
Received: from [192.168.68.114] (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr.
 [90.12.67.126]) by smtp.gmail.com with ESMTPSA id
 az7-20020a05600c600700b0040f0219c371sm8532119wmb.19.2024.02.05.04.47.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 04:47:26 -0800 (PST)
Message-ID: <bfe20aef-832f-4917-ad34-902db9ce46ba@smile.fr>
Date: Mon, 5 Feb 2024 13:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240131200754.1784621-1-fontaine.fabrice@gmail.com>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <20240131200754.1784621-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707137247; x=1707742047;
 darn=buildroot.org; 
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DMaPddCvkfZtuTGik7Boqs4NIIA6+COnWH+hZLxEQZ4=;
 b=yfp4mV+U0Ru9ae/qVv2b+du0Sm+HmpNhz6viOg6Q9bVnmqa6idl1ZxiH1j1pXP3upu
 97ug5gGoKoIKxHBKm272E3jlW8H7+dvOFimiCQWZmskP0uMu1TLjmgb9l2TbUNJedqwJ
 YzvpYFwj3a5sDoLxb30KmbYFGCSHmCtWp01MZVckd9U7TxDIiSWzKh2moiKFbFB+cm2W
 RZdkVpXowM+S3VKjP5HjOPtjzqPIU+9dm0sx/8rsHYiZAaydB3trkzeyup9liEhCqQcE
 1XzzhMrUGsW67oYK8Hp90FF2mnDvOiTnUz0v4jRtvTFHKa2cj46nz47rWI7nD+4Rm6iX
 nJng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=yfp4mV+U
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: add jpeg-turbo support
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
Content-Type: multipart/mixed; boundary="===============1190073318666472245=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============1190073318666472245==
Content-Type: multipart/alternative;
 boundary="------------IpQ2SiRaib81TCOgJlwDtMMt"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------IpQ2SiRaib81TCOgJlwDtMMt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 31/01/2024 21:07, Fabrice Fontaine wrote:
> jpeg support is not limited to libjpeg
>
> Signed-off-by: Fabrice Fontaine<fontaine.fabrice@gmail.com>
> ---
>   package/libheif/libheif.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index bd307deb7b..908e2ce068 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -51,9 +51,9 @@ else
>   LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBJPEG),y)
> +ifeq ($(BR2_PACKAGE_JPEG),y)
>   LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON
> -LIBHEIF_DEPENDENCIES += libjpeg
> +LIBHEIF_DEPENDENCIES += jpeg
>   else
>   LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF
>   endif

Looks good to me.


Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr> 
<mailto:antoine.coutant@smile.fr>


Regards,

Antoine Coutant.

--------------IpQ2SiRaib81TCOgJlwDtMMt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31/01/2024 21:07, Fabrice Fontaine
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240131200754.1784621-1-fontaine.fabrice@gmail.com">
      <pre class="moz-quote-pre" wrap="">jpeg support is not limited to libjpeg

Signed-off-by: Fabrice Fontaine <a class="moz-txt-link-rfc2396E" href="mailto:fontaine.fabrice@gmail.com">&lt;fontaine.fabrice@gmail.com&gt;</a>
---
 package/libheif/libheif.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index bd307deb7b..908e2ce068 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -51,9 +51,9 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBJPEG),y)
+ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON
-LIBHEIF_DEPENDENCIES += libjpeg
+LIBHEIF_DEPENDENCIES += jpeg
 else
 LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF
 endif
</pre>
    </blockquote>
    <br>
    <p>Looks good to me.</p>
    <p><span><span><br>
        </span></span></p>
    <p><span><span>Reviewed</span></span>-<span><span>by</span></span>:
      <span>Antoine</span> <span>Coutant</span> <a
        href="mailto:antoine.coutant@smile.fr" target="_blank">&lt;<span>antoine</span>.<span>coutant</span>@smile.fr&gt;</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p><span>Antoine</span> <span>Coutant</span>.</p>
  </body>
</html>

--------------IpQ2SiRaib81TCOgJlwDtMMt--

--===============1190073318666472245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1190073318666472245==--
