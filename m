Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A02C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B68E660E58;
	Sat, 12 Mar 2022 16:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4xBdqdeE-FO; Sat, 12 Mar 2022 16:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E3E60899;
	Sat, 12 Mar 2022 16:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4E5F1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A281D4055E
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLMbV8vFfRMp for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:59:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C04F9410E8
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:58:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y22so14541445eds.2
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aqoDa5Bt1msCaPt/JmRkmKbGj2RiEFTYV82O19jpki0=;
 b=bG8NyY4IDn5L2X8GIshT+8JfXsC5J9J/bxSj280hlGvSq11E8lnVYhtZSGJHILQ90p
 60YTScDnqP9MevhN7BcdekRbIVBEOOdj+Dokp1rJBBAMd+7ZVb1CQorE39G3YgxYPqAI
 T8JeILqf/umMUspNZ70umiQuxPgJ/u2MAINCVFTi6BjA/XAHQMeXYcT67uRYfqNZqB2G
 4EY4+z3ednhSr3aKyTt+NLpArCbpQrwI5thzPOLaBw73VPxlOOxbArabFWA5dHpvOTmU
 OPntlFKXZZXAZ2fmpsnJYjUUXX4cZN8PPK9oej5XuxEe1PZYxrJWLAqGR0nIv4hPuJkz
 Jitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aqoDa5Bt1msCaPt/JmRkmKbGj2RiEFTYV82O19jpki0=;
 b=l4juFbDkJC4BkBZ3EQSEgBKs49hyrDvye/05JCy7z6Um6wY5tJrNLzx5VYzKbHa01A
 oUCHRS7gvlqsVGpaKl3hQDMlB5Iy/wwX6MLWQVHzinQDiTs/PUizy7rZ6TFwiZP4XOLT
 H2OXWLkxIoNJSDUwHIzKoD6+ysqo0JRENzUl2Hxt7eVCe0T4FPw0jUPECWf9MCFndxJZ
 gl1lJWQu3dsUY87hOQdj8mBQNrn/p4/vRsJEuW8cMY7MWjGWDAZk8EdHEXRjfxMYv7ym
 FA9N2QuePw6gUbfP27FOh0l8gz9buCwl7bkHfbPTBqLSW/INLyOWHrx3b6FFVF9kvWBt
 jU4A==
X-Gm-Message-State: AOAM532ClebW8cc+oCGR0Tk8wuCdHfLCdPOYeZFX+CcUAqvnc949EWau
 u2DbzIe34Uk5fs2tyZ7fT7x4XA==
X-Google-Smtp-Source: ABdhPJyiWQRsLWVaF6DdjXnc6Xpkglu5FU/eM0jAmXGlWFTOIo1iT35Hgab+tBrsLXeGurmm9sk+1A==
X-Received: by 2002:a50:d79d:0:b0:415:d5a1:2a13 with SMTP id
 w29-20020a50d79d000000b00415d5a12a13mr13693878edi.375.1647104337914; 
 Sat, 12 Mar 2022 08:58:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a170906739600b006db726290dcsm4337136ejl.217.2022.03.12.08.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:58:57 -0800 (PST)
Message-ID: <4993faaa-e51c-0f7c-6a1a-e4ca123dd1f3@mind.be>
Date: Sat, 12 Mar 2022 17:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220218173613.315794-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218173613.315794-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.4.0
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
Cc: Pierre Floury <pierre.floury@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/02/2022 18:36, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 61f2865563..e4674afa87 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  1c13bca136c4f66658059853e2c1253f34c88f4b5c5aba6050aba7b5e0ce2503  harfbuzz-3.3.2.tar.xz
> +sha256  7158a87c4db82521fc506711f0c8864115f0292d95f7136c8812c11811cdf952  harfbuzz-3.4.0.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 1f5dfa8822..331b35c530 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 3.3.2
> +HARFBUZZ_VERSION = 3.4.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
