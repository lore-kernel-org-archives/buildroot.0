Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E13CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25B464043A;
	Sun,  7 Apr 2024 19:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPr4oCEevW2D; Sun,  7 Apr 2024 19:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AB08404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AB08404A3;
	Sun,  7 Apr 2024 19:34:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53B4D1BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4032C404A3
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqwkitIMtu2e for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:34:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 342A04043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 342A04043A
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 342A04043A
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:34:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-343d2b20c4bso2261814f8f.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712518458; x=1713123258;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6FL6q9PNkfxVrNbvThM3m0dUjfb350T3KTJlh/3MbJc=;
 b=Vd9tZ4RlADRqkrLmVr9ytlRcPJy1b+hj7GQRoLYhgc+psemRJO8S0KFwseM5c5I8ZL
 KNCs3W++M9b5ZI5q1NuNdBnEth3h8UlE2Q5F57jUOfsWzTHlMEcO3jRp8ET0Sy8Yly2A
 PRztZkZZphUWN21MZW0PJm6SGlPoNdsTQuFjbELgR/H8b8eNiPoyh3nxm1khQddfcpBM
 rF+65KFly7D3WvEf1isvVWkkQHHDjZOQkvLU9+nCezgR+QGf6JnAgMUJ9o4NUOVrk3Rf
 sSRclzKIe2zJGVn4HGhuHM1eH/iyenqAPK2CxaiMAGJUsCxgpA97cPP5kNXk/dZZ4nw2
 w+TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHIK1T8L0E0hmI7RCf/IxSou6VGuObCiJQRLIaFdQNFx2iweNzAezd8sT/hGRsgddATtmt/wvWiEaQcvryBjtKW5SIPd/Auw==
X-Gm-Message-State: AOJu0Yxa3A3AZNRmCA6TRixbtRb+uJxYAH5cmX4wep/76k/2Ydt7vRUg
 oPyvr5oUuOCYzfbwMppKGwqWpVGw+UDjon+vCBq3Lvjz29m8u6lOBYUkdBHhd65mCwkbOD4Z480
 4
X-Google-Smtp-Source: AGHT+IGskb+i+RoVr391pIRsLpaSv+81DdQz2qBaXIRp8dBp0aX1wvVEVUfSg1Tih7t/md3vawqrjg==
X-Received: by 2002:adf:edc8:0:b0:341:e368:a50d with SMTP id
 v8-20020adfedc8000000b00341e368a50dmr5058373wro.18.1712518457951; 
 Sun, 07 Apr 2024 12:34:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056000180c00b00341de3abb0esm7233782wrh.20.2024.04.07.12.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:34:17 -0700 (PDT)
Message-ID: <a91d1f97-273b-4adf-b5e3-f908d8899f23@mind.be>
Date: Sun, 7 Apr 2024 21:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407120652.888743-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407120652.888743-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712518458; x=1713123258; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6FL6q9PNkfxVrNbvThM3m0dUjfb350T3KTJlh/3MbJc=;
 b=SgsV6DXGrOewcYjBzWgV4qdqYJqzqFgjJNTNz/KpmvWmk6Qm4P0kcslDG4jVedE76u
 BJTf+0lBDU8y/Xg430pgn5vfxnsfRdTVn08zq3GqUSUjB4Ei493BkghUBQ/O7imSfWid
 c+dGjaMscswnQp2l3u+/2sVWyGSva1KKG83yofwSwKCB65bcPek5iI2Irtow4qXhhQIY
 f7oFWDo6UW5jyI8XUKRjW5Z0eJwN17Fq5uilG1mZlMYHUWLHw6rJVo0Vet8go//r02Aa
 LF4EaLa1uWEis3hM8GWuu4mQgcmDqg2j9adbzWqofm81NjHZsDoEs0gEfgQuVekr9+dy
 yLGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SgsV6DXG
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: use official tarball
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 14:06, Fabrice Fontaine wrote:
> Use official tarball and so drop autoreconf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libxcrypt/libxcrypt.hash | 4 +++-
>   package/libxcrypt/libxcrypt.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
> index f021436b71..9bcf119077 100644
> --- a/package/libxcrypt/libxcrypt.hash
> +++ b/package/libxcrypt/libxcrypt.hash
> @@ -1,4 +1,6 @@
> +# From https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz.sha256sum
> +sha256  e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943  libxcrypt-4.4.36.tar.xz
> +
>   # Locally calculated
> -sha256  b979838d5f1f238869d467484793b72b8bca64c4eae696fdbba0a9e0b6c28453  libxcrypt-4.4.36.tar.gz
>   sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
> index 8cb6751442..d39186eecb 100644
> --- a/package/libxcrypt/libxcrypt.mk
> +++ b/package/libxcrypt/libxcrypt.mk
> @@ -5,11 +5,11 @@
>   ################################################################################
>   
>   LIBXCRYPT_VERSION = 4.4.36
> -LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
> +LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
> +LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
>   LIBXCRYPT_LICENSE = LGPL-2.1+
>   LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
>   LIBXCRYPT_INSTALL_STAGING = YES
> -LIBXCRYPT_AUTORECONF = YES
>   
>   # Some warnings turn into errors with some sensitive compilers
>   LIBXCRYPT_CONF_OPTS = --disable-werror
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
