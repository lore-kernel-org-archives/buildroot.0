Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7065BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE54415D1;
	Wed, 12 Jan 2022 19:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zDl1tpvP_ze; Wed, 12 Jan 2022 19:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47EA3415CF;
	Wed, 12 Jan 2022 19:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C77211BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B559384C2B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOcQiB_e2Sqq for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:45:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3C0A84C29
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:45:10 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id t24so14198850edi.8
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 11:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mVx7zcrFW1TimsFzpHFyFG3COvbwyq/vcs68dcORcc4=;
 b=hJkjNKFdG42T4xqdKRwP1dZ2mHlc5jPUKaCJqisUGA4os0PeLEsK/sQHMX+bOM7ghE
 WxOl3zhSL4ZV8p0Akww1RQEBoMLbrio8Yj0RGVAIiZFHZJqGigj8aD1bRBmKzhGfh0uT
 eLhZU6IRoEfafgrICTFQmVnnho15FadvBjM87f5XewiOHZXN1aTkcPceCO6u+NzdNP79
 EndaTKsFc/LtptQgEqL2hrlHVTow7XTtdGA/KiHFYlhpf8metTDaaH5AD5lUM/dWUxvL
 mhxbdQ36g8f/kef5u7r4+Q+BXmknClSlLhAAm6U3uTg9MrGvrkluIq8HUzs2e4ANiK86
 E2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mVx7zcrFW1TimsFzpHFyFG3COvbwyq/vcs68dcORcc4=;
 b=F+yi0bOGjt1CS9/CMYS6pjb6wbPI/DbFBkKsSyBGMxypF764sdKYaqQUtz72Rh2fP9
 dcKOOD43nIkXh+hBWaWQxEcbGhN2WyFkRyi4x89qsaESZ+JXAvFlj78csOiZ8rS92FfI
 B5lg2k+kr37SgCzwYA0XsaFvHoZGLAVrzaMfAN9RgVqUi0dp5dNsyqK2rbMSP2wUEtxC
 Zr6cmN+QkE+nM5Fw/EdL7GREM0w6awONa83VUVL7tk3b68SlWWHATmVfoANOhkfWKkKv
 lV9A8xnyc0CMTw3X4k5nQBmvKHuf+6hxf93rD+sera+7WNENxlUWpqIk7Pqra90WvkR7
 iy/w==
X-Gm-Message-State: AOAM532+/6g9WfUb5EBwK0pHjCHE2rAo1vHYM2mRxDfXvfdPmKrXBXkS
 i7yOmz9aBjD62L5d/BIgyeCkqA==
X-Google-Smtp-Source: ABdhPJwrL/BY3UsB3Q0u9aW5gPM6EXabXgxmMuhaTU18VCZCH9e+a8kYqqWn8RNxiWLz2Ii7yZbLUQ==
X-Received: by 2002:a17:907:1c91:: with SMTP id
 nb17mr975314ejc.712.1642016708858; 
 Wed, 12 Jan 2022 11:45:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f29sm191060ejj.209.2022.01.12.11.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 11:45:08 -0800 (PST)
Message-ID: <546b5c8e-2b49-b3bc-2e91-d8210f21d9c5@mind.be>
Date: Wed, 12 Jan 2022 20:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220112182800.3128945-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220112182800.3128945-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: bump to version 2.5.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/01/2022 19:28, Fabrice Fontaine wrote:
> https://github.com/FreeRDP/FreeRDP/releases/tag/2.5.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/freerdp/freerdp.hash | 4 ++--
>   package/freerdp/freerdp.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
> index 637e57e8b0..e31b8d5b96 100644
> --- a/package/freerdp/freerdp.hash
> +++ b/package/freerdp/freerdp.hash
> @@ -1,5 +1,5 @@
> -# From https://pub.freerdp.com/releases/freerdp-2.4.1.tar.gz.sha256
> -sha256  ef75c87926643a0d0041f6556e343ac037380d4260c64885e7cdd20da0147edf  freerdp-2.4.1.tar.gz
> +# From https://pub.freerdp.com/releases/freerdp-2.5.0.tar.gz.sha256
> +sha256  0fd9396068cda8e6d884d063a4993001f140f46c36464ccae261b9475050cd2b  freerdp-2.5.0.tar.gz
>   
>   # Locally calculated
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 40a3904024..c536f6cb1c 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FREERDP_VERSION = 2.4.1
> +FREERDP_VERSION = 2.5.0
>   FREERDP_SITE = https://pub.freerdp.com/releases
>   FREERDP_DEPENDENCIES = libglib2 openssl zlib
>   FREERDP_LICENSE = Apache-2.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
