Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BD2C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3558606CB;
	Tue,  6 Feb 2024 13:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3558606CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvE3qb-70n7D; Tue,  6 Feb 2024 13:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2679160AAC;
	Tue,  6 Feb 2024 13:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2679160AAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE871BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302B040137
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 302B040137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vfV9j50xfkz for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:38:35 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02B134011C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02B134011C
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fe3141e1cso5337615e9.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 05:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226713; x=1707831513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zZa0L9p70Afk199UjwSnbq1hwr8fqINBTsO3cilD26I=;
 b=T0od88k/dGdz/3jah2h5lqtNB/Q6yLzh8Hvqwf5IVrPXz9gtzwJTXyhMyfDi8uoIL3
 3wIAygwgdckR6YQD9rR4ijRksIZZeRYz9AZ6Ki9fWrNQVOJMlJk1sxaH/bOpGTQP6drI
 Ju5BEsuiWDj9lykdnz8DBiPzWAG+LX6G2KMqWQmTCXVchk850eS7jw94CnQN4bfvu+JT
 dnP4g7MRjNbQG93GYLglRVq73qmzKOJrHB8yX+5N/LsEVV4ht+FKgXfeh7fjdr4icWx2
 Wjr/kqpH0Rvzhgg//4bTtjFZkUh7D7seu7vXe5pK9ZFFxHgHXwGhribPUZAJ0U1S2HEv
 xHmQ==
X-Gm-Message-State: AOJu0YwVD6krQkeV3GjsvDidSu3Xzj36RfSEVin0rK/P5JcANmfKLw3I
 zLs563OZICJt2O9qwjO4VUxB6RDUo0Qd9NWGJWHaBXyuMeBqkyeZbJT1W6D74To=
X-Google-Smtp-Source: AGHT+IEl9HqxSBOhOICw3A9USbn34zsL6Fjq2LXsKC62XlkeeWs9hBuSYAkiQCJfWZLFLg9wuwXehQ==
X-Received: by 2002:a05:600c:1d20:b0:40f:b3b8:bd9c with SMTP id
 l32-20020a05600c1d2000b0040fb3b8bd9cmr1667878wms.10.1707226713017; 
 Tue, 06 Feb 2024 05:38:33 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVsGCOtu0iaktWMp9sBE4CMK6gD5VYmbMuhs0HEaUpTNVAdOiA7IIy+pd2gIWSgJy2T6u7PQt5BhrUqRT47r+nYd5e9LLR/eT/1I2zp2e/yMgkGtNEbea7iZbfNhJdsUboA0A==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b0040efc268713sm2064727wmp.26.2024.02.06.05.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 05:38:32 -0800 (PST)
Message-ID: <018bc3f7-2ae5-4d36-8c6b-485f41b4f319@mind.be>
Date: Tue, 6 Feb 2024 14:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marleen Vos via buildroot <buildroot@buildroot.org>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-5-marleen.vos@mind.be>
 <20240206142549.2ad91f3b@windsurf>
In-Reply-To: <20240206142549.2ad91f3b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707226713; x=1707831513; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zZa0L9p70Afk199UjwSnbq1hwr8fqINBTsO3cilD26I=;
 b=Xt8Zm72PYqDQQeSwf1yUiqordvjQceW2XtCLorsEZQf/bz1RhVaUIMVcoSWunYJAuO
 Z44cnvTMqfjmq1IUBuwLZlX/ZXtnSsbWOXYrxUVGPd50xut3nZId4x0G6sSe+n0BJu4Q
 wrIKJqXEBIxZnGVlfBDyPdq2bB3xWzMc/FsdQAtQsC9+xrlZD6V2gN41ZmebLsfmcZb2
 RLeb3/KD78UkyqZK/fl7nax1F40K83NLQHFVJnKp0Up9fbfZG92TdmasydRYu8YxPI6o
 kX21Vvb4newFvQZyqFU1yBwKG7xZvZAUTsHiHLpNziNXMPttEB/en4N4tsUhDLrjuvDA
 RwNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xt8Zm72P
Subject: Re: [Buildroot] [PATCH 4/7] boot/arm-trusted-firmware: add config
 option to use latest lts-v2.8.13
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2024 14:25, Thomas Petazzoni via buildroot wrote:
> Hello Marleen,
> 
> On Tue, 19 Dec 2023 13:15:05 +0100
> Marleen Vos via buildroot <buildroot@buildroot.org> wrote:
> 
>> From: Marleen Vos <marleen.vos@mind.be>
>>
>> Patch 0001-feat-build-add-support-for-new-binutils-versions.patch as
>> found in v2.8 patch dir has already been applied in lts-v2.8.13
>> Patch 0002-build-tools-avoid-unnecessary-link.patch from v2.8 has
>> been included as 0001-build-tools-avoid-unnecessary-link.patch for
>> lts-v2.8.13
>>
>> Signed-off-by: Marleen Vos <marleen.vos@mind.be>
>> ---
>>   boot/arm-trusted-firmware/Config.in           |  6 ++
>>   .../arm-trusted-firmware.hash                 |  1 +
>>   ...1-build-tools-avoid-unnecessary-link.patch | 77 +++++++++++++++++++
>>   3 files changed, 84 insertions(+)
>>   create mode 100644 boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch
> 
> Thanks a lot for this patch. However, I don't think we want to add
> explicit choice options for all "random" versions of TF-A.

  This is the current situation however:

$ ls -R boot/arm-trusted-firmware/
boot/arm-trusted-firmware/:
Config.in  arm-trusted-firmware.hash  arm-trusted-firmware.mk  v2.2/  v2.3/ 
v2.4/  v2.5/  v2.6/  v2.7/  v2.8/  v2.9/

boot/arm-trusted-firmware/v2.2:
0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch

boot/arm-trusted-firmware/v2.3:
0001-feat-build-add-support-for-new-binutils-versions.patch

boot/arm-trusted-firmware/v2.4:
0001-feat-build-add-support-for-new-binutils-versions.patch

boot/arm-trusted-firmware/v2.5:
0001-feat-build-add-support-for-new-binutils-versions.patch

boot/arm-trusted-firmware/v2.6:
0001-feat-build-add-support-for-new-binutils-versions.patch

boot/arm-trusted-firmware/v2.7:
0001-feat-build-add-support-for-new-binutils-versions.patch

boot/arm-trusted-firmware/v2.8:
0001-feat-build-add-support-for-new-binutils-versions.patch 
0002-build-tools-avoid-unnecessary-link.patch

boot/arm-trusted-firmware/v2.9:
0001-build-tools-avoid-unnecessary-link.patch



  Regards,
  Arnout


> Instead, if
> you want to use this lts-v2.8.13 version for STM32MP1 defconfigs, you
> should simply set BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
> to lts-v2.8.13, and have a BR2_GLOBAL_PATCH_DIR with the patch that you
> need to apply on top of it.
> 
> Due to this, I will mark your patches 4, 5 and 6 in this series as
> Changes Requested. If you have the chance to do this update and send a
> new iteration, it would be nice!
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
