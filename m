Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEABEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9913860E58;
	Sat, 12 Mar 2022 17:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eN5TJe4OdYr9; Sat, 12 Mar 2022 17:00:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CF560899;
	Sat, 12 Mar 2022 17:00:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED75D1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED3981A3E
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfC8FPH2EOY4 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:00:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1776E81DAB
 for <buildroot@busybox.net>; Sat, 12 Mar 2022 17:00:02 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bg10so25401802ejb.4
 for <buildroot@busybox.net>; Sat, 12 Mar 2022 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+f9HdqJXer4aI00n4jn8YvaTq7xxrj9W6cYQC3z1a6E=;
 b=NAhd5nzYT/pbjvZ6+tbN/eE1NCHU05UfqtpwqBLu7I414yJaI8CtDKUMcFyO+/xJOr
 dg4mYlC1C6UhGAobTbMR0kxruVTJKSZh6LVkyK5EKjYGsZOYfDl+U8yNSYuSVWKnwNMe
 YX9dtpDIALVNhKpSbp/m5e9uKTWpwcPHJAuLS3HQBqE+WHGy+M5jMoXMa+wOyhDJCefj
 Mfgdjc+KvZCDfPXUnGFm8HVMZUHpFZeBYOmQz1/uTDsrPLoqfh1Abpf1EbWb/zcqr4aH
 zBBRlw87SssTw2ehZyYlswWAOPUIOg5ObEWm/p6x7j8vNU9RQnwMe8EFMvO8vPG/gzxM
 fhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+f9HdqJXer4aI00n4jn8YvaTq7xxrj9W6cYQC3z1a6E=;
 b=YzWCOnL7AXMQF1e9S7g0xLFPeD1VxSNNiLYZCWsW4oWSEgJQJLAKUGfUR5PJLUQp7o
 x8JsGi2FSQX+rSqk9MIj2n3M5SR9symLMCNhX8r8bN7s+QkoJsAyXkI8o0MSx8NsNqRP
 GSlwzrdV/7Ma13hDkBHt1IHNFJGHVX+tmROLQrHqE0Use0FpB3z/0mQmDx4dEpaIxHnr
 l5xEt8su5cqtHjme8+0mOgTsE4tXFZv0IL0O792rjXB5NzgAHvfe1k4ZquT/4+xHXklf
 6gFuiK3MsWssWVelBVUYlgXTHJh5vr4oN9640XxvvYdv2eo1D2OA63k1cyVs5d4Tt8Om
 N8/w==
X-Gm-Message-State: AOAM531627TnxXaJGV7kB0r6jm1+jZMi7TDK/OtMVeuw/pEcHIQAmgYM
 XkW0VzsZUXWccdC7M7xzwOUjKg==
X-Google-Smtp-Source: ABdhPJznJqsxwpcn3u5JNE+i0j1g1bM/NmyRDU3jJ3P5K6voIvaxIPm6gjxhLe9eP/FLdGZ1Z+0ajg==
X-Received: by 2002:a17:907:60cc:b0:6da:9616:ecec with SMTP id
 hv12-20020a17090760cc00b006da9616ececmr13886671ejc.298.1647104399939; 
 Sat, 12 Mar 2022 08:59:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lj2-20020a170906f9c200b006da6f29bc01sm4435185ejb.158.2022.03.12.08.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:59:59 -0800 (PST)
Message-ID: <32c388f8-e0af-3d4e-f370-1d9dece6c1ae@mind.be>
Date: Sat, 12 Mar 2022 17:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, buildroot@busybox.net
References: <20220219102309.15465-1-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220219102309.15465-1-guillaume.bressaix@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libxcrypt: bump to version 4.4.28
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



On 19/02/2022 11:23, Guillaume W. Bres wrote:
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libxcrypt/libxcrypt.hash | 2 +-
>   package/libxcrypt/libxcrypt.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
> index 99ddf62be0..bdda6b47c0 100644
> --- a/package/libxcrypt/libxcrypt.hash
> +++ b/package/libxcrypt/libxcrypt.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  e4ff47b7fa5370fa08e27258f8a0de5cb7e9b09c297ec7ab56a8a82e229a1c84  libxcrypt-4.4.27.tar.gz
> +sha256  db7e37901969cb1d1e8020cb73a991ef81e48e31ea5b76a101862c806426b457  libxcrypt-4.4.28.tar.gz
>   sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
> index 65efa2bab9..f7a0fd4308 100644
> --- a/package/libxcrypt/libxcrypt.mk
> +++ b/package/libxcrypt/libxcrypt.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBXCRYPT_VERSION = 4.4.27
> +LIBXCRYPT_VERSION = 4.4.28
>   LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
>   LIBXCRYPT_LICENSE = LGPL-2.1+
>   LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
