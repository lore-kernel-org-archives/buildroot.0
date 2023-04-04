Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A192C6FD1D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 12:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD1F81819;
	Tue,  4 Apr 2023 12:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCD1F81819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jdWJUS_qO2I; Tue,  4 Apr 2023 12:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1391F817A5;
	Tue,  4 Apr 2023 12:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1391F817A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 777CB1C2870
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 12:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DD2860B44
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 12:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD2860B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjNRsYKahcHw for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 12:47:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860F060067
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 860F060067
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 12:47:57 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso31958814pjz.5
 for <buildroot@buildroot.org>; Tue, 04 Apr 2023 05:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680612477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J4zRpSoytlGNnnaBaZ9LJHmZ/CMBU5gAy+vlJjLIaU4=;
 b=jOHicqFUQ51F1yrL4+bafaRIwIv04l1A8ydYD1muwKgWZhI50Hvxf6SLE5irbJdRrl
 EVqPmysUoVNA9khWExEvvdcKaKw87iow+7lMuEfJrQqt7rdHP6jKcM4Ah8yHM89+tzw5
 O8QOwbihuChlokmCZa2BMvlBkCQThem8gSkiEv1NKoo05EQCJsTwhI0SWFl2mU4UMPMM
 vBcKcKS5VuGwkONrmmjAz0FtDu+MsTADwXWjXzoID8EGOCMvb1irxRe0IBRr1crenTEr
 oTXqxHp2UVADRf1GdzeiRNnbW8n5sLEJZwUEdhswFI2jO//JispSDf/5nwf/dPvNlzDW
 9u1A==
X-Gm-Message-State: AAQBX9cfDdFU0VDnNb+9TeonKSMWSNVDmiSWDeoQqk9drEKWaYH4i+6W
 daCaqh3WSCSc1Tp61Q1YmL3/1TjN6KSTSQ==
X-Google-Smtp-Source: AKy350b4ga4yGRgXVyUCgP8fkIQgFyN/cK+u/sP4S75vH0/u4tZJ3AqtjEQlkay9Y4isBFB78rT5dQ==
X-Received: by 2002:a17:90b:1e03:b0:23f:ebf2:d3de with SMTP id
 pg3-20020a17090b1e0300b0023febf2d3demr2920399pjb.27.1680612476776; 
 Tue, 04 Apr 2023 05:47:56 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-24.three.co.id.
 [180.214.233.24]) by smtp.gmail.com with ESMTPSA id
 s37-20020a634525000000b00507249cde91sm7486676pga.91.2023.04.04.05.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 05:47:56 -0700 (PDT)
Message-ID: <bc1b1f34-d896-1971-4f2d-175782a8babe@gmail.com>
Date: Tue, 4 Apr 2023 19:47:47 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Gerd Kautzmann <G.Kautzmann@PRIMES.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <1619D009AA8C9E469331A8EE22395AEC8C24E6B7@Exchange2013.PRIMES.local>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <1619D009AA8C9E469331A8EE22395AEC8C24E6B7@Exchange2013.PRIMES.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680612477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J4zRpSoytlGNnnaBaZ9LJHmZ/CMBU5gAy+vlJjLIaU4=;
 b=pjEM376viWY/qcQWuqG2ZksoulvRHnrO3hWPzKz3FSqkWcXiUX8nFhJTI8UxAhDGZk
 BfStf4zwYDvWqFyKxQHZeHweQIMM7SRDH0eFNdBEMfII09/PmeoZ4WbDL0jFU/fc/YSj
 0qtCsKl8t4dsTJFJKfs4fz50vISf3Yd46O36MKt/DVccmVM/il2UkP9iU9xELeIa4YBz
 ldNDL5ONQh/5UwQWV34yMx1HnG47SvkBaWjXsqDWgwz81x82lLBIH1mjNh3qwSiqHUCE
 5vcY0A3xQraPR3+CY6EnNd+k2aoZZTzVruX/y25oZBscFHMEXb56qdCQu/RZd9druNzs
 ldCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pjEM376v
Subject: Re: [Buildroot] Tools(?) packages for drivers a kernels 6..x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/4/23 14:15, Gerd Kautzmann wrote:
> Newer Linux Kernels like 6.1.4 seems to have some support fort he camera imx296, buildingthem with buildroot is leadingto an error:
> 
> *** Can't find default configuration "arch/arm/configs/bcm2711_defconfig"!

Looks like you're using upstream kernel but you want downstream config.
However, I'm not familiar with building kernel with Buildroot, so I guess
you need to copy the downstream config [1] somewhere in your Buildroot
tree and point Buildroot (via BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG) to use
that kernel config.

I'm only answering the kernel building question, because it looks like
you ask multiple, distinct questions in the same thread. Please start
new thread for each question in that case.

Also, try sending plain-text email only; the auto-generated plain
text from HTML email is rather ugly. Last but not least, when
replying, don't top-post; reply inline with appropriate context instead.
Some people (like me) tend to cut the whole context below your
reply if you top-post.

Thanks.

[1]: https://raw.githubusercontent.com/raspberrypi/linux/rpi-6.1.y/arch/arm64/configs/bcm2711_defconfig

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
