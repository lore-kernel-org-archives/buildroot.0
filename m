Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B47C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35D68336F;
	Sat, 23 Apr 2022 15:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arebG_z_G7J5; Sat, 23 Apr 2022 15:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DDD1832EB;
	Sat, 23 Apr 2022 15:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D87351BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C51EC60BA8
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23WEUQR6UCW6 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:08:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3461605AF
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:08:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l7so21625265ejn.2
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g5y7wUdaBIfT9Sf3J3I9rP4GjK4/Q1tuGoTSUIR9BYw=;
 b=GcOiuj4m2dkKwrwsUfanGIqAxlR++iHTmIPW9FdJRdczImij6etbWq9vOcWH4SMSXm
 sa0RHVIB+ZwtgOhnVNNbnOTwcCW3SN12vHY0dKfWJhOJACizHiNVzVuwOc5i0YmbbjoY
 wVrYRXeWc3nr4fzd/gDqL+Hh0TTk7wuQTYPTNVKznjLUjKj+uIY24O2YWB5Wv1/wbNAF
 b5kg1X5HI+tseueVsLj2vNjScmV7Zx1aHvODnFUDYdOanXJd+1BWZW0+s1gwiqDN4Kch
 Mb+4Oz8/uRT6RNJsr88qRQn9CVtcq0moUlCjcnvOeCs19lj4rj07hqU6i8R9zIjSZaL7
 S0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g5y7wUdaBIfT9Sf3J3I9rP4GjK4/Q1tuGoTSUIR9BYw=;
 b=Gv/AuOQI0IdUNE5/TaHS2lRTYUSzu64+zSDIkIKcApMV91X7NDMtBYkYKX9HjLj8G9
 +Bo5tbeb6DJreF7hdG3BknCKbkFFeBkHCCnMdUwmloyuU2AUMrBF0Ht3RBr3Y/qxn5dM
 7Oez3j5njBUN8i+RIIAtFHqXs8r09YIQ1ifLJzgbQtLk6dP1778O9JzVW4s3SsLuXnak
 +EXn24yprIvNg9nzSHL7NTLhkwuWMXncvF5XIypvVNiNFiRZCHtcgoCJm6zzYOdXcHBK
 hH9jRqk/Bj0oTNC3D7xsPPGz3HdpUvUFuKLdhUFSA905o+cOZ4dTxCGQxZqoAN4cBfUP
 loBw==
X-Gm-Message-State: AOAM530+SuYbXx4VSX26MvEAkgpkoIWMm7yMoCPeaoNYzFMsaaL4pSXE
 9vMSXqBB5iHFXvO1Q04eeqPIgA==
X-Google-Smtp-Source: ABdhPJz/s3kHLkR9EH/NVcmZYQVs0HhXTYKaxQov+gvx7+B7t7/Sh/33EsyF1DEHgpUAZ2nXedBjhA==
X-Received: by 2002:a17:906:a0ce:b0:6d1:cb30:3b3b with SMTP id
 bh14-20020a170906a0ce00b006d1cb303b3bmr8663292ejb.582.1650726487916; 
 Sat, 23 Apr 2022 08:08:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a05640240ce00b00425ac5f6addsm2352281edb.89.2022.04.23.08.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:08:07 -0700 (PDT)
Message-ID: <bb0b255a-87ce-cb09-0b13-6d876aed1f24@mind.be>
Date: Sat, 23 Apr 2022 17:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20220419184756.255846-1-b.bilas@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419184756.255846-1-b.bilas@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] packages/libwebsockets: add patch that
 removes duplicate LwsCheckRequirements
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
Cc: Bartosz Bilas <bartosz.bilas@hotmail.com>, fontaine.fabrice@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2022 20:47, Bartosz Bilas wrote:
> Fixes:
>    CMake Error at /home/buildroot/autobuild/run/instance-2/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/libwebsockets/libwebsockets-config.cmake:35 (include):
>    include could not find load file:
> 
>        LwsCheckRequirements
>    Call Stack (most recent call first):
>      CMakeLists.txt:54 (find_package)
> 
> Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...emove-duplicate-LwsCheckRequirements.patch | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
> 
> diff --git a/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch b/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
> new file mode 100644
> index 0000000000..fc76a2b610
> --- /dev/null
> +++ b/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
> @@ -0,0 +1,26 @@
> +From 99a8b9c4422bed45c8b7412a1e121056f2a6132a Mon Sep 17 00:00:00 2001
> +From: Andy Green <andy@warmcat.com>
> +Date: Mon, 7 Feb 2022 14:48:55 +0000
> +Subject: [PATCH] cmake: remove duplicate LwsCheckRequirements
> +
> +Signed-off-by: Andy Green <andy@warmcat.com>
> +Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
> +Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> +---
> + cmake/libwebsockets-config.cmake.in | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/cmake/libwebsockets-config.cmake.in b/cmake/libwebsockets-config.cmake.in
> +index 6247b2cb..8ba97e6f 100644
> +--- a/cmake/libwebsockets-config.cmake.in
> ++++ b/cmake/libwebsockets-config.cmake.in
> +@@ -32,6 +32,5 @@ endforeach()
> +
> + include(CheckIncludeFile)
> + include(CheckCSourceCompiles)
> +-include(LwsCheckRequirements)
> + set(requirements 1)
> +
> +--
> +2.35.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
