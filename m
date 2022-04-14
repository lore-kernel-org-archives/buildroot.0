Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB4DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B96A682B1A;
	Thu, 14 Apr 2022 19:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnpnwWsWLTSu; Thu, 14 Apr 2022 19:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C256B827F0;
	Thu, 14 Apr 2022 19:45:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 394511BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 356A6416B5
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFIudujd1Hik for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:45:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50F70410B0
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:45:06 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id 21so7702663edv.1
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b2/d8lfpar6VIOJm5eS/l8nmC4UTcsVcDpm2xV4JKZc=;
 b=G3WXDY9ZmBafL5JEN+CPbQjMqQm5Gz0DP5O5r9JRGxMd2O276/zYOtShRSqwyZ3KWh
 iRJ62wap1f35/SDm7DUsJPML+dISNw1apiu0ugKzw94/VTlKLr8McY5/fKkxjzysc0jR
 IthNPOf716/kkOwWE+y2M864k/G8XJ1qNApw3lD8kEpgpDxwu28iVM9J/Gb1blz6coa4
 gyQ8b5DvYDt3C9oG2fV7AGAFZYbiDQqHmiYO9z5osuf/pWiP3iLaJlBGDi6vL49fGaF0
 DucUsWqx7j49IJXp3mnFQU1TK589fJ3SeOMj7CqJN4hhU8NkrvtGpYvCuxzO0QF47aMM
 X75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b2/d8lfpar6VIOJm5eS/l8nmC4UTcsVcDpm2xV4JKZc=;
 b=nEFkh6AqVAu3HmIgOONzs40mwWPVvXq+UJNYNa/TqvVyDhRFZaFNfqwJl5MBGAOElP
 C4qRCFdhHZzW0gNw39ax1fu7Ww2X3TqB7IFcP7s45bm0FU7YTVI4069r6rgcmbk7wt85
 5YE8Ffo+adz2QAVBX+7ws8MMlyQzkEmcL5ORIKbk0cDrVYKqJtRI2RfMLrkAsuXfVb8R
 x10S+swlXKVjQnvk8OgiHMKYsimzrAr+k7f/6d6FHbgMuvJRBrNBsbXfONaKQteSUov3
 1v1rTbK6WTUpveUvuUPG/fq7KoBU1oJuYL466D/2MN5r/bMJe/PLWvuN4/Pj+kB0S4mJ
 KUFQ==
X-Gm-Message-State: AOAM531PoJUBqsHwTaa/gFLoQkPryJckZhsMktm6nPUzLLgsSkQSNQPJ
 xdflx/8U/gnV57Dm4V/liJWlDg==
X-Google-Smtp-Source: ABdhPJxrVsKFHz87PT6czQJMtSp3bhP3XTnPx6PHOg6W4JCgJ3qyc6pOrsDtW97hYKa1DEbmeggeVA==
X-Received: by 2002:a05:6402:51d2:b0:419:7d2e:9d0 with SMTP id
 r18-20020a05640251d200b004197d2e09d0mr4732626edd.82.1649965504533; 
 Thu, 14 Apr 2022 12:45:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a056402525300b0041952a1a764sm1560363edd.33.2022.04.14.12.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:45:04 -0700 (PDT)
Message-ID: <90261c69-cc58-eedc-d870-3e5fc63d34da@mind.be>
Date: Thu, 14 Apr 2022 21:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org,
 fontaine.fabrice@gmail.com
References: <20220407005608.203359-1-joel@jms.id.au>
 <20220407005608.203359-4-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220407005608.203359-4-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH v2 3/3] package/flac: Configure powerpc
 vector extensions
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Cyril Bur <cyrilbur@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2022 02:56, Joel Stanley wrote:
> Remove the hard coded disabling of altivec and vsx, and instead use the
> BR2_POWERPC_CPU_HAS_VSX and BR2_POWERPC_CPU_HAS_ALTIVEC variables to
> control the flags.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   package/flac/flac.mk | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flac/flac.mk b/package/flac/flac.mk
> index 3a18d81591e6..d1cc42f352f2 100644
> --- a/package/flac/flac.mk
> +++ b/package/flac/flac.mk
> @@ -19,9 +19,15 @@ FLAC_AUTORECONF = YES
>   FLAC_CONF_OPTS = \
>   	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \

  I've rewritten this with --enable and --disable in the same style as this.

  Series applied to master, thanks.

  Regards,
  Arnout

>   	--disable-xmms-plugin \
> -	--disable-altivec \
> -	--disable-stack-smash-protection \
> -	--disable-vsx
> +	--disable-stack-smash-protection
> +
> +ifeq ($(BR2_POWERPC_CPU_HAS_VSX),)
> +FLAC_CONF_OPTS += --disable-vsx
> +endif
> +
> +ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
> +FLAC_CONF_OPTS += --disable-altivec
> +endif
>   
>   ifeq ($(BR2_PACKAGE_LIBOGG),y)
>   FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
