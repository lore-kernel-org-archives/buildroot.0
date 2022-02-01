Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC31C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BA48405B5;
	Tue,  1 Feb 2022 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g25D8ELHee2f; Tue,  1 Feb 2022 22:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1968D40477;
	Tue,  1 Feb 2022 22:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 833691BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77D54401DD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J4D1T1jvEcFr for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:00:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2F4640477
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:00:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m11so37400411edi.13
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S5se9ajMgZc3wI+fx8UJs41p1//n3fHBiknpKtEL4YM=;
 b=FFAJu8fGKTzgzKF4P8Gv2djXSixVyo1p15FUJBEFcu9/pcyTdnqT1Fe8neJM87uH87
 KVpgxgR0F4qloLKAV14B9l9G/DpyGOAnzWkClqKbS9CS3zG8hcBVhpHRg+iGpQe0aZiE
 8DBZtfxgjVBwiPd2WUvjPfEpHElhphKmqZVufLaE3pqzh3tJY4WXd1Xv8Bt2Gu1jg+lT
 oGhtN95j3c4IVv/QsH4lPU3WKlDtJ5D/1PcsGy+2/phRa8ppOOYm4GdL9EtQrfjf1AU2
 o1aBKWaj+9e51/p9q5plgA6PAC1ZVkSIcFF6txrTJrbXJjJEgdMoVierCcpvg/iAK3ch
 A1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S5se9ajMgZc3wI+fx8UJs41p1//n3fHBiknpKtEL4YM=;
 b=47jeVsb/T762W10lmfx4DQtqEPymGOfrGQGLQ91tifsJOQZzmvueiuotEGfXNWNRkY
 9Ub2bTjURU2idr6YXJoFmXvoVItz5uLB/ylWtctzdFYqtL0BdXIFgdKnUj/mHxgYHL8b
 X8eMjQu098t2/mzsE+g2gPeMQgoRE26lLdHeewAtsPQeZB9KSINK2S2f55eP6XBszYeu
 l2tpWOV9sYjcA7xrG9VNKZ6iVmf+PqaD057Yyg2d8AXexJcYGSpYPvwv+XFCCnF7Zxqp
 Z3bFabsTydpF9Jx8u/Js3/2hZL8DmA/KJXw67CsL1XUUbud2I0tBtCIWe+QwIMHIriSj
 3DYg==
X-Gm-Message-State: AOAM5302xDy/TXd0MuHARZM5CnlB3NKiCPde7sAnweAgCRLqlRBQX+Zf
 LoOxkDVGib7HKaWmXnT6Ps3WM0HojpvSiQ==
X-Google-Smtp-Source: ABdhPJwkHhYhavGQiYwF1hvbdoCiUGG6Zf5X1fv5BgKGdN3lfsOIpo8DOOzjfSdh1OKSZgbeky10gQ==
X-Received: by 2002:aa7:d4c1:: with SMTP id t1mr27703263edr.207.1643752824191; 
 Tue, 01 Feb 2022 14:00:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jl17sm15317420ejc.13.2022.02.01.14.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 14:00:23 -0800 (PST)
Message-ID: <c09f71ec-7a87-a692-14b6-e493be611ed7@mind.be>
Date: Tue, 1 Feb 2022 23:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220125223454.444515-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220125223454.444515-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tesseract-ocr: override neon
 check
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/01/2022 23:34, Fabrice Fontaine wrote:
> Override neon check to avoid the following build failure with uclibc-ng
> raised since bump to version 5.0.1 in commit
> df3f0c226fccd8d6143b09a1e05a0f5f23587136:
> 
> src/arch/simddetect.cpp:61:14: fatal error: sys/auxv.h: No such file or directory
>     61 | #    include <sys/auxv.h>
>        |              ^~~~~~~~~~~~
> 
> It should be noted that a patch to properly fix this build failure was
> rejected by upstream as "ARM support without NEON would result in a very
> slow Tesseract": https://github.com/tesseract-ocr/tesseract/pull/3717
> 
> So, a follow-up patch adding a dependency on !BR2_TOOLCHAIN_USES_UCLIBC
> for all CPU architectures or only for ARM without NEON could be
> approriate.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0bac6491188b6681df2ca13eb230706e83cbb130
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tesseract-ocr/tesseract-ocr.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
> index 7e23e64136..a7498931fb 100644
> --- a/package/tesseract-ocr/tesseract-ocr.mk
> +++ b/package/tesseract-ocr/tesseract-ocr.mk
> @@ -24,6 +24,12 @@ TESSERACT_OCR_CONF_ENV = \
>   TESSERACT_OCR_CONF_OPTS = \
>   	--disable-opencl
>   
> +ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> +TESSERACT_OCR_CONF_ENV += ax_cv_check_cxxflags__mfpu_neon=yes
> +else
> +TESSERACT_OCR_CONF_ENV += ax_cv_check_cxxflags__mfpu_neon=no
> +endif
> +
>   # Language data files download
>   ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_ENG),y)
>   TESSERACT_OCR_DATA_FILES += eng.traineddata
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
