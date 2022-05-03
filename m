Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC40C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 09:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA86B827FB;
	Tue,  3 May 2022 09:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6h4TJF2V-EbO; Tue,  3 May 2022 09:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB3D8277E;
	Tue,  3 May 2022 09:12:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4AD81BF279
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 09:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91FB88277E
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 09:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GIyItdkcZIO4 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 09:12:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41E2F82779
 for <buildroot@buildroot.org>; Tue,  3 May 2022 09:12:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id p4so19232165edx.0
 for <buildroot@buildroot.org>; Tue, 03 May 2022 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xu6VMdjBNMDynla+Lh3IuS6rdwKkSH2AInV6BiKfaPM=;
 b=G9upd1E9sD2dVDusmuthgt+SKx0yv5M51SG9TrOkRQ711p5SrPrg/5HqKkFsznKAon
 3xWXx25kdYm09IuZeqeb5JOtxJ/rHhMITEoWljdl4nX/Y8AMDapfApB64BocUKMfPJxK
 a0A5RFWc8+pWXOVBJTpZONr8DWnZJTyJirgaWGJsSp84ARyDpfPwii7fga4gNqmSnxXy
 Foo+97DoFE1ZXTuoYMZy6r5MnirdG0wk9YLzHeYuTIUVFiDp3uMXTaaP6blRS1p3HKWx
 /2EKvJpzi5hTp3FgYZhnAWftpZ57ovtno+0Id55uU06l9NZTmsLR5tGGY845OyZ5buMt
 KCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xu6VMdjBNMDynla+Lh3IuS6rdwKkSH2AInV6BiKfaPM=;
 b=yZ95EwGuT1IPvb0BKx8tEV5uTqOFp/21PMVJu3Lz4fFpdsKtG3UIOJNOSecGNtG24q
 CVGKvcAdfCgfqQgXRNvUCbPnGqqX2Y6+BrdUAzEpwYUBfLMXYlmYt5Z22XYuDA5UhuEJ
 PYEqkBJYMHPP56A3YdmUcPHREp7nILSdzCUWmDyoCaMezqR/iK6Zfh2qt1n/0brVimfe
 LrkkL8w4O2ZLn6vnyuS6rxKqtvL5w3oV55XGgHe4Z5tlYTNjq6LS4C+/Z9Pl2cfMoYRj
 2X0T6UwnXWddPCOPhbe2ad5bwbqJKx/rWiwC/XDTPdEh7Pb2peW6mp9xGIZ38igiAdfF
 1sxQ==
X-Gm-Message-State: AOAM530tjSqkOj4OtuuuRcImYPOSX77Xe5nLGL+aBQp6o8pKy9/UN+jP
 QqGVM9/i29yE4GfLVAOYdmcmbA==
X-Google-Smtp-Source: ABdhPJw7ET6l9b7URM4sGEE2ugCiGXrdAZvigH6vQKYN76GXDVzQkpWBetsLF4tkCFt9CKTHLo93Yw==
X-Received: by 2002:a05:6402:26d3:b0:427:c57f:5333 with SMTP id
 x19-20020a05640226d300b00427c57f5333mr9369868edd.61.1651569167274; 
 Tue, 03 May 2022 02:12:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 og13-20020a1709071dcd00b006f3ef214e3fsm4384353ejc.165.2022.05.03.02.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 02:12:46 -0700 (PDT)
Message-ID: <9c763a44-bd12-15c0-1470-d8c4d5df01f9@mind.be>
Date: Tue, 3 May 2022 11:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: ckhardin@gmail.com, buildroot@buildroot.org
References: <20220502200036.61876-1-ckhardin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502200036.61876-1-ckhardin@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] toolchain/toolchain-external: add
 aarch64 as a hostarch for arm tools
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/05/2022 22:00, ckhardin@gmail.com wrote:
> From: Charles Hardin <ckhardin@gmail.com>
> 
> The gcc toolchain is also released for an aarch64 host target and allow
> that configuration to be used as part of the configuration. Tested on
> on a aarch64 linux docker.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> __
> Changes v1 -> v2
>    - use HOSTARCH directly in the .mk (suggested by Baruch Siach)
> ---
>   .../toolchain-external/toolchain-external-arm-arm/Config.in    | 2 +-
>   .../toolchain-external-arm-arm/toolchain-external-arm-arm.hash | 3 +++
>   .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk   | 2 +-
>   3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> index 0fbeba6aae..ca9831e05f 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
> @@ -8,7 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
>   	depends on BR2_arm
>   	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
>   	depends on BR2_ARM_CPU_HAS_NEON
> -	depends on BR2_HOSTARCH = "x86_64"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
>   	depends on BR2_ARM_EABIHF
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
> index d58692de53..1fc2c5de57 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
> @@ -1,4 +1,7 @@
>   # From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
>   md5  87ec580b290df2febc7c476f59484635  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
> +# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz.asc
> +md5  0f1c5c90f5c62e1d1066f75fb3e51e21  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
>   # locally calculated
>   sha256  aa074fa8371a4f73fecbd16bd62c8b1945f23289e26414794f130d6ccdf8e39c  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
> +sha256  fccd7af76988da2b077f939eb2a78baa9935810918d2bf3f837bc74f52efa825  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> index 4392205105..8731a4f0e5 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> @@ -7,6 +7,6 @@
>   TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
>   TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
>   
> -TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
> +TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
>   
>   $(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
