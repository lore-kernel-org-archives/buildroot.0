Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A2BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E0E6417A5;
	Thu, 16 Dec 2021 18:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxbxjSJ3RJ29; Thu, 16 Dec 2021 18:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50B5417A4;
	Thu, 16 Dec 2021 18:20:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A26621BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FA82417A2
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEdM7z02jEcr for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:20:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E17554179E
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:19:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y12so89215061eda.12
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sdSAnAIGLSBjwl+vHiM+YFvprEY9H0vjvS7eRy0w8YM=;
 b=K4FTaB9R0ZHIrDmb82Al+Ilv4wooj9XOya142RmDl/PygiC9oCwo9OqD2Bem9cnUqu
 0VsMqKlTh9Q7Q7n4wXoLfhqQQkOA7nVwotky8b0IFNIlZnmPfBTh/SlGURpciiKE4gAu
 erkfj4xpvsevMm7E2IyVucq7WqdykuyCnb5gNGYXVMA0W2BFVxL3OcIOuDWkSCDJSPlF
 OM9rrkBgrFDvGfU9355oimnG3hvrGcVtTQ2/+VoEiwRdb0e6pcvncnkGHFiKYR/zPmcM
 WaTlfK96nhEaU8HQh28UzBl5f0z4DFvkvL1r0iHvL7BAx1ywYJn+SZWic6r6T4wLrlOn
 nCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sdSAnAIGLSBjwl+vHiM+YFvprEY9H0vjvS7eRy0w8YM=;
 b=4Gf7zAWT/UXzQbICo8OVfQC2TI2UxVdYoNWUYDBDPIEnl4XVw6KuirfEF6Sdtjyr7P
 Mpq4z76oq8dsfVf2sHixUbZkiImginYZ11ns/einwSa/Es3rAUqlXbuiQBHh3cVOZwz3
 tHGA96NXQNlCibsrFWxagrZtQITx3suuogmjQKSmbxnptIPeIXPm7HJjrEvizDXz0+bH
 sMdjeEt4/IwdaQI3JrG+wFKWuBIluaalpLC8Wg61uycYMF0TmRI+tVTd9dnjWaxLmvcl
 7n8NiMvXMXm/mTSOsD+UPxTXoaJEjdbGmTVGCgFthl0eFGftwLGq/VfHbUG+MlPCrZTV
 7IrA==
X-Gm-Message-State: AOAM531Pt2iUfui6yI13+ajUHazIvWW8qfUmMA8zrtL7ondEgVC81Wv1
 NPguL5Aabv25lvxXCXEciWs1vSRcftrIUg==
X-Google-Smtp-Source: ABdhPJzsLMw+3HIxDRXKLBA5Iy/17d4fPQOez0QzqWu6R3Hj40jSMPR82MWtwhgZtVjbigpcvSNJ1w==
X-Received: by 2002:a17:906:e5b:: with SMTP id
 q27mr2713006eji.144.1639678797930; 
 Thu, 16 Dec 2021 10:19:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o13sm2103943ejy.192.2021.12.16.10.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:19:57 -0800 (PST)
Message-ID: <0be5c9bc-9a26-cf55-fe39-b4438ae65874@mind.be>
Date: Thu, 16 Dec 2021 19:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214212813.2251144-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214212813.2251144-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: don't override
 TARGET_LDFLAGS
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/12/2021 22:28, Fabrice Fontaine wrote:
> TARGET_LDFLAGS is overriden since the addition of the package in commit
> 8d66bc940d6e4707f9773aeb052e94d45fa439ad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/dav1d/dav1d.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
> index 7a798bbd4f..d7224625c8 100644
> --- a/package/dav1d/dav1d.mk
> +++ b/package/dav1d/dav1d.mk
> @@ -25,7 +25,7 @@ endif
>   
>   # Uses __atomic_fetch_add_4
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -DAV1D_LDFLAGS += -latomic
> +DAV1D_LDFLAGS += $(TARGET_LDFLAGS) -latomic

  I'm personally more inclined towareds:

FOO = ...
ifeq (...)
FOO += ...
endif

but that's bikeshedding, so OK.

  Applied to master as is, thanks.

  Regards,
  Arnout

>   endif
>   
>   $(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
