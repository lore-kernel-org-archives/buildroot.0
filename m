Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2330541B6D;
	Wed, 23 Mar 2022 20:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxRyMBWLm2aC; Wed, 23 Mar 2022 20:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F8641B68;
	Wed, 23 Mar 2022 20:06:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8E041BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7FD384A86
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-7PAx227d-d for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D501084A85
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:06:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qx21so5027371ejb.13
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NgoK7PTZjUHi+iUArE1FWa+Y5Bait1niBUfSRsORlko=;
 b=PSccaj3wPunrCYH7Ly8USmF+Fx3zcjh2xSwJYmXzE/4okj06UyKcmpNoTv85sr6glh
 DAhhMFJqb9Q/Mv/g94c8/abU5Y5hLUsO1ZqIhmLnQubBQsHvT9m2prQPP82HAgyKKblI
 EFtDMYI+dojIFMwku8t+ZyjAav4jwg9btZc2nteE2B60U1eFkyrlrNkQLZiB6Ue4KLTk
 /iT9Ur/dxpY+A0xQl2Bohiua+g1OKcdE/q9tPBiH0cnHHc1aKBpNULaHGzaZy5HLk2+L
 MTwFsWaso7QktB2JokzgKlIFibFpPdTqSRQm7MhwxeloEXpCdYLdyVkfORIFJtVIz+Uy
 eekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NgoK7PTZjUHi+iUArE1FWa+Y5Bait1niBUfSRsORlko=;
 b=g+lkNBNd8xN6H5Yrmy7dIFf8fNfyA2MuULhQ1s/84xDH5H9zegLIjFAmwSvIcBW/c/
 fBh6xCJWkSxGYy87dwpaKAO9ZP4Gf+TXrQhOw6E4WmLbCYzUjsqf776sl6ekwR7hctDr
 Oa2oflp92Cox54CV3ht5kDraWuDPxnGExt/gzo+47EQ++/vIIQ1P+umDEVhC2kHHk+/H
 AeDDc2DRNlvu+x2pekUZN67rl3uTIbjGmZ9TLkXlodMW2MalUD4yoKgvG7R/4HzQnwAu
 pOHpZ1lT0uziUyBCHxORlUZJS2mmrbMY8CSrfweUzQjlQ0Tsq0iThdB/HyUgqWGW5N8N
 ahlg==
X-Gm-Message-State: AOAM531rxbCwwztYSzgfjqW2teS9CYM+Y0Ns9Hj474WeD6q1fffrs5pe
 YcvF3AcilwY96bIKe/kKziO0LvrMK36mpw==
X-Google-Smtp-Source: ABdhPJzzuZwTWhnlvMOzz/hpBY7RrZHiugZRGPJstRj28Q0D90xvNu28nUx5hhY3Ta1W3YL7717qhg==
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id
 sh33-20020a1709076ea100b006d6f9105141mr1927168ejc.123.1648065975850; 
 Wed, 23 Mar 2022 13:06:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a056402278c00b004195a50759fsm395390ede.84.2022.03.23.13.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:06:14 -0700 (PDT)
