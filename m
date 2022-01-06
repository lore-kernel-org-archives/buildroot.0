Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C9756FC05;
	Thu,  6 Jan 2022 15:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyzdIlXBh7rl; Thu,  6 Jan 2022 15:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1BAB6FC06;
	Thu,  6 Jan 2022 15:05:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE291BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DE7081397
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pn_RwtYNUcj7 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E1FB81394
 for <buildroot@busybox.net>; Thu,  6 Jan 2022 15:05:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h23so5400158wrc.1
 for <buildroot@busybox.net>; Thu, 06 Jan 2022 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Kzm9dXo5LoaC8N+y7Rg1ah1F5C4ZeUWvixCoNJ+7/d8=;
 b=F7eqIpMN1mWPt+66k+KDGxMJztySrUl6rAk4JWPeYz/nVDg0o33N9kqU4oZ+yVbA+7
 Xc4iSLABj1VxCRnCE58kToLv8qPBey6ojYSWGK1N+x1qOtIp+OrqxxfwnYzNELHmp0ng
 9M2alHW6zRHaR/vGM2RjPp1xxw7zQKOSgU9D4YexqACnsqxY09HlodPAkv1grmp1Cv6U
 cOsKxMMDqMZI2V3ptp6CjkWjEnLsnc36qzaVLv3U7Fb1eH0tS0bilxMSw//aH61MHItO
 k96nv89DV7kWStGoPvIEwWMBlVDKQlxIrhWqUdmC8TSGyWuypyVpTIk9paotVgIX71+H
 wMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Kzm9dXo5LoaC8N+y7Rg1ah1F5C4ZeUWvixCoNJ+7/d8=;
 b=RUZLuIKwClE5kY6FXLkYQJLDEMaOBjpJFCOeSJkRqPczEimtMsI5KyWZjr9fVW4HeM
 qTD+mNXM9rmSlnJ3Y67i5jFTiTgQNsXg6V+NgvtXZS9SR/SDsZIn3OYCatZPOJ+qIcyl
 chl0q2RqFyEYwY9PvPNsm14hrCwfC+MU3jJTCI4wvP2G3n0KA0WjR06rna7e+F1uF//p
 pgM5eDderwsCKkGFvNQtB+/U4tl5Y5f6oc1DwmyClKc6Y4gphHwD2PCMp4gFUvpR5LqM
 vfGk5Ml2JMjw2ZxetUBJQE4BzgZRf0egbX8gLU1Be2GbjB8C/F1E+4yCndoEgelTXGEC
 a1NA==
X-Gm-Message-State: AOAM530ujxU3vTL4yS1gh6qX0DYi+Q/a9I2Y/1ZvzH5vJJAWjxuOQcfT
 1xhHoa7BpRZymzV9MdFbZdp/af5MTyWxqP/N
X-Google-Smtp-Source: ABdhPJxPNnx4nrqOiKDkGhirxM1zINNYx1oXWVvHbQ/RQgZ0sJvXmqigtqyMWF3iN2MmHNwOlxFhZQ==
X-Received: by 2002:a05:6000:389:: with SMTP id
 u9mr49527012wrf.22.1641481537452; 
 Thu, 06 Jan 2022 07:05:37 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id p21sm2076096wmq.20.2022.01.06.07.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 07:05:37 -0800 (PST)
Message-ID: <eab1c1bc-2de1-cde0-a0f3-cdab1e59e32d@mind.be>
Date: Thu, 6 Jan 2022 16:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Changming Huang <jerry.huang@nxp.com>, buildroot@busybox.net
References: <20200207083857.28058-1-jerry.huang@nxp.com>
 <20200207083857.28058-5-jerry.huang@nxp.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200207083857.28058-5-jerry.huang@nxp.com>
Subject: Re: [Buildroot] [PATCH v5 5/9] boot/arm-trusted-firmware: allow
 additional make dependencies
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
Cc: thomas.petazzoni@bootlin.com, heiko.thiery@gmail.com, michael@walle.cc,
 geomatsi@gmail.com, matthew.weber@collins.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2020 09:38, Changming Huang wrote:
> Allow specifying additional build dependencies for ATF.
> 
> This might be more useful when using a custom git repository.
> 
> For example, when using with the ATF repository from NXP QorIQ,
> the qoriq-rcw is used to build the pbl binary image.

  This is not a very user-friendly way to do it. Since RCW support is something 
that is in upstream ATF, I think it makes a whole lot more sense to make it an 
explicit option. Something like:

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
	bool "Include RCW"
	depends on BR2_HOST_QORIQ_RCW
	help
	  Include the RCW in BL2.

  That way you can also add the RCW=$(BINARIES_DIR)/PBL.bin automatically to the 
variables (and this is an advantage of always calling it PBL.bin :-)

  I've marked this patch as Changes Requested.

  Regards,
  Arnout

> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
> changes since v4:
> 1. remove the option BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS.
> 2. modify the description.
> 
> changes since v3:
> no changes.
> 
> changes since v2:
> 1. introduce option BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS.
> 2. introduce option BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES.
> 3. rewrite the makefile with these two options
> 
> changes since v1:
> 1. Use option BR2_PACKAGE_HOST_RCW_ATF as the condition for RCW used by ATF.
> ---
>   boot/arm-trusted-firmware/Config.in               | 5 +++++
>   boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 +++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index 373591d497..c9b74064d7 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -142,6 +142,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
>   	  E.G. When using the QorIQ custom ATF repository from NXP,
>   	  the target 'pbl' can be used to build the pbl binary.
>   
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES
> +	string "Additional AFT dependencies"
> +	help
> +	  Additional dependencies for ATF build, E.G. "host-qoriq-rcw"
> +
>   config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
>   	string "Additional ATF build variables"
>   	help
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index bf1ac46cf6..43be2fef99 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -92,6 +92,9 @@ endif
>   
>   ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>   
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += \
> +	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES))
> +
>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
>   ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
>   ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
