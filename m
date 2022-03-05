Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D87C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2AC60B53;
	Sat,  5 Mar 2022 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmRtti2wR1i2; Sat,  5 Mar 2022 14:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E37D60ACB;
	Sat,  5 Mar 2022 14:51:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C84CA1BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C637C408F4
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0K1b1NcOgTr for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:51:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02AC2408CD
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:51:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qt6so23118258ejb.11
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 06:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+GRft09+TeKD4XJ3dYj8kVlccfC3Bs+7VPRHA3IEul0=;
 b=YUwisWa30sa3yzR9PM67QfCRT9xgo26TpltZcfDWN5XlT0vtLFJ38ZqFVrTKiKD5wf
 QZhjXXSOB9+7ZKRhz4kEnwexfYT0i6Z4q5q7ygxVoEMxI054bxzUNr+iHEmNUu6S+m5+
 RkK3SQrg4cRs+BtfWbKX9CM3LxiKHbhS35qoQS1ag38Kaln6Dt5irgpuZTTPddhctYPz
 cEIOwatp4oSt6RUIE7I6K+rhu5eLyZJvZoboFqqmXmqZaXGizz6gmrJ+8hazo/HWQcwa
 nA2C/GmRKeiBdxn+E5quWeBJG4hHNLzU7st3/0WgdCtoBLxAKf6QvEhmb2n9o8r/MENI
 SKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+GRft09+TeKD4XJ3dYj8kVlccfC3Bs+7VPRHA3IEul0=;
 b=ZsvdlUSm8M1z2xsCBQ2FuaJTzTurw4T1Kgl08XCadesksjHsAu8qVt9liB52sbVPY/
 40lve/VBKAp0u3HN0yRUZLEejnq6n2SC5tnl+81ZBfS+d4hLkAHzEEnJiPsflIocj69x
 gBuinjPPs1RtpBjwY8nIhH7FZo39i0TzlrMg0iqJR7Jh1eSkfiTKPKV2YjecEkRDcW83
 f0MIwP+St8OCxa9EArfrVo/1lvi6zrpWcNpGoPSCylvcb6R4K1dGfQUZ5KRmg8IVNt4+
 9Xk01vre4IAOYox/ctiwaOCGNL7aQ4vtEUjrqc7Bkntu491gBPoaelMqw5hzm88a4aJc
 ZrBg==
X-Gm-Message-State: AOAM532vq+w3u4Lllx7QpuozMIeD39BxrDvvSHRqIkITST5VbbXHadNe
 3doS9wloVXEJCX8KkU7GGp1Ef6z04k6s/A==
X-Google-Smtp-Source: ABdhPJxLV5U7jdamWvpPGm1iwarvZb/eUc16YxP7L3QX5jWe03W5+AQ+wyh7ldex4/PPcHxgEWxqJQ==
X-Received: by 2002:a17:907:97c2:b0:6da:e44c:5d4c with SMTP id
 js2-20020a17090797c200b006dae44c5d4cmr2904133ejc.412.1646491882043; 
 Sat, 05 Mar 2022 06:51:22 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm2924108ejp.223.2022.03.05.06.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:51:21 -0800 (PST)
Message-ID: <2c28b619-784f-6cf5-b2e1-6cae707051be@mind.be>
Date: Sat, 5 Mar 2022 15:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220214154925.6014-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214154925.6014-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/util-linux: bump version to
 2.37.4 (fixes CVE-2022-0563)
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



On 14/02/2022 16:49, Peter Seiderer wrote:
> For details see [1] and [2].
> 
> [1] https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/v2.37.4-ChangeLog
> [2] https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/v2.37.4-ReleaseNotes
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Bugfix bump, so applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/util-linux/util-linux.hash | 2 +-
>   package/util-linux/util-linux.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> index 9c10a42dca..748a36e0be 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
> -sha256  590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776  util-linux-2.37.3.tar.xz
> +sha256  634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83  util-linux-2.37.4.tar.xz
>   # License files, locally calculated
>   sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
>   sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index a25b69d910..891c17d1d9 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -8,7 +8,7 @@
>   # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
>   
>   UTIL_LINUX_VERSION_MAJOR = 2.37
> -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
> +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
>   UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>   UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
