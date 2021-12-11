Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C824DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C7E60D7F;
	Sat, 11 Dec 2021 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylmYgdJndqzg; Sat, 11 Dec 2021 20:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9D560D88;
	Sat, 11 Dec 2021 20:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A85491BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97F4283F6A
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9Eas4_MnbXN for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:45:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABB2D83F66
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:45:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y13so39790327edd.13
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UK9GHy3R6R8f8uTalgGq/LDY7qn95Hx6/n8MUgNdtx8=;
 b=NqyqqyWXv9blek5gV/5vYDHSZRVKpjWmasC092+qsTKCR8hEcBi3OR9QrGBOW0k7f/
 6HhcyDQuNuw0wbQmLVG+duadjyliPOQws/81lSWgbS0kYisuBPlKKWeyRhWk5SqSAxU+
 bky3m9cbth0woxOPu+Yj63LQhaMNGzRIxOlGP+iPMzPsvnX+kL27edbtLZbwdyQ09Fky
 mkHaoy3pYx0M9OjjI88mc91v/MrR09TIpETbH5cfy200lrMIX7rx7+rO+6z2jEoP3gFa
 Wt4AYYwgxYyMXgOdo9dsRrtng78eR1/eQ6VW1S63FBNpn9Z2mGo72PCFUdtf8PcA6/5o
 WNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UK9GHy3R6R8f8uTalgGq/LDY7qn95Hx6/n8MUgNdtx8=;
 b=NeMBFfHPRmwm6XcVkE24581gEqSKoHXDf4seTJJ67pGRIGXuoR8IJnSsASqXRHYSH6
 7K0BoSVLqpsPA12pVE5bSaJR37TntyBg9FYL3WQsaoer10XcX+Z9zpTsoRdmN1h1qXII
 U6ZhF7MGXR8bT//vsVYkk/vmt4MN3dswX+6sjwoFeYXHKTfVuUhOrWc4Oi9AaXoIbwZL
 f4w0GV4NuHURlW596OQAYxIuVuDPPs1VA5ebEN6oW/EEpG+ubpfwNrVmFMN0kUGMqSJg
 snwMBdHqpWYjhrHefxjRQ8TSK2yw4K+qPlFgZ2FAm36oXNKHNvFxHfcidzALLXQUi8br
 z2Bw==
X-Gm-Message-State: AOAM531ZOFr7dwMbMa7TD1WI8KDfd1Yc1DX7UAL+R3ZZDFsrea1+9R0v
 BaxcGquVgm1yYrktA2Le8ypKbQ==
X-Google-Smtp-Source: ABdhPJwcmCTmM98iduWqA5cPrOpV0MtHArKGf3kR+ehNshnv1F6oWANrWB4io8FgAMmXnoTEUdmdIA==
X-Received: by 2002:a05:6402:7d8:: with SMTP id
 u24mr49748984edy.215.1639255510967; 
 Sat, 11 Dec 2021 12:45:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qa7sm3394246ejc.64.2021.12.11.12.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:45:10 -0800 (PST)
Message-ID: <e713eea3-d500-962e-7dcc-817c64baf906@mind.be>
Date: Sat, 11 Dec 2021 21:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211124183936.85937-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211124183936.85937-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/intel-mediadriver: bump
 version to 21.4.2
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/11/2021 19:39, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>   package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index 97b7256e36..1678ea5254 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4cd9f2b4da82883a8ed4fb45ba8f186c32941b5f4f3b7d61f2b2b8c19e634281  intel-media-21.4.1.tar.gz
> +sha256  d62cc04254f57c62149cd8bc135e3562b8dc05c0815362b9a83adf200522e777  intel-media-21.4.2.tar.gz
>   sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index 3c329cbf71..4625831b4e 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>   
>   # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>   
> -INTEL_MEDIADRIVER_VERSION = 21.4.1
> +INTEL_MEDIADRIVER_VERSION = 21.4.2
>   INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
>   INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>   INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
