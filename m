Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBE1C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE276103B
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CE276103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3810605CC;
	Wed, 25 Aug 2021 20:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wop49r4N7WXA; Wed, 25 Aug 2021 20:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F4860670;
	Wed, 25 Aug 2021 20:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4EE1BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 474B660670
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIMHxpPO5zz1 for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:20:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 399B1605CC
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:20:21 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id h9so1017358ejs.4
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 13:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mk7lIJWzEscZs2fGuJWqQ8HwC/ynuWboqcObQfD0Ec0=;
 b=FsjNZ06igWtCBeoTDNLVJmNw3fE45hAo8lJEZv7h0wYx0DD3cAo36fwvS/ssJ8ZSp4
 EncBb2QbohC/pYBIqy8v3QXegRbHLR+ee9+U9ytPEzmL1SmufAC8T3ixQWobcIhdhTyi
 19mrIoU2s0N6MAZfHWDG4SMJGCWs6tNG+I/s/Sng1cLXWpGzRmSkTkLx706xWTARQ+bv
 U8CU4kSe+MgcsPFGc4lDVmSOHDTBsR26opt3eOV6+ILEQTe5kMfIYr+zVvFpKAsmDkke
 twCXT/UBK6AFW++Cu3UxoZsr3BBWwmYcAg9Li4OK0LZLm9aEoiXKTE13nhl1oW7jkk6L
 eYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mk7lIJWzEscZs2fGuJWqQ8HwC/ynuWboqcObQfD0Ec0=;
 b=FhnwB+QAvIGfvyCVx2JFpcHVOTU3mz4tgO8aIa2WyZgCGlW02pIssXSDMBlGpsQTVo
 bRV2GUbi0mumXZ8/o4PWaidOLNV91zWEhbCOghWDvJnxh1gKMw8+hbovwXPU6G7jK41g
 i6yTtFSmTBT4ti+2mT2cyS89EY9jUxO1/dSTV0L4udekQK5af3lEgw/1/qmDt3GTWGQi
 0F3s2jz2vOyS8TbP11deKaiz7J1iz3ew2o/Kh0ZhoFA7ajPUTx2lyAjdWoJfZkl49Mr8
 nXv6BKHfNzFFMeQ5f2yrdmqvShqiiyA3FyK+YgWGdZY1Xr1u1a6zjAEJzdl/KfBnVr1Z
 vHvw==
X-Gm-Message-State: AOAM530GfQDcIs25PFrpsl4kbc6nvyY0tKHAe5Vps81/c22X4LilDUFC
 UvPlWC5XCRbR4mRCbuDVBKQxaA==
X-Google-Smtp-Source: ABdhPJyW4L4ZyCS0uNX1yJ+J6kHC8EE2UhH1cNGoPKK+sB1jGgdPMDmlmLrHwz3LwV/iKZf7L+urJg==
X-Received: by 2002:a17:906:9ac5:: with SMTP id
 ah5mr460952ejc.224.1629922819267; 
 Wed, 25 Aug 2021 13:20:19 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x9sm474034edj.95.2021.08.25.13.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:20:18 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210825192014.1203727-1-romain.naour@gmail.com>
 <dca43476-ea86-85e5-9e97-5f8d985cdfbc@mind.be>
Organization: Essensium/Mind
Message-ID: <e6e73941-41f1-7292-f424-7add13fb993b@mind.be>
Date: Wed, 25 Aug 2021 22:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dca43476-ea86-85e5-9e97-5f8d985cdfbc@mind.be>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] configs/beaglev_defconfig: update
 linux-headers to 5.13.
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/08/2021 22:19, Arnout Vandecappelle wrote:
> 
> 
> On 25/08/2021 21:20, Romain Naour wrote:
>> The beaglev kernel is based on the 5.13 branch, update
>> the expected linux-headers version to 5.13.
>>
>> Fixes:
>> https://gitlab.com/kubu93/buildroot/-/jobs/1525740895
> 
>  Gah, this has been wrong eer since commit
> 9a1bd7cc1ce512672a5d76baa86c449e36137052 which I applied (and I didn't notice
> even though 5.13 is mentioned 3 times in that commit...)
> 
>  What I also don't understand is how nobody else noticed before, while there
> have been 3 other commits to  that defconfig and this still wasn't noticed...
> Drew, I guess you do your tests with an external toolchain rather than with the
> actual defconfig?

 Forgot to mention: Applied to master, thanks.

 Regards,
 Arnout

> 
>  Regards,
>  Arnout
> 
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  configs/beaglev_defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
>> index 82a6e9abc4..70459bf3e8 100644
>> --- a/configs/beaglev_defconfig
>> +++ b/configs/beaglev_defconfig
>> @@ -4,7 +4,7 @@ BR2_RISCV_ISA_CUSTOM_RVM=y
>>  BR2_RISCV_ISA_CUSTOM_RVF=y
>>  BR2_RISCV_ISA_CUSTOM_RVD=y
>>  BR2_RISCV_ISA_CUSTOM_RVC=y
>> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
>>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglev/post-build.sh"
>>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglev/genimage.cfg"
>>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
