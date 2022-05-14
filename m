Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0108BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC19E83FA9;
	Sat, 14 May 2022 09:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OofXalBTlSQ5; Sat, 14 May 2022 09:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6DF283FA5;
	Sat, 14 May 2022 09:48:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 533581BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42508403C5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhIcHgK5nVSX for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:48:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13C0940861
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:48:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id g6so20364572ejw.1
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dNIYYx0oTuY4z0dtvDxXBPcTS83iVp5qGzMkvP7VrcY=;
 b=NFkXEbMkmUDr0ABKXiq8TuSOlBKFQnjSR9tmYeVzEdfxJ6su/6235pU/cxfAw14Rfo
 E8MxIWLlEsDP77igP8imLzub1s0vUP56VEJCyULePTgpDyiJyPZIE6yIayD+MzZgOWTv
 fg7UuxBv0EBhd6fnlSskyiMNmUsRXZkyust5soQWbinUPTXUWva16MEtuSACemFcLACY
 6GF34Mm8cxFvvPqhyx74hodFyUKh4bd703wsKMe9r8cd1fwG5rE0wCsXyNfdR3GOHIbB
 ouEHuECzjKeTMcCqX7dsjPVdEqeM6xCGDjHdw3VdfdRf0COr09zy09Tgk73R8lPj+eUh
 fHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dNIYYx0oTuY4z0dtvDxXBPcTS83iVp5qGzMkvP7VrcY=;
 b=l+e9REAiRChXsVLiuGs0Zszv2kGsKzrKaC5+Z9mjI7NRUej5LqUHaKg0jvw+6bm6Ot
 XuhQFdWrungr9Pcp6JgYYSmlwoSb4F+q0f9hhTMgvB68+yunTVzzR6RqspNKWoxOzpsx
 l6eF1+hC/THYCpVJs/aLlQrNqW6XODNkEOsece87b4BRg5F9PEg6JT1HttEm4WCFfgH9
 cGAAVmxkRC8hH0asusiLEU0zDgiRmo42m4Tfc0uV9tcaRWwufihCzUS2qEzjH1XS2Pnn
 Z8fcia4a+VDiyZCpRpjt+9PAyLsEJw8bnrQ9beBmsvafK+pj2aKU6XsNwF7FXuYm7Anw
 yMiw==
X-Gm-Message-State: AOAM5312dqkTeIeMQ6IAsXlpL43KpU/BHho2r0TmDnHxxmrJoV2u4XvI
 7yHDeM0BmTIB3hBfy17OOQZw4g==
X-Google-Smtp-Source: ABdhPJyHoK3woOdL1ieKM2kJBS517/mRMSSsBTxYiJajs4dajuPVVrM2ZsNmc9XOUi2EuBm4r/C6nw==
X-Received: by 2002:a17:907:7ea9:b0:6f3:de9c:c6fb with SMTP id
 qb41-20020a1709077ea900b006f3de9cc6fbmr7748905ejc.304.1652521700164; 
 Sat, 14 May 2022 02:48:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qx16-20020a170907b59000b006f3ef214e53sm1558883ejc.185.2022.05.14.02.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:48:19 -0700 (PDT)
Message-ID: <63586ad9-4812-2409-b393-25559d9db87d@mind.be>
Date: Sat, 14 May 2022 11:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220512203009.1464190-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512203009.1464190-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 22.4.1
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



On 12/05/2022 22:30, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>   package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index e6cd7a1cd3..6ca3867908 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  f070527b141174970a17195d0225ed43693c39fec83cd5e6d0effaa88e2a5553  intel-media-22.4.0.tar.gz
> +sha256  5589d4e0142ae957d58798e3fba08d9e5e096e92eed422d40a82d45a14e6042f  intel-media-22.4.1.tar.gz
>   sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index f3833fcc45..f03dd03260 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>   
>   # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>   
> -INTEL_MEDIADRIVER_VERSION = 22.4.0
> +INTEL_MEDIADRIVER_VERSION = 22.4.1
>   INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
>   INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>   INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
