Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C826EC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7AB60E21;
	Tue,  4 Jan 2022 17:52:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63ltk3jMsR2j; Tue,  4 Jan 2022 17:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C197360DFA;
	Tue,  4 Jan 2022 17:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98B201BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87AAB60DFA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAoQsDr9LwYn for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:52:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9592860C00
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:52:15 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id j6so151402028edw.12
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+MqpIQuofQC4taOpgBQmXDKYW1H/4eFjNanE2cFfdiQ=;
 b=EdXcfxYyS4bCOSECKVVUSxc9Eyx0I9JygCmCMDKUS4HRgXuPbdldDrD2IE6/chEUmz
 h+dY0PFV3TFcL5VzMYoC7ZvcqS0rQJXjqSbLDIBrlhBlH9Adw88zeGLp2PFmuWWEVl7U
 oXSXgO19hCDttbo6k3HfHHqwqir3IewNb27CQGIm4wXg0UUTVb4uvzu5H3ObU4/0nxTA
 wGwI5UyFAAtma5FoMR90ywVUr/wRVP3/ZqeiCxkQL+aKqZ3B2pnjM4tGiBcO07iIsCCl
 A/gXFyQxsloENKw6m7ode012q7WNbpe1xxNKOGPqdwPsgdzaBoHulEhZGA5Qiv++AI/l
 //wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+MqpIQuofQC4taOpgBQmXDKYW1H/4eFjNanE2cFfdiQ=;
 b=pH4VnFcjhcOpfjQSCtiDYcZEj++GGp/FCXugAgJZhiRA3C0WxKvz9McD9Iqn6zl1TE
 3ZwD8l9o7gQhuheW2kr4TJe+jhoGrNDW2rUVwnqnG/cr32G3Q8kCOAYOyXTp4F32102G
 62E6IowCF/AQAXj5biWQe0a7rSGsKHu7Smq1VpdbQhBXV9SDy/XLlsKRdNkhcX+W0iYA
 AFAbjboQYwnhWJQR6EyKzSXKabwBONupQORELLEtzpTXfocDaAEz+b8rUGxH1iv0UX3h
 GEQ05RRoLfxjLU0kjpbqM8V28LoXcdH2ThzsMbZwhA+Vyd3yGcTEPZRGdCZ/v4VOQdwc
 waSw==
X-Gm-Message-State: AOAM532q92yc45O7Vpy4qjdOg4O6Ti20yTJE5SlKL6+pZ+KK5s5W/yxM
 WOLW9wgjavg8+UmPG7rgEEfDKA==
X-Google-Smtp-Source: ABdhPJxBgsYtoUROaSlSRrX7a+7yX3gA0+mECOFvS4yKi9vv3m0CydYO4jSCwo2mld42TEUeIchftg==
X-Received: by 2002:a50:9e0f:: with SMTP id z15mr49707200ede.278.1641318733923; 
 Tue, 04 Jan 2022 09:52:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w10sm14833562edt.16.2022.01.04.09.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:52:13 -0800 (PST)
Message-ID: <f03bea9a-6c5b-0138-929d-73d40728e991@mind.be>
Date: Tue, 4 Jan 2022 18:52:12 +0100
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
