Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D4CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C5B940524;
	Tue,  1 Feb 2022 22:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBucQZYQpqYN; Tue,  1 Feb 2022 22:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DCF4401DD;
	Tue,  1 Feb 2022 22:04:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C444E1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEDF982F19
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oe8-6C4j2Ujw for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:04:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A44D382EF1
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:04:38 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id p7so37314366edc.12
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AAZwGJWxlJwwhlGskPg4uVUWtjOqMlgE7ilUHOieYFM=;
 b=DwwIIFPwZDg1PhXVIZ3c11AaH2mWQ6eb+Hqa1GcdoboS5YdnEP9J434Amr8NhBgZ+j
 pe/Q7UsjDpzSpZ4Z6+a6K1Rasd0hP4vIih2RMsZRtGLfgJn7z8kWfGbvtiDv78mHavP7
 oEhf7bmWX6mONSFSPIOjer15W4+Hhlau6iK1NC3cmszcevmYViALjgrlfh6t6kQQWy7V
 gYSoPqPFHhGf0l9LRNP06EO+vY9X6FzWiusQds4tFsfD2P1++eThWjfcEMeVY8tgk36B
 hjYu1DsZD+yYGL+jqoeWBlrkoDG9bOAJmoWX0iNMq2ms6AMR2LlO+Jnhhj4JCSS0cUqW
 Inpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AAZwGJWxlJwwhlGskPg4uVUWtjOqMlgE7ilUHOieYFM=;
 b=GQHVB6ZjrwitKn6vyXjviN6PyzypLMzK17EQ+YXmyYbzvDWHykzDk4WWKYSPf+2vbZ
 YguGapwqDJAyh1latzDVsuLyb8qHwLJ62BNYzbJ3bPx9oGP8TdYj95WIaSaSJFZb+1Qd
 7gIRUWUMVMf1xACjZU0chtKta3T5XlYSiRYSZgReHHC63kkbvBwyb4GWc83aazItAglu
 yx6Ch8OgacIAiIjhzNUNwrinC6ZXE5IihIycK86AmmP6gUXA84A9AmdoRh84ZaAZPWLQ
 pgjfosK/oZdBBzvPb6VJbxd2pRFnaY33EDAiTNg0t+ItP3v9MuzhZA0IPQnA8Gf3Qdfq
 1ypg==
X-Gm-Message-State: AOAM5310wG/1FSFovJPuOQNiEBwqT0oSOz5eiAgmVoVqXAO2xpKEAknw
 yIoZEhdtPp357H/4vNJcj9oB5Q==
X-Google-Smtp-Source: ABdhPJyv/FecmB0J4vWhN7+asXpsTLTHxHL4VkFcTa+z6xtf1wUJ291yRv7zKQ1IhkF5qbR5ZdPvSA==
X-Received: by 2002:aa7:c906:: with SMTP id b6mr27477515edt.8.1643753076819;
 Tue, 01 Feb 2022 14:04:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hh13sm15110201ejb.89.2022.02.01.14.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 14:04:36 -0800 (PST)
Message-ID: <a7b1f721-e448-5f68-a881-26c36179d949@mind.be>
Date: Tue, 1 Feb 2022 23:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220126225159.1567622-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220126225159.1567622-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/xvisor: drop ARM32 without virtualization support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/01/2022 23:51, Fabrice Fontaine wrote:
> Support for old 32-bit ARM boards (i.e. ARMv5, ARMv6, ARMv7a) without
> virtualization has been dropped since
> https://github.com/xvisor/xvisor/commit/9fcd69692484e0f6aa5036c27196f55c797582c5
> resulting in the following build failure since bump to version 0.3.1 in
> commit c4f8b8968770ecbf6444a5921c6472f126717626:
> 
> *** Can't find default configuration "/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.1/arch/arm/configs/generic-v6-defconfig"!
> 
> *** Can't find default configuration "/home/giuliobenetti/autobuild/run/instance-0/output-1/build/xvisor-0.3.1/arch/arm/configs/generic-v7-defconfig"!
> 
> As spotted by Thomas Petazzoni in
> https://patchwork.ozlabs.org/project/buildroot/patch/20220125190650.107677-1-fontaine.fabrice@gmail.com,
> "ARM32 cores that support the ARMv7ve instruction set are still
> supported by Xvisor. This means that Cortex-A7, Cortex-A12, Cortex-A15
> and Cortex-A17, which are all ARM32 cores, are still supported"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1211bf6ff10c75815fa3ac320532fab5fe649a2b
>   - http://autobuild.buildroot.org/results/2bcbbb270df71d2489b7bc83e56c898c58cc90d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied ot master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Keep ARM32 with virtualization
> 
>   package/xvisor/Config.in | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
> index eb7475b86d..71628e633e 100644
> --- a/package/xvisor/Config.in
> +++ b/package/xvisor/Config.in
> @@ -1,9 +1,9 @@
>   config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
>   	bool
> -	default y
> +	default y if BR2_aarch64
> +	default y if BR2_cortex_a7 || BR2_cortex_a12 || BR2_cortex_a15 || BR2_cortex_a17
> +	default y if BR2_x86_64
>   	depends on BR2_USE_MMU
> -	depends on BR2_arm || BR2_aarch64 || BR2_x86_64
> -	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV7M
>   
>   menuconfig BR2_PACKAGE_XVISOR
>   	bool "xvisor"
> @@ -32,9 +32,7 @@ endchoice
>   
>   config BR2_PACKAGE_XVISOR_DEFCONFIG
>   	string "Defconfig name"
> -	default "generic-v5" if BR2_ARM_CPU_ARMV5
> -	default "generic-v6" if BR2_ARM_CPU_ARMV6
> -	default "generic-v7" if BR2_ARM_CPU_ARMV7A
> +	default "generic-v7-ve" if BR2_ARM_CPU_ARMV7A
>   	default "generic-v8" if BR2_aarch64
>   	default "x86_64_generic" if BR2_x86_64
>   	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