Message-ID: <140ba00d-9876-4d53-e00a-c6469551b7a7@mind.be>
Date: Wed, 23 Mar 2022 21:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>
References: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
 <c2c49834-638c-dbfe-bbba-7bcbe153a660@mind.be>
 <20220323203535.307d504a@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220323203535.307d504a@gmx.net>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: fix missing
 files in overlays
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
Cc: Martin Bark <martin@barkynet.com>, "Sassen, Rutger" <rsassen@comecer.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/03/2022 20:35, Peter Seiderer wrote:
> Hello Arnout,
> 
> On Mon, 21 Mar 2022 22:56:41 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 17/03/2022 12:06, Sassen, Rutger wrote:
>>> When supporting multiple hardware targets, overlay_map.dtb might
>>> be needed to map overlay names to one of several implementations.
>>
>>    I've added a reference to the documentation.
>>
>>>
>>> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
>>> ---
>>> Changes v2 -> v3:
>>> - in Config.in use if statement instead of depends (suggested by Peter
>>> Seiderer)
>>> - mention the filename overlay_map.dtb in the help text (suggested by
>>> Peter Seiderer)
>>>
>>> Changes v1 -> v2:
>>> - instead of always copying overlay_map.dtb, make it configurable
>>> (suggested by Peter Seiderer)
>>> - do not copy README since it a special case, only needed when
>>> installing overlays to a non-standard location (suggested by Peter
>>> Seiderer)
>>>
>>> When supporting multiple hardware targets, overlay_map.dtb might
>>> be needed to map overlay names to one of several implementations.
>>>
>>> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
>>> ---
>>> package/rpi-firmware/Config.in | 12 ++++++++++++
>>> package/rpi-firmware/rpi-firmware.mk | 7 +++++++
>>> 2 files changed, 19 insertions(+)
>>>
>>> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
>>> index 8070dc3019..36054353f8 100644
>>> --- a/package/rpi-firmware/Config.in
>>> +++ b/package/rpi-firmware/Config.in
>>> @@ -93,6 +93,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>>> overlays, to support HATs (Hardware Attached on Top, add-on
>>> modules).
>>>
>>> +if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>>> +
>>> +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
>>
>>    In the end, I don't think this option is very useful. So I removed it...
> 
> Why to you think so?
> 
> I am still convinced the overlay map should be optional (in favor of explicit
> overlay/feature loading/enabling instead of firmware magic) and the
> overlay map is only one way to achieve a hardware dependent feature loading
> (the other way is via Model Filters in config.txt, see [2])...

  But AFAIU the presence of the overlay map doesn't stop you from using the 
other mechanisms, right? It's similar to how we install all the dtbo files even 
though maybe only one of them is relevant for you.

  If the presence of the overlay map does have an effect (i.e. if you'd need to 
remove it in the post-build script to get a correctly booting system), then the 
option indeed does make sense.

  Context: we want to avoid adding too many Config.in options, to make the 
complexity of the menus manageable. We make something a Config.in option only if 
it has a significant impact on rootfs size, or if it makes the difference 
between working and non-working system.

  Regards,
  Arnout

> 
>>
>>> + bool "Install DTB overlay map"
>>> + default n
>>> + help
>>> + Say 'y' here if you need to support multiple hardware targets
>>> + and you need overlay_map.dtb for target dependent mapping of
>>> + overlay names to one of several overlay implementations.
>>> +
>>> +endif # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>>> +
>>> config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
>>> bool "vcdbg"
>>> depends on BR2_arm # prebuilt arm binary, rpi-userland
>>> diff --git a/package/rpi-firmware/rpi-firmware.mk
>>> b/package/rpi-firmware/rpi-firmware.mk
>>> index b46a7f5270..800b560070 100644
>>> --- a/package/rpi-firmware/rpi-firmware.mk
>>> +++ b/package/rpi-firmware/rpi-firmware.mk
>>> @@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>>> endef
>>> endif
>>>
>>> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)
>>> +define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
>>> + $(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb
>>> $(BINARIES_DIR)/rpi-firmware/overlays/
>>
>> ... reducing the patch to just this single line.
> 
> Which renders the review process to void (as the option was introduced by
> Rutger on my request and this is what I reviewed/acknowledged by the Reviewed-by tag)...
> 
>>
>>    Please check if the commit [1] does what you need, if not I can recover the
>> original patch with the Config.in option.
> 
> +1 for the Config.in option ;-)
> 
> Regards,
> Peter
> 
>>
>>    Applied to master, thanks.
>>
>>    Regards,
>>    Arnout
>>
>> [1]
>> https://git.buildroot.org/buildroot/commit/?id=da38cdead909aa133b9c468ddebf3f67c8d198f2
>>
>>
>>
>>> +endef
>>> +endif
>>> +
>>> # Install prebuilt libraries if RPI_USERLAND not enabled
>>> ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
>>> define RPI_FIRMWARE_INSTALL_TARGET_LIB
>>> @@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
>>> $(RPI_FIRMWARE_INSTALL_CONFIG)
>>> $(RPI_FIRMWARE_INSTALL_DTB)
>>> $(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
>>> + $(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)
>>> endef
>>>
>>> $(eval $(generic-package))
>>> --
>>> 2.20.1
>>>
>>>
>>> *Disclaimer*
>>>
>>> This email communication is CONFIDENTIAL. If you are not the intended recipient,
>>> you may not use, copy or disclose to anyone the message or any information
>>> contained in the message and I ask that you please notify me by return email and
>>> delete this communication immediately. Thank you.
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
