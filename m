Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F95C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 18:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F7D81774;
	Sun, 23 Jan 2022 18:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b795-STSh65W; Sun, 23 Jan 2022 18:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA86813F5;
	Sun, 23 Jan 2022 18:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C261B1BF329
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 18:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B09A14030C
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 18:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2Rm5MSVoVlm for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 18:07:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE2744026C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 18:07:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id j14so7898421lja.3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=YNMVDKLhDbWYfz/xzXBVReadxCZSOQKni8f1wE4YuVk=;
 b=lmzLkkjjs2g0IfEltPo4oTJ9sUqF6niS72sFOxhHl6g1Pon3pyK4N+NN/ZEPg5Axqu
 IN8doT95HWP7liF2rrYMHi9kYTHEaRS4qspgl2BZX8qzcoz1aZqe1Gw/dmgRN5LfRsYW
 g0g7MKb0GXRxkN3Til3AgB5t634o6pRJ97KiJQrEbFcot8HcIzcvpMct6wYS89uH1B4l
 NAbHpTJ2kZfhYuRck0xXoFYBVY+PR1iQvFdcUDwGQOxOp1AxP4Nc4KovKq8KpVGIkIfj
 rjI0gwemYYqpu4eK72vtw5xFTufmzHavQE0cNBCI1L2HQe+ZJpv9WFj37ODGMF8P9OUC
 cyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YNMVDKLhDbWYfz/xzXBVReadxCZSOQKni8f1wE4YuVk=;
 b=5JEKrHjIfd75Vb/TA+mHm8OCzI1ltVtMXo5ARXLy/HbfO61zkMAES0q7RI+PL/L13F
 CX31IgSn/WvcqHh5SI/g+exDKojeba/8DzHXxkz2ds9Ut+2S9l57lrtagRwxOhe85qW3
 Y2xw3slMh1ixZaa1GVzXRnTad4FCmzJWVDntU8K7tV7Twp7FzEJo/MXku7Cxrerg1tUv
 QpNgHror6pAxRd86sjh8RnjJM00ZTHLiZ3SQL0AYnJfS6IzYIp8BA9iJ5psShkwgW3qz
 BtLQhiBVhzZzdHvJ/xAOxfMmtYyyhJgPGq8mRVuzKSKOs9SuTHE6zci/LB161NPGIMVf
 FLxw==
X-Gm-Message-State: AOAM532dU2MPp5VxUAi9ie5/w7txgryRwsb3eLaO8tSJ7GWLyiyg1GgR
 ed2QeDkxSwnMj43g0mOifEfyIYYQm3Y=
X-Google-Smtp-Source: ABdhPJwsGSqP2p2LIY0w26yQ3RHc30EqywF4GZIneOhsbxaAZTysAIVzl15tXfyYH/8uDp+q122FUA==
X-Received: by 2002:a05:651c:1043:: with SMTP id
 x3mr1123019ljm.357.1642961255586; 
 Sun, 23 Jan 2022 10:07:35 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id g19sm723477ljk.49.2022.01.23.10.07.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 10:07:34 -0800 (PST)
Message-ID: <9c9b7005-6f85-f812-21b5-fa029136477b@gmail.com>
Date: Sun, 23 Jan 2022 21:07:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: buildroot@buildroot.org
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
 <20220118104338.2081259-26-giulio.benetti@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <20220118104338.2081259-26-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 25/28] configs/orangepi_zero_defconfig:
 enable NEON/VFPV4 FPU strategy
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

18.01.2022 13:43, Giulio Benetti:
> This board has Allwinner H2+(compatible with H3) that is a cortex-A7 and
> supports NEON/VFPV4 FPU strategy, so let's enable it instead of only VFPV4.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/orangepi_zero_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
> index 1c107b10e6..a0af809e92 100644
> --- a/configs/orangepi_zero_defconfig
> +++ b/configs/orangepi_zero_defconfig
> @@ -1,6 +1,6 @@
>   BR2_arm=y
>   BR2_cortex_a7=y
> -BR2_ARM_FPU_VFPV4=y
> +BR2_ARM_FPU_NEON_VFPV4=y
>   BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y

Tested-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
