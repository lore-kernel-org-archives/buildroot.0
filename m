Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDECC43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4B1417D9;
	Tue, 14 Jun 2022 16:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DmyAapL4dTl; Tue, 14 Jun 2022 16:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314E941684;
	Tue, 14 Jun 2022 16:56:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B93041BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B465D40B73
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PoMx4hQpmXxS for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C244B40A88
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:55:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id n10so18362602ejk.5
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=X0GUdU+JXQYXY5OSUEEkfyjioGpzZFkNqeYA7NaNn2U=;
 b=iN5TxJShHJDl0/QxG1XAD0/6/xp82aafDVfUsSe5o5j9zyNBFCuJYBGrvtsvqHvrIr
 HEdcqyUSGNjizaFkxwWwP4HnCv3P2+sEA13lAQBcDWQGFvgOaBHiTN0IBU76rfTAvgH5
 0zsgbHXbHLAR6+/jHoZbSKLzju+wOvhPvLKH0l8t7YKFs2mN6EHrjUPvs61p1xR7GFm9
 gdFpXHs3yJb96KY9cVWUA+cDxxwxtS0aHZmFpNK7slKlVQ1aqH1bio54qnAGSB9p9DRl
 FwJ9xLMYrPrRAs6nZz/y4YuYeJSmL3g2qNaLkzRQ2QXSpv/+9a0R2VTq2dEOdGcCobWe
 WRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X0GUdU+JXQYXY5OSUEEkfyjioGpzZFkNqeYA7NaNn2U=;
 b=Rjvuk2V7iHSIKwh55iO30BK6/1U3TbdDGrqap6Rcemn2u3zTUofKKNoF7mQOz9O5Yd
 pgCGigO0ZeWs8ilx8B38I12+ozkz/xfkmJ3m+j35Te/ImHH8/UUQ2SE0U/bdHCyA38ki
 qlntcrVoxK5E0c4VwSammqqRIfL25ztvOE7lc5VT6m9FbjZXaehiMtMqg9PzocBjqS/4
 sUrmzhJIHiSYnLHKp+xXj3HuB70VS+ktS2rNJYGHnSBo31R9NG0PpS9A7oUrGlYYHYZL
 F/dYcBZrHhhAtTM3kUeO/OQOAke0dyI2X3r19zpUL2JiYGxC3cwD91wy5Ev5G5SSPE4B
 C5XA==
X-Gm-Message-State: AOAM533rRf/eP9Ili9pwFkoos8sXx719on5gkT9xTwEDus4OHAKDEbdx
 vdAjkvT/KY3o/tWjeJYbJqXxWG77WrbD3w==
X-Google-Smtp-Source: AGRyM1u+HFgw05acBC4LeQV5nrPb+TbDhwrpOuwixxejGTJoOjZgdyNC5UtzWDl19yq+CYsYVCLC5g==
X-Received: by 2002:a17:906:7290:b0:715:7401:6ed8 with SMTP id
 b16-20020a170906729000b0071574016ed8mr5179080ejl.76.1655225724968; 
 Tue, 14 Jun 2022 09:55:24 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 w11-20020a170906384b00b007104b37aab7sm5217433ejc.106.2022.06.14.09.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:24 -0700 (PDT)
Message-ID: <18a56e28-6e0f-29a0-2951-33ef3748cb9c@mind.be>
Date: Tue, 14 Jun 2022 18:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
References: <YqN7MemqvW0pXxC3@hs>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <YqN7MemqvW0pXxC3@hs>
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyproxy: bump to version
 1.11.1
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



On 10/06/2022 19:11, Alexander Mukhin wrote:
> 
> https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.1
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tinyproxy/tinyproxy.hash | 4 ++--
>   package/tinyproxy/tinyproxy.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
> index 8c58b98ca2..84e98a84ce 100644
> --- a/package/tinyproxy/tinyproxy.hash
> +++ b/package/tinyproxy/tinyproxy.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.0
> -sha256  c1ec81cfc4c551d2c24e0227a5aeeaad8723bd9a39b61cd729e516b82eaa3f32  tinyproxy-1.11.0.tar.xz
> +# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.1
> +sha512  2e3435bbfece3797c11ccce222eef494ed92e00dd82bea2c40a54e454b7e03c8abc8e09b244f2da7192209c39047369439d08974b79eebc996fb3095230d0374  tinyproxy-1.11.1.tar.xz
>   # locally computed
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
> index 3930e90d72..6b5a3f9625 100644
> --- a/package/tinyproxy/tinyproxy.mk
> +++ b/package/tinyproxy/tinyproxy.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TINYPROXY_VERSION = 1.11.0
> +TINYPROXY_VERSION = 1.11.1
>   TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINYPROXY_VERSION)
>   TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.xz
>   TINYPROXY_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
