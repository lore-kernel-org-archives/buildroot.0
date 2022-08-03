Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E977C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 15:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B4D610BC;
	Wed,  3 Aug 2022 15:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B4D610BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ozUPVfwvVRD; Wed,  3 Aug 2022 15:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88DC610B3;
	Wed,  3 Aug 2022 15:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D88DC610B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06A311BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D67BD82890
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D67BD82890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGMV3SN9Ro2j for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 15:47:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E1B82871
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6E1B82871
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 15:47:15 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JGaZotIsdcdGJJGaZoPS5R; Wed, 03 Aug 2022 17:47:15 +0200
Message-ID: <fd851811-a1a2-4016-afdd-6e780f8dab50@benettiengineering.com>
Date: Wed, 3 Aug 2022 17:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220803074349.7590-1-francois.perrad@gadz.org>
 <20220803074349.7590-2-francois.perrad@gadz.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220803074349.7590-2-francois.perrad@gadz.org>
X-CMAE-Envelope: MS4xfC0y9ApmsAx3dRX5ujZc/S1aYui91w4Ee8djqZ1U6TGs7Y2UWc+wPb0IsmIKnuihRkUmSm+9vnVh9az9/5oW4BWCKuvUkZ/4fHN33lRhJtseu5E6UZPc
 urb0LtTE4xCL+bBgxb+/+BW6JdxDhOnQAmzsmyYZYioOm8fdQwEXCdz72sIwX51IgMjRl/DyXchx4SYxV0xqk34DTG1PUa8AArOr68HfuBwcbNlw/Xivgwg9
 Ow/UUuADEcMefBpU0tVKvw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659541635; bh=nDuOj+68STElUNJ19TxUpc1TiOkCEzyoffLDN4fesGs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=d3AwDi/q5BRpHkXvBtpCmkQOhzH0dcEeP8TonDawrY60kISy6JrzyeToyGFTW3Hpx
 c2ZijulxKUsJFZqyKzp5DfniU4s1MxGqjh+sXceEXz7C55Mth3XRK39Qj37XNn98Gg
 wLaRC5n/IPLxqiK9T+IOWBSWlGlYVqfUfDq4QuwyEN53jlsUXcVQ86VdiaIU/zMMtq
 f9YvLWAE/+E6fbN2TwD1E9WoXfhNFjHVILdf4rFQgcuHAt9TPxDSqrWymzyhepwTZb
 NgAhrNZxRqyJUqxwkU4MPGPBO0qd3YFCvR2FAjl443otx3rF2Vz4aPC64PjRvdOGDG
 D7myfJRDyREZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=d3AwDi/q
Subject: Re: [Buildroot] [PATCH v2 1/3] boot/arm-trusted-firmware: allow to
 generate BL2 from RCW
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

Hi Francois,

On 03/08/22 09:43, Francois Perrad wrote:
> This patch adds option BR2_TARGETARM_TRUSTED_FIRMWARE_RCW that allows
> TF-A to encapsulate a pre-loader RCW (Reset Configuration Word) file
> into BL2.
> 
> Upcoming NXP QorIQ family board needs this option.

You've forgotten your SoB and my Reviewed-by here

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   boot/arm-trusted-firmware/Config.in               | 6 ++++++
>   boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index b1fc03e10..0f91953bf 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -85,6 +85,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
>   	  platforms were ATF encapsulates the second stage bootloader
>   	  (such as U-Boot).
>   
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
> +	bool "Include RCW"
> +	select BR2_PACKAGE_HOST_QORIQ_RCW
> +	help
> +	  Include the RCW in BL2.
> +
>   config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
>   	bool "Build BL31 image"
>   	help
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 35a95a7ec..eb9b656fe 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -133,6 +133,12 @@ define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
>   endef
>   endif
>   
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-qoriq-rcw
> +ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RCW=$(BINARIES_DIR)/PBL.bin
> +endif
> +
>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
>   ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
>   endif

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
