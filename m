Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EEEC021A5
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A566880E49;
	Sat, 14 Sep 2024 16:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6pqPXvjmQeB; Sat, 14 Sep 2024 16:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5DD980E22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5DD980E22;
	Sat, 14 Sep 2024 16:31:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1771BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06B9640120
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8BFlvtoK7iW for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:31:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABE934010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABE934010C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABE934010C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:31:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cb57f8b41so25887325e9.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726331503; x=1726936303;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fMWJlhTrSS0CB7dVW/PPO/6m/0P9ya7U4CeghZhmWPk=;
 b=BCo2nf7xPJuO5Av0sSFOGp3m3crtQNZrlWsTiQvKB9NbkYo9qXwGrZgA4V+aJZWSu+
 /vnOYuNHbDPo+NrlHAXjpZ9ChFVlalzNydaLZFesJBHGPyrTkfV8WjPGHuPxI81d4k3L
 5IRl5/z39d5yd6RV7QP5TZT0ZRKn57c7LQLcbpsJSPbYnDQr9iNGbgloH2qZYNdLYdPV
 fEmFegFpFEsD/E93lqwBfQCB28kmhKKoB53rQrHmjd3LwH/xgr69zP1w6N1Gs3DesAwA
 ACT31+r4RLsdcqqfjkZQinPstyGbVgFz2hIQCcXnfuOB3XFfDtzVGEZM3+w752yyO2gl
 kjaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUerM/r2kg5vN32RccVh0Y7Wa7I+55/6VELonRHLSCBvR5d29Soa7uhLII+h6sT2SBhLsuGr6rk33Q=@buildroot.org
X-Gm-Message-State: AOJu0YxT5pIJ5Z9x1CpAS+HF/FWGT4kDIWWUvnyQwB45dFKzUotuj1hI
 qAVIucqSl7n6NlFJPv5J5D9vJFZiClo1CB3lyabfFBcEB+kVaOzxVcS0L8qCT0EUbTQH9rh4U+B
 /NCrjgQ==
X-Google-Smtp-Source: AGHT+IEmY+rkBqrdV9vTdb6CUbdsJdm70fJQQctALGocjPdfUDg6d2o26BGJPRriR/9BzV18ng6sXQ==
X-Received: by 2002:a05:600c:4714:b0:42c:aef3:4388 with SMTP id
 5b1f17b1804b1-42d9070a3e7mr72746715e9.6.1726331503197; 
 Sat, 14 Sep 2024 09:31:43 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b05d5dbsm58473565e9.13.2024.09.14.09.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 09:31:42 -0700 (PDT)
Message-ID: <d3159ae8-45a0-4957-95e7-3571f3fa6ccf@mind.be>
Date: Sat, 14 Sep 2024 18:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20240914114318.1912121-1-festevam@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240914114318.1912121-1-festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726331503; x=1726936303; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fMWJlhTrSS0CB7dVW/PPO/6m/0P9ya7U4CeghZhmWPk=;
 b=YXaFEz4NXguF1ipxsT16FbL+nb4QYKJc/8GooGj9E49+geV85QLFSIZpjJDQ05zdfP
 e1yQYfDpbVWOPcKhY9bHhok+ykhePPRkNhb6xOlfO6+xChW3MPKfbU203Q1i256AssmR
 hzYX2z3UQwQMIKQQwLHM2k8VYzsJLcyX6zJ3q7EEg/pf0Uw8tqjxRhm88NQEFFb2TXeD
 ozUJtTEnWEQkZRBEeBFZFQ9vIKFwA9Nc3exf7faB5451cDxSVGTo47v4ZDcRBatzh8XJ
 18k22It8SaZTvGP4jUwHYSl4ti3LDwTYLr7iZB4eDm+1/anK3OQa2r/XucXRH/gOmcui
 mrpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YXaFEz4N
Subject: Re: [Buildroot] [PATCH 1/2] configs/imx7dpico: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/09/2024 13:43, Fabio Estevam wrote:
> Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
> build warning:
> 
> include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
>   1471 | #  include <openssl/evp.h>
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199869
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

  Applied both to master, thanks.

  If you're actively working with these boards, perhaps you could also add 
hashes for U-Boot and kernel and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES?

  Regards,
  Arnout

> ---
>   configs/imx7dpico_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
> index b0a4b3dd12d1..eaaa0202bb16 100644
> --- a/configs/imx7dpico_defconfig
> +++ b/configs/imx7dpico_defconfig
> @@ -26,6 +26,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
>   BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx7d"
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
>   
>   # wifi firmware for brcm43439
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
