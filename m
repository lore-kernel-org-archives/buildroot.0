Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698C6CCA47E
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2164F4183A;
	Tue, 14 Jun 2022 16:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4sNzC7iKf3w; Tue, 14 Jun 2022 16:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7B794185D;
	Tue, 14 Jun 2022 16:57:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 276F51BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 155B540B73
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mt3SI85ff1wT for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D70E40A88
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:55:29 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id 25so12474915edw.8
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=X0GUdU+JXQYXY5OSUEEkfyjioGpzZFkNqeYA7NaNn2U=;
 b=iTEIUEMMwzrr4MpSY4nhHSRjF2woRSVL9If7KvA3/x4N6akkzkc45ycIkriXG7EIZJ
 Yrm4jZUh793PV+N75Ep2BijFgofrVN4r6+1sH5K9XbIhVmgfTsGVnyhl2D95K31qp5Rr
 2JK5oHoEGfYDUc67FfBQ4V2wzASkcHn1hKFw7vXHLfnYiWzmyDcv3q6g2km8zsNigsLc
 orqsLa3VMPJBUvm1E3ZkoNk7roI/ZiJyuNYAClyvkWKr5SjbGzwfjbcpFQzXg3mxh/og
 xeKl/XHA6+xxREk9jaqaGiRjAMC2LpOYtgvIpCj9n7KtKJPYRmDw/P8Ya2iCOeAcQBYZ
 HTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X0GUdU+JXQYXY5OSUEEkfyjioGpzZFkNqeYA7NaNn2U=;
 b=6/bny97vwT4HwJpS019EZ/rFGLtZfjZ4RyW9x5rCKdTe+kHrnSVoAjId1lNk0nKZif
 KattNEj+0cAk3Eb13mlmJyCyKNyjN7YhFaz4EOTTEUHICcceL+N5Yug00+ytiIuk+NOF
 u/QnJ+PhqJ7ZTZTmb61C0riFtcFV2tlN9XwDfM4Pdr/D697e3hs+5Ufj3RGg3FIWvGCY
 Vyk9G1bgDG/Up7MRatIJCZbg8x0yf9Tfmt4Nj5uN2VtU1V7qD9NqIA36wtzwPcl+FQq8
 y/EXA+EDHUfUkN5H3UryJahmpvAzdKVvoSo663TLt7/igpG0pWSDYK8RY/2AQKUkQSG4
 2Hmg==
X-Gm-Message-State: AOAM531nM1gyn46VTspnFxfMVhXnSHpUPGJGfv1AnJo2N1hj1AUTn0HL
 SQcZNnHtpdXd4CMSfqjUrTzmEyam6JP11g==
X-Google-Smtp-Source: AGRyM1t8DyahOnAYqg5oF0zuWpDZiKsd24Fh7lBKF8Sy9tQE/t2A/tZlSbXoWlLdaKTwdIuvfqOGoA==
X-Received: by 2002:aa7:d895:0:b0:42e:985:40f7 with SMTP id
 u21-20020aa7d895000000b0042e098540f7mr7099656edq.351.1655225727464; 
 Tue, 14 Jun 2022 09:55:27 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 o18-20020aa7c7d2000000b004335e08d6c9sm7383690eds.33.2022.06.14.09.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:26 -0700 (PDT)
Message-ID: <fee7143b-0af3-62c4-1239-cb8f90f2c6e6@mind.be>
Date: Tue, 14 Jun 2022 18:50:11 +0200
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
