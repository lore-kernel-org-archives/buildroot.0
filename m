Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E755DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F6EA404DB;
	Sat, 30 Apr 2022 18:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TyqC_lp5HN7; Sat, 30 Apr 2022 18:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A85BB4034B;
	Sat, 30 Apr 2022 18:54:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDEF31BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA3F34034B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIcJ48Q7qMnE for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4F314032A
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:04 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bv19so21073877ejb.6
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I1JTOAALUnD8iqo3fzsNhCYLz9hjpsXficHR+z3WiCo=;
 b=Po/eYSlR0Jn95hTPtCRSXJ3PxHb+PWnLEF1X8aRUj2N11+Wnmmm4Pcc6aw1sT/ZcvO
 emWOPqcd46CWxkCLrBS6YVlu4UfyhHW49SDWBDLov8S8bOkCATK2Jeui9G4mm462OWkP
 riJNLw//c9FeEKidVcsTlPkUVxxcNJ/KK9RU6Vzd8NmVHypez4pYQWJv07s2sgeomHSQ
 oF2cBG1i8y/Hp5CiybY3rIHPZ43DQXNr+YCT4wea9sbgrX6KhM95firvAlv7tizRO4vs
 UtMLGf/H1beyyfhtGFkgmIhQKfxPPz4oFYpnmIsFxTbr4GeHx4J4j/LubXoUpWL9VJOt
 RHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I1JTOAALUnD8iqo3fzsNhCYLz9hjpsXficHR+z3WiCo=;
 b=xB5NFldEX82VYMMMmoF12uQkm2pohlV244fyd8cmDGUh1InM5VUrrYi9LmqtFzHhgs
 TAwDGH8C95lychlO6zVy8qRq47BHtNqA/IiEuI4voMe3Ey4XQjavTQCTw2kkdDDi8jWQ
 IEMUHiZqL6gwV8XBqx+LUbEWq93qiJD+EcHoVUdirpuOYwQKZMA3B4AtweLP1Z6Tu0Jz
 G9EXW7yChT+QkN92bLF9X3ERC3m/cT66qGHbelIO5NHZRNgOX3Un2HWWC+M4FK/HKqIM
 Kkfo6h2NshEW5Oamkpv1k7Zq7CogVZroz65qhSS6+nM1fnp5BKzpMhehaoQMuJveq2r5
 Ve5g==
X-Gm-Message-State: AOAM531CFdNVqrSdVeGQ+IEby1oBqaNi0PSY5/2B/+DXbQsJ3jKRRRXl
 /B9Rkf0AGTPXZ298w44EcVb5Hw==
X-Google-Smtp-Source: ABdhPJwfyQKwI58yK8my2veqOvka2SyezYVDmmSUYYIwx4m8Iw9QB0EsLSU8TSiaf82ErGSr2kR9yw==
X-Received: by 2002:a17:907:d89:b0:6f3:bd18:51a2 with SMTP id
 go9-20020a1709070d8900b006f3bd1851a2mr4866977ejc.83.1651344843142; 
 Sat, 30 Apr 2022 11:54:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a50ed0c000000b0042617ba63d4sm4381430eds.94.2022.04.30.11.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:54:02 -0700 (PDT)
Message-ID: <99c84381-4b3d-aa48-d3b6-3efc6141ba55@mind.be>
Date: Sat, 30 Apr 2022 20:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>, buildroot@buildroot.org
References: <20220430133050.19519-1-raphael.pavlidis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220430133050.19519-1-raphael.pavlidis@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: bump to version 2.64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/04/2022 15:30, Raphael Pavlidis via buildroot wrote:
> https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.e8k97s2ae0nc
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcap/libcap.hash | 2 +-
>   package/libcap/libcap.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
> index 2cdf92bbc1..7c48cd950b 100644
> --- a/package/libcap/libcap.hash
> +++ b/package/libcap/libcap.hash
> @@ -1,5 +1,5 @@
>   # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
> -sha256  0c637b8f44fc7d8627787e9cf57f15ac06c1ddccb53e41feec5496be3466f77f  libcap-2.63.tar.xz
> +sha256  c8465e1f0b068d5fc06199231135ccac7adb56d662b1de93589252e8cd071e13  libcap-2.64.tar.xz
>   
>   # Hash for license file:
>   sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index ed689ce503..91e02638e2 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCAP_VERSION = 2.63
> +LIBCAP_VERSION = 2.64
>   LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
>   LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
>   LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
