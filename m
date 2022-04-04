Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2535FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B512D8282C;
	Mon,  4 Apr 2022 17:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gb04eIP8Lx1Z; Mon,  4 Apr 2022 17:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13A18278F;
	Mon,  4 Apr 2022 17:26:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B76771BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5FAE8278F
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXYaUu4WRbFE for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:26:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4F0181B14
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:26:15 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p15so21414002ejc.7
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rc27iyxRh4pwWgcAj0aFANsnZLgx+8/OlTS2yXKT+oc=;
 b=QTBEZ8QclhiEZKFYhaBLWc7a3ovrc2F73XcK6wwgt7oKwBUcP151gnMtT+XnnFAWEa
 mIWPWUzNhuGhSfry+8Q3U/56572U7Seo0NP3V6B4G/PwQFfIQw3liEXbxeQRmNxRovBa
 lItne1ihJcIHkV/1OSqluMQxHhhpah2vc0oqwKa2UVNRBSw9NW1RzyS24jaNo9NcO9/C
 WLowFVIWuNsSa6JKImcyiOwwrt8+iJTlZBahM2K1U3f0V6KsApOpFtJoOPCtO6DxKtmP
 3F8RtL6eOx3tMYSFk5B/sn1l7wQlrrDt5gssHdHqJgpxRWWrjU3NHClJV0/EXL7aWmkF
 VlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rc27iyxRh4pwWgcAj0aFANsnZLgx+8/OlTS2yXKT+oc=;
 b=PtIccozhDDra/hq0wDVWwKJNVgV1j/Zbiu89aeZt0y0IKmfJ5oo4ddbPlLrS4wCBpO
 Kmr6/ZfejYMjzhGYT21Gi+lE3lcWzUWib5r8Fxkzi6un2UOH8zDdDXH1TXEt9WYMdQ+C
 zcx1X9xmZ1iKT67UUWZ/DpIIw1Ow6A/qkOqgZfWOYmIavDKPbEk1uuxXslDE1GTO1TDP
 WeiJ+dCZ8akTk6aFVcRiO7P/4MoMUXzo6p8zA4C0I+VxHYEWdjdJ0pG5846MCKD4pSbS
 dSIwXSZngw+MEEqXRZ/JTwbeMCC2yQTX634GGndXts20gYDSNZyTQs8XR2Yu3AIbkXDa
 7UIw==
X-Gm-Message-State: AOAM531VFgPfyOY/vKS+oOz7Z1UH587wlmy9Eqoqtk/XWeCdeKHDDETk
 KANdQLzbKjGAvA2UMLHg57hLMw==
X-Google-Smtp-Source: ABdhPJxyjIMzPI5tw+Jwl5IHNwtwItgbBH6MSelOAoyabBDuYOlnI50omuC53/vzKeWZf2Mu20oRvA==
X-Received: by 2002:a17:907:9494:b0:6e7:fca2:d5e1 with SMTP id
 dm20-20020a170907949400b006e7fca2d5e1mr1137846ejc.199.1649093173867; 
 Mon, 04 Apr 2022 10:26:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qp27-20020a170907207b00b006e66a4e924bsm3190274ejb.201.2022.04.04.10.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:26:13 -0700 (PDT)
Message-ID: <0658ea2e-ec83-aaf5-f432-26e1b1475073@mind.be>
Date: Mon, 4 Apr 2022 19:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220328203139.1115402-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220328203139.1115402-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.2.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/03/2022 22:31, Julien Olivain wrote:
> For change log since v2.2.5, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.6
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Tested with:
> 
>      make check-package
>      ...
>      0 warnings generated
> 
>      ./utils/test-pkg -p fluidsynth
>      ...
>      6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/fluidsynth/fluidsynth.hash | 2 +-
>   package/fluidsynth/fluidsynth.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
> index 0d41c16d8d..20eb9ec49f 100644
> --- a/package/fluidsynth/fluidsynth.hash
> +++ b/package/fluidsynth/fluidsynth.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  9037e703617f91c4c36039a5059e0f624164799d856af715bcd8a23c07ba03b8  fluidsynth-2.2.5.tar.gz
> +sha256  ca90fe675cacd9a7b442662783c4e7fa0e1fd638b28d64105a4e3fe0f618d20f  fluidsynth-2.2.6.tar.gz
>   sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
> diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
> index b500944c16..d7c72ed059 100644
> --- a/package/fluidsynth/fluidsynth.mk
> +++ b/package/fluidsynth/fluidsynth.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FLUIDSYNTH_VERSION = 2.2.5
> +FLUIDSYNTH_VERSION = 2.2.6
>   FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
>   FLUIDSYNTH_LICENSE = LGPL-2.1+
>   FLUIDSYNTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
