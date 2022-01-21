Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8496AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 16:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0370409CC;
	Fri, 21 Jan 2022 16:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryiO6M5ai55W; Fri, 21 Jan 2022 16:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF94A402EB;
	Fri, 21 Jan 2022 16:45:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 478281BF2CB
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 16:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35A71416CD
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 16:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSAYFMKBG6PN for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 16:45:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35968416CC
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 16:45:49 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id o12so34952176lfu.12
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 08:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UyVMpMIpacRP04JDs230qKTV0YJhXPSGj3N7XG5av0k=;
 b=mIDKH2j39e1VOmYLv0TzoDCHjW2BkNYAUMXV2k4f9HbGYALL0cxUrZw0n5YjyOOVk9
 iM/Q1JTL2aWwCWI4dcnkRzMG5CNHDUnkcEYZXWZI4GZKRx0YqKTjqoC1bP3fri8Z5yHC
 Ou54fy6ZCmBtkPeKnXmjLDEyg9k0Lh6pXgqb6EIah/eYpmXdNHK01ZGhOFTRlj3Bv/rk
 A1VfPyaz4MiqvmCb9FlFXjThLqBfsigQtqr9UHkGvwv+Rfp41mv2nsGIghFuVHNh/IGz
 9hyvLVuMYv9dUArs6GDwui+O5/j8hwH5jjElrS/toIngH3QRMZAyMJ0kKMS6nNVJPDhv
 XDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UyVMpMIpacRP04JDs230qKTV0YJhXPSGj3N7XG5av0k=;
 b=V7g48SPWXkq88pJSR3az/8axymyUmv9gRhktK1gdA/6THUaV0mXZADtHHx8jG0PMsP
 X2nNgl69nR3OVN2Yg8ovDjwmzGXoz1q861wvcKBhJdh6xPc4D3eRFHNBGORVOiFqxDT6
 3YdkTMhhKV+mn+KUtphSa15aLZDWhbf900IX85EJSzggdhjHIHGU9apu912dvL1POit7
 +6n21KLp4ItJRwiAiW2RAstyll42HzlPjiOo8APWP0VHOTd2SLlAC9z9d1fGSrQJ5TN+
 FgOdNonvuhaOMPrLWrtXdmlDNIelQRFCVxI7ZWqSHdBkFFxEVgYII08rBUJVc9uX+d+A
 Nhhw==
X-Gm-Message-State: AOAM530Vx+ndhlHFhJpNr9/WqOUTdbhBnZcXmKW9OMt7l5Db4rHeTQAr
 EKg+nAGRDHaYjyL+rYykt1s=
X-Google-Smtp-Source: ABdhPJzJFa9EZKcQdIx0+EwBL4IiDvhCX//Uv9AVt0G4yTzOWjjMawebjJPkVJ56vE3FkRWhnwUjEQ==
X-Received: by 2002:a05:6512:696:: with SMTP id
 t22mr4467032lfe.538.1642783547226; 
 Fri, 21 Jan 2022 08:45:47 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id l17sm306908lfk.44.2022.01.21.08.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 08:45:46 -0800 (PST)
Message-ID: <8a692520-6994-d9c9-1fcf-0311a0120353@gmail.com>
Date: Fri, 21 Jan 2022 19:45:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <2ba595af-2fe2-bcfd-5c3f-f3b7b77cbef9@benettiengineering.com>
 <20220121103302.1488436-1-giulio.benetti@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <20220121103302.1488436-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to latest
 version to fix Linux >= 5.13 building
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

21.01.2022 13:33, Giulio Benetti:
> Pending PR is now merged[1] and it fixes Linux >= 5.13 building. So let's
> bump xr819-xradio version.
> 
> [1]: https://github.com/fifteenhex/xradio/pull/15
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/xr819-xradio/xr819-xradio.hash | 4 ++--
>   package/xr819-xradio/xr819-xradio.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
> index efff92ab7d..4a77db0d1a 100644
> --- a/package/xr819-xradio/xr819-xradio.hash
> +++ b/package/xr819-xradio/xr819-xradio.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256 5900821a777b9008d7cf9b8128e0cb75a4623ecb608b45438e17c7a056cde1bf xr819-xradio-6bf0e2e21c80456e2a3d4ad1267caecde7165871.tar.gz
> +sha256  06b91b1fcf98a261125b4d599ffcce2458fb9d0c1f38a4bd432a622b446f0f51  xr819-xradio-16180b6308e3c5dc42a92a663adf669028087ff7.tar.gz
>   # Locally computed
> -sha256 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73 LICENSE
> +sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
> diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
> index c1fe3295b6..5f60be887c 100644
> --- a/package/xr819-xradio/xr819-xradio.mk
> +++ b/package/xr819-xradio/xr819-xradio.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XR819_XRADIO_VERSION = 6bf0e2e21c80456e2a3d4ad1267caecde7165871
> +XR819_XRADIO_VERSION = 16180b6308e3c5dc42a92a663adf669028087ff7
>   XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
>   XR819_XRADIO_LICENSE = GPL-2.0
>   XR819_XRADIO_LICENSE_FILES = LICENSE

Tested-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
