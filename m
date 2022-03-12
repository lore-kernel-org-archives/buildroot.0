Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB492C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61F3060B17;
	Sat, 12 Mar 2022 17:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLzjHSMJF60M; Sat, 12 Mar 2022 17:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 801CD60A91;
	Sat, 12 Mar 2022 17:04:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 267AB1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14BE260899
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OElRigZWVGS for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:04:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FFFE60803
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:04:08 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kt27so25525126ejb.0
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9zlfap+37AjJ+4MWdTr8ux33pczcX/8LqDb1YCZVzZE=;
 b=CpkPSvWQyhMm6pYW6LBCfKqCO7s7D/xNgnTwHKTfreTtGy1oYjpRasD5VtMCyuz9qt
 lyAoOV9mKGaiwgjcHww5fHmEc0ZqS8y1peCpdZ+SZquYZPW5UGCCraWjoLMM1KPeFbXG
 A/rik/UDQt88wQx7jT236k9iiOnybm7iKBfuVV3TjxxXMzLuOAY7L+VSWuiHI9b4+MNj
 VZqs6zM2G4WNYE7yFdcP+cEUNulFrQpXIcXy3p4W+ch5cbgwI2Y6haoZ/ZWTMnBsjPvt
 5FIFZMs/i+oGZri+tOZTC699MSypXmmvUbAw1D6CxJu2JdslQgoMnVnPYmBDcXXn8J15
 vyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9zlfap+37AjJ+4MWdTr8ux33pczcX/8LqDb1YCZVzZE=;
 b=eQ2ZhY0olGAL9CqPbsNiimiafp3+16iYkLidrrH2byzWIosIeNWThAl3LCoz8lRWog
 nYEgzUiIRol1rr0k1IkH9hPhJMpQiHHBYnGjdd6l2Cxsbfq5beccRIyXLj+MiGe7/jWo
 lsbaQ8pqCrYEn1qcHnuJSXARxB9C7t1PUhNxNQk1ZKitgLsiQ0FNoMH+3a/eamHDOwZc
 3GwXmaSWeyQBkncQyofvWLeFAnThFX5PnX4s69v7d6jPDWLx9i7RGJ/NVF2j6AIIzOFz
 A6XTdSJeXNqJfNQ0YafqOc9Mw6ijbieg18HaPlWCbKsHJHQvkFvoro+YGNvLrH3PStPI
 XYeA==
X-Gm-Message-State: AOAM530fwM3tzHrjqKzcTdcujs6w/wmTjG8pXjUcEZfmfKKI1Pcnp0hk
 MGu/UaJqK8y4hBqG1pbjvm75Bg==
X-Google-Smtp-Source: ABdhPJwU3BaZh4Fx5F7sC2E4p1ipa+fe05nZL0eSWzd9oTRV7RU2KwN4scZb0fQQY3ci/Rz7Y/nLig==
X-Received: by 2002:a17:907:c1d:b0:6db:67b:a3cc with SMTP id
 ga29-20020a1709070c1d00b006db067ba3ccmr12553955ejc.356.1647104647117; 
 Sat, 12 Mar 2022 09:04:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05640240c700b00416cee953dasm2714662edb.24.2022.03.12.09.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:04:06 -0800 (PST)
Message-ID: <51ad5bc3-69eb-6a65-3649-7e8bfe44c828@mind.be>
Date: Sat, 12 Mar 2022 18:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220222094923.2220294-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222094923.2220294-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/cups-filters: bump to version
 1.28.12
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



On 22/02/2022 10:49, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  I also updated the hash file to use two spaces (check-package).

  Regards,
  Arnout

> ---
>   package/cups-filters/cups-filters.hash | 2 +-
>   package/cups-filters/cups-filters.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
> index aefb67f651..5a95b998eb 100644
> --- a/package/cups-filters/cups-filters.hash
> +++ b/package/cups-filters/cups-filters.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256 8cb40355287d65ea03e90dfa7e2d34f0d46752957c8a6d4e96ab6fe6c581e5d2  cups-filters-1.28.10.tar.gz
> +sha256 3265017d2369e1130e732090165d6b4e3c0838d7ca9aa60978b087bee12247ff  cups-filters-1.28.12.tar.gz
>   sha256 38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
> diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
> index c8f2dd0aae..f8ff42f0f4 100644
> --- a/package/cups-filters/cups-filters.mk
> +++ b/package/cups-filters/cups-filters.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CUPS_FILTERS_VERSION = 1.28.10
> +CUPS_FILTERS_VERSION = 1.28.12
>   CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
>   CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
>   CUPS_FILTERS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
