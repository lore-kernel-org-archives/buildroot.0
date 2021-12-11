Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D68C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D19161355;
	Sat, 11 Dec 2021 20:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FnCa96O2QpG; Sat, 11 Dec 2021 20:45:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F290A60D93;
	Sat, 11 Dec 2021 20:45:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C14A1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B28142568
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2p0ks87JsyOq for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:45:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F46F42566
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:45:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r11so39635032edd.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z2UFQ7lL1C7vDM4ae2H5FRatYgtMBp9OApRUkArCpg0=;
 b=TBdfL9zf7IXQwwwR33EBZm9cVEZ7SXplQrdD76IMIuXraNx76dhLrYvu1DrZ9eNAoB
 Kh3gBl7g4S1RuVD+L4Eagd7nEg9vjIygI3fudkGHUXVKub2/+PbQasXHc3m0+gffIwWp
 AXZj1LFlOGawnpC1lyR8HKoS9TL0DCP9jEHAaLs4puO5qizjNV/Znw0HebuuVwjtsI6U
 j++xGXy3hMvfNgbVB93R5xgPvyOjkUSrBhvQ40mFvu18oBnPNwDFHedAhll+G/8GNCIN
 T1Ig7MLM8YoKhGRxIIP/qWNkTwu4rc+Y9PNNGp9L6N8v09ilacise43IYGbKFJVUtG7C
 zDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z2UFQ7lL1C7vDM4ae2H5FRatYgtMBp9OApRUkArCpg0=;
 b=UrDu2i8iEUEaVQyU1Yi2/evW2VhX8PdyrBFSXw9n7Km1GUC5a4co8bMaGZ5EHsI5eO
 202i+YsM/LuEv014CAwy64wIgx5EzLIcTTBMoyxg0IgvAXBxlbWziqm2YNBUuhVwiccz
 iw2ZKhfEyY12p63Xx3wms/R3Xa/Hx6vxn3QmN8kGQ+LZjoirSCFuDG/zODjmbE1zLhZg
 lmkVP8Q7N547YY4jph4GbJ3QFt6pFrWKdSkZkV9fHj0IvsiY1sdcoU50DcmObtY+XqcE
 3kYYhCKbQ8MbTvbrhneIfyf2vE33LopoPPK00NRzeSu1fyMH8TKuHP6HMpzxaQpJJBEf
 VhQw==
X-Gm-Message-State: AOAM531X6Fu8IucdXAnh2V6MQnJmraL5efe7OOi0enBkmyKAXhVwpdAc
 kA1wc0rqtwtbeuwj6gjGP1B3Lg==
X-Google-Smtp-Source: ABdhPJw19HPH6oE+/QvJepD4jD3FhL/XPDGx78g2frPwFWvEn4xBMczY+vxrxVoLKu7e5+V+9Brxow==
X-Received: by 2002:a50:cdd9:: with SMTP id h25mr48583724edj.0.1639255529600; 
 Sat, 11 Dec 2021 12:45:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x15sm3563668edq.65.2021.12.11.12.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:45:29 -0800 (PST)
Message-ID: <8645c53c-a3f2-06e4-5219-fa9350b8ee9c@mind.be>
Date: Sat, 11 Dec 2021 21:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211124201255.6736-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211124201255.6736-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH/next v1] package/libv4l: fix typeof realated
 compile failure
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/11/2021 21:12, Peter Seiderer wrote:
> In case Qt support is enabled use '-std=gnu++11' instead of '-std=c++11' to
> enable c++11 support and gain support of the typeof GNU extension.
> 
> Fixes:
> 
>    - http://autobuild.buildroot.net/results/2d58906a1eefdf921b42f6c0d9fd680ef2ad6e27
> 
>    In file included from v4l2-ctl-streaming.cpp:14:
>    ../../utils/common/v4l2-tpg.h: In function 'void tpg_s_hue(tpg_data*, s16)':
>    ../../utils/common/v4l2-tpg.h:49:2: error: 'typeof' was not declared in this scope
>       49 |  typeof(val) __val = (val);  \
>          |  ^~~~~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libv4l/libv4l.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index b11c8975d1..4dc0f15f94 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -71,8 +71,8 @@ LIBV4L_CONF_ENV += \
>   	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
>   	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
>   	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
> -# qt5 needs c++11 (since qt-5.7)
> -LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
> +# qt5 needs c++11 (since qt-5.7)/use gnu++11 for typeof support
> +LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
>   else
>   LIBV4L_CONF_OPTS += --disable-qv4l2
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
