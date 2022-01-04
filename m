Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10696C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCC9C81AEF;
	Tue,  4 Jan 2022 17:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAongdtT3wIa; Tue,  4 Jan 2022 17:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F2CF8198A;
	Tue,  4 Jan 2022 17:54:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD10B1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B83A04056B
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgTkh5iEqFad for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:54:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82C73400FB
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:54:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y22so151582507edq.2
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+MqpIQuofQC4taOpgBQmXDKYW1H/4eFjNanE2cFfdiQ=;
 b=TeCe1ReWR6ZBAbSXdTuuVez9YKXABFwI8J2qlK8aAXNNOyBvKQRj14NIlFSHYWGmcS
 4RLDazPTTP6iPb8diJQDMjEnIQJsr08CUAsg+V33qLnnNubAXeaYtAegKmcbffEsu+uw
 Qay47sTEQCvkCM3EGB6tmgs86v7XTKvYpMMuOXoa9amt7s6DoKHuxqWdB5/XtpeaLgL+
 RtbA/C3iR8OckOv4QW6hAiiIUFnfLH5q9kc38rHd9bX7D4V0ZFJtXbZ1g30BcgEMeRGy
 xbE56hBewHnI8I0cXCopfCsz/NWiPUW5gxtgDLLpWJ8mT3TKiQCMsQ358aO3KGgaHr4k
 2vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+MqpIQuofQC4taOpgBQmXDKYW1H/4eFjNanE2cFfdiQ=;
 b=2HqtstWV3vReN76jMIvno11ABXFT9pgytrkLEhl27cFMvsOWAYUP8vffjPjTYzCncE
 n1jOdyoU4LlCdwnGVx5Jkhzi5mc7fuWFXsi1ssufghV/1J/dLRdHUN+D0D/eJ0/5rHxg
 zIRBf37MY4NwIObbTdGKISOHbH+kqHQpA3S/MrrcowJPaS3sjqfefXltfuBQtJr1uy1c
 /q2DBhPaJHuG5VuMnFt51099KA/FEkHtLPPA8L/fKDuAE+xR2t76IZQYm0Yli89U1BWN
 +Cf/yLR95hCudXIgYCvUuCYCWIXkAWy0zImW9feveoTW+DgPq7kob1vgAf/QW279o1EH
 +eBw==
X-Gm-Message-State: AOAM533o1l2wijVk/GJedZeTmDkpgp/MRYuUN2QB0Vxg3aTrTJ8rRytl
 ttJwWU9cnGq9o1RcV6G1zAbtlBTPC1+5JQ==
X-Google-Smtp-Source: ABdhPJzAxaGV0PbHyYhrEBg38QncYW5xwP6UMw4ixAu5MDeJe4PpVM2UAmNQmK+vh4o13IHG1lw2/w==
X-Received: by 2002:a17:906:c109:: with SMTP id
 do9mr39855376ejc.111.1641318882660; 
 Tue, 04 Jan 2022 09:54:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ds7sm11741228ejc.50.2022.01.04.09.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:54:42 -0800 (PST)
Message-ID: <e9f22a12-b37b-0dab-9a31-3c1149162e58@mind.be>
Date: Tue, 4 Jan 2022 18:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Erik Larsson <who+buildroot@cnackers.org>, buildroot@buildroot.org
References: <20220101223900.2970405-1-who+buildroot@cnackers.org>
 <20220101223900.2970405-3-who+buildroot@cnackers.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101223900.2970405-3-who+buildroot@cnackers.org>
Subject: Re: [Buildroot] [PATCH 3/3] package/tpm2-tools: add option for
 enabling FAPI tools
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



On 01/01/2022 23:39, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
> ---
>   package/tpm2-tools/Config.in     | 11 +++++++++++
>   package/tpm2-tools/tpm2-tools.mk |  6 ++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
> index 1a6698570a..cb3eb2b0a5 100644
> --- a/package/tpm2-tools/Config.in
> +++ b/package/tpm2-tools/Config.in
> @@ -21,6 +21,17 @@ config BR2_PACKAGE_TPM2_TOOLS
>   
>   	  https://github.com/tpm2-software/tpm2-tools
>   
> +if BR2_PACKAGE_TPM2_TOOLS
> +
> +config BR2_PACKAGE_TPM2_TOOLS_FAPI
> +	bool "tpm2-tools fapi support"
> +	select BR2_PACKAGE_TPM2_TSS_FAPI
> +	help
> +	  This option enables Feature API (FAPI) support in tpm2-tools.
> +	  The FAPI tools are prefixed with tss2_.
> +
> +endif
> +
>   comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
>   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
>   		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
> index df5fbbfff4..6894be195f 100644
> --- a/package/tpm2-tools/tpm2-tools.mk
> +++ b/package/tpm2-tools/tpm2-tools.mk
> @@ -22,4 +22,10 @@ TPM2_TOOLS_CONF_OPTS = --disable-hardening
>   # do not build man pages
>   TPM2_TOOLS_CONF_ENV += ac_cv_prog_PANDOC=''
>   
> +ifeq ($(BR2_PACKAGE_TPM2_TOOLS_FAPI),y)

  Does this optoin make a big difference in size? If not, we'd normally make it 
an automatic option, i.e.

ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)

(and remove the Config.in option).

  Regards,
  Arnout

> +TPM2_TOOLS_CONF_OPTS += --enable-fapi
> +else
> +TPM2_TOOLS_CONF_OPTS += --disable-fapi
> +endif
> +
>   $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
