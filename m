Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389ECC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43704183D;
	Sat, 23 Apr 2022 16:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4C705DiWK99; Sat, 23 Apr 2022 16:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B694E41520;
	Sat, 23 Apr 2022 16:31:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 470411BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B458272C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJpLAJK2S5f9 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:31:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F17E58272A
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:31:09 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g20so13856568edw.6
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=A7gesU8r+giG/LQ+7BPUt2YjXKV6m2kHZH1CopXoLpo=;
 b=DFkxIFuS74nciX425bjVE9wOOvNb0hPGIPE+xQBd+KCpeJcfBtfTgPoCJ8a7Qc3Km2
 l3QdJLolLADsmNb+qUOsF6OETKpeQ4GJcG9YBqDzI6vAXl30E1wX2DXDiRYx4ftXI6vj
 4CFDtx2e0P7WAk6Fi8hdRFsd6FSv/eO0eaeMfyUqsNA/hjRUSBI4aQoi7+eAbTFRO0TQ
 q1AMewpTFhzn8l0zMdkazBwO1+JFVRauM4+FPF4or43TSJyohoougoKCp3MW247LjkNn
 ncRRHijeEhJvCUnUzPcdYNgqNhEH9x6hAtnM8IJuivVVl8WgpmRhBQ8ANl14XmJXnjOw
 DzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=A7gesU8r+giG/LQ+7BPUt2YjXKV6m2kHZH1CopXoLpo=;
 b=yMGJiOG2ZlmAyZkmWLVMyHAP2Si9AFCdjUNdI4WCRslzZDzwkPp78WYrTsj79CvAgJ
 JOAyET1OqMcWReugmfDQaeD71bqmQBPl/DZDQoJxyJjxl0E0rym0vc+mf3Yzee2T7M4j
 xz1TCRBUg8yuElcdLkO0Ieus97WsT0L2MxG2HgYn5FJZBPyK9bvfJxTpgs1K0wosyQ2z
 qvnAJ95gyPXmj6Ig64z6h4W7WQ67XcxYcMJcQmoXvI3z5/2fDibGmeaEA+luiZNiyRBW
 IpqrPEMdYIW2tiEhNLdBEor8wecHZXLezAviKmzbC0uH4d6oPGc1q3Pub5+orQkV+B7Y
 lLnw==
X-Gm-Message-State: AOAM531a5k6XSjsDeAqITaRu7XIbib/iktEG/ysRWv9mJl3oxyaiOfF2
 eAkBJdtelYY2uX7eHeS1cBNzgw==
X-Google-Smtp-Source: ABdhPJwkd4MqL9A9TtXRMExP1d5zkXtOXN1N/HLAz+jR5HoWUuU9nKN8GF5LaSk0VFshBzpKwbk9Kg==
X-Received: by 2002:a05:6402:438c:b0:423:f57a:596f with SMTP id
 o12-20020a056402438c00b00423f57a596fmr10493546edc.367.1650731468144; 
 Sat, 23 Apr 2022 09:31:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm1811988eje.183.2022.04.23.09.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:31:07 -0700 (PDT)
Message-ID: <54ceb68b-1dd9-f0d4-a3ef-d6116e26766f@mind.be>
Date: Sat, 23 Apr 2022 18:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220421171257.2675041-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421171257.2675041-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version
 to 19.7.13-Matrix
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



On 21/04/2022 19:12, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
>   package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> index 0b88d5c747..4f9a60e942 100644
> --- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> +++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  07d96b1b0c3b464c0bf02279fa8cab9ccdf675344129f3a970b14bafce225fb4  kodi-pvr-zattoo-19.7.11-Matrix.tar.gz
> +sha256  64fbbb6c816993b39d35fa000e76b9cb1846ae8ae580e807da943f51e4a3afd7  kodi-pvr-zattoo-19.7.13-Matrix.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> index 95c5de0925..f2badeaa05 100644
> --- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> +++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PVR_ZATTOO_VERSION = 19.7.11-Matrix
> +KODI_PVR_ZATTOO_VERSION = 19.7.13-Matrix
>   KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
>   KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
>   KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
