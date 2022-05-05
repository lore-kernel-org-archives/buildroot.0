Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4BAC433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8590760ABA;
	Thu,  5 May 2022 21:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBUn4L-n_YR7; Thu,  5 May 2022 21:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E4E760A69;
	Thu,  5 May 2022 21:00:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B85B1BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE11484018
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2QNuF3Bf3Vz for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:00:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAFEA83FEA
 for <buildroot@busybox.net>; Thu,  5 May 2022 21:00:12 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ks9so4533187ejb.2
 for <buildroot@busybox.net>; Thu, 05 May 2022 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3uiXqs3hX2DSVH3daqfrGO4PSsV7v38m0naDhKOEU5o=;
 b=FlfJquSA0DwFDpvJoZ4VU42ANeRitaO/ayZH+aRPAbkAWLnQwFtMYkLkwiVLuYD64d
 ZnWnTcHIPfeGj1DxvCPR+2eFWEzGYCuMIO2a5P2V97K+6bEfFHYWuyNw0tHsJ68OXRyU
 zJjgLL7uYSgiK0/DqAsbFy8DaCZqKTMk2/Qr6zVN5YvTEQtGwfy+bCjxMbWptDcbzIBm
 l3MeRyDLvvyPzkg7BrL+SBfCSeZqFAjjlE45lgvcklQc/O72uI/smRvT+E111zdfci9P
 9GoRvxK3fVKmmKjr4rVIAVHQRT+wPZw3yULvlzgrlsNDXuVGpMqubUC3UIZ+2zceJ9En
 FypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3uiXqs3hX2DSVH3daqfrGO4PSsV7v38m0naDhKOEU5o=;
 b=J+vtZXigyKIFF8ox/Fl2VzHjry61+pEfIclKH2S315s/EX+zff6qyYJ2Umx3KRDZay
 OqvGyP0EYjIxXmWFvaSZrJr61RUoa7jmYTPdSGM53GPxRZVYt9m1oZciadG9/rx61AK7
 6R1PxZe5TgNl+OdrpmPw69YXUSKIdQRQ+YQU7LPV7rbSTAj79Rrudp05FEJ2Nn8yl5fY
 5cUyl50gNBBfIYsbhZy4qSi03VIuPCokgrbUa7HskypjaYGEnWvvdndpEFuzyHJJirzP
 axeaQwkxY7TTdJctAapk6T/3aKPQPRxxQXv2POcZ69P8aza6ZUf5FYrOuGDxFoVW/26t
 PA2A==
X-Gm-Message-State: AOAM533hskmg+vxiWHeNvcIEyfOltKy2ANrCq3usCgKli22ke4Rt216z
 jKK4bCRuyE5eAVz9J21kj+K87g==
X-Google-Smtp-Source: ABdhPJyDq+sjNi/tniE+ysvr5shKxYoZKu/cdSyL8/WjHT+zO6DzX2YBbXDStWH2AOeJhNnB4JNqxw==
X-Received: by 2002:a17:906:594a:b0:6f3:d242:8d64 with SMTP id
 g10-20020a170906594a00b006f3d2428d64mr78011ejr.34.1651784411107; 
 Thu, 05 May 2022 14:00:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a50fa9a000000b0041d893ed437sm1317074edr.2.2022.05.05.14.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 14:00:10 -0700 (PDT)
Message-ID: <3b075565-f537-5faf-ec66-a59dbebdc8e7@mind.be>
Date: Thu, 5 May 2022 23:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <6b4488278264afdbe3614a452671c3a89220e2f8.1651720827.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <6b4488278264afdbe3614a452671c3a89220e2f8.1651720827.git.baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH] linux: add a comment about
 CONFIG_EXTRA_FIRMWARE requirement
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
Cc: Charlie Leger <c.leger@borea-dental.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 05:20, Baruch Siach via buildroot wrote:
> Explain why the kernel needs firmware packages as build time
> dependencies.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   linux/linux.mk | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7ff7b05042e4..e0a1ff74f998 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -70,7 +70,11 @@ LINUX_MAKE_ENV = \
>   	BR_BINARIES_DIR=$(BINARIES_DIR)
>   
>   LINUX_INSTALL_IMAGES = YES
> -LINUX_DEPENDENCIES = host-kmod \
> +LINUX_DEPENDENCIES = host-kmod
> +
> +# The kernel CONFIG_EXTRA_FIRMWARE feature requires firmware files at build
> +# time. Make sure they are available before the kernel builds.
> +LINUX_DEPENDENCIES += \
>   	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
>   	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
>   	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
