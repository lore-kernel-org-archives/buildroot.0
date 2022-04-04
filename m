Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71FBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F23B40529;
	Mon,  4 Apr 2022 20:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9r0TpnXt_NeB; Mon,  4 Apr 2022 20:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57D7F40204;
	Mon,  4 Apr 2022 20:18:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2761BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0231F60FB2
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61gAgTp-wx0p for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50111606ED
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:18:39 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id yy13so22406752ejb.2
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/DfHtK/AveNzvBXWBanjgwJxleiilujONZiizxEB1ds=;
 b=SKYEylyABKA9lVWpifts9UnRGZYIEvKyazcHFlJgN1k+SzxGsc8/aZr3ztr+MbmuoZ
 bJgz+P3Kw7bedHBNaGo7/+rJmh/bUBj3UKpDMCdvP135xE50gHguHPF1kkHGu9VfyJHu
 S/XrkTFswsl1z4BzIKW9uJMJf4rLLGw5a2pDKSCBFtNLxaZkMOoW23irQGFztwSLWRN0
 U06cOSQsalIemHBiYsv7+IdsD9lmBytIJTpFVUJuvVYxZvX8q5KpHkLlDb5loAvvKEvu
 4HJPnsY4QC53UskMdMZ12uoZ+GDotfmD6YoggBfh+ZDAnViahLgeFW8iTExqQ9kY25x3
 wqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/DfHtK/AveNzvBXWBanjgwJxleiilujONZiizxEB1ds=;
 b=B66hNtCW5UiBSVWQixWWPM4NecgKyDN7Iv443K0w4xHf1M9TH2x28QHj0Zoi4+dsk4
 2LJFO3K2oxqydQK/thkRUA+oz9XIvXUrvfy9ilqsV7JINtgRjbh/Ar+mI6JcdHEw3CZb
 PCjmRnlRrNRRbIQs68SEyPPPv1Es5qNtwwuLQdGQUnq3ZttaPzHqqTm/fnNV86TcpirN
 noBGhxhwjnItxuCFoTJFR7mwHDjwyNppMsl/JZAxy0mcXsEkbldh7QPf3Cc6m9xMe+K4
 Jj3KPDGdpq7NCryRcAS/fErcAK1vLhr2604JahTs3FzabNdfaATnFt7b9DIpI6rqTTYh
 ZRcg==
X-Gm-Message-State: AOAM532PfBZ0yaBL3c1hhQMh1ilK5vrhhbXrEjYgihK3F/kF5a4tKz1Y
 QPPsubpFBZT1/zcJ3m0L5ed8/Q==
X-Google-Smtp-Source: ABdhPJzpDMswxumhheGfuw8vGKIqMsp8/kwTWJRcPINmrKbTfzD0Xn+Fde9bnFrFoo8DO8irl3mD6A==
X-Received: by 2002:a17:907:9720:b0:6db:a7d2:d170 with SMTP id
 jg32-20020a170907972000b006dba7d2d170mr1888639ejc.187.1649103517625; 
 Mon, 04 Apr 2022 13:18:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709063e4e00b006e73392e592sm2822828eji.209.2022.04.04.13.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:18:37 -0700 (PDT)
Message-ID: <fa41adb7-2b7e-c4d1-1d42-ce199e9a13c3@mind.be>
Date: Mon, 4 Apr 2022 22:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220404163926.2601842-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404163926.2601842-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 19.2.1-Matrix
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



On 04/04/2022 18:39, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
>   package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> index d40a068cb5..1f290b9331 100644
> --- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> +++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4c5ad45ba869c8064a0d64d7fc5c0a2e0c9f47f51184823872d6cd888ab7b2a0  kodi-pvr-waipu-19.2.0-Matrix.tar.gz
> +sha256  61779eaac29930cfd7f2c23da44a27fdecb695252fbab9598c49c57ce8be7291  kodi-pvr-waipu-19.2.1-Matrix.tar.gz
>   sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
> diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> index 61c5bd67ae..19c750945e 100644
> --- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> +++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PVR_WAIPU_VERSION = 19.2.0-Matrix
> +KODI_PVR_WAIPU_VERSION = 19.2.1-Matrix
>   KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
>   KODI_PVR_WAIPU_LICENSE = GPL-2.0+
>   KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
