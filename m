Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5173EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F9F83ED1;
	Sat, 28 May 2022 19:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrE88DJhyyeN; Sat, 28 May 2022 19:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED2783E6C;
	Sat, 28 May 2022 19:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A50A11BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93CCE60E49
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rx0EOWAEH6Am for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 765E660C04
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:46:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A889519F553;
 Sat, 28 May 2022 21:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653767202;
 bh=xahKpW9kZeQvN9Ed/pzi+nwEzE7enPd4oDIwiwQujWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EjLodKHFDzJ3/w3uZFo1gik0EQjnQEVbYLw8g3F7tfgAayRMMf5aZ8KHmeLsyWe0a
 cQeNeVUCeRts0MUwRd8jD41g25du7GyfHoAdjuDPejIJqYWScd2In6tILWBL6IAzfi
 NxJs8QlH0RmhgsOkHr0uzbMT43zrFyu5w23tDpYsfI65qi8xrowxFRmvZf+xluEXw4
 VhJxz+Sk9ABqfeJ0x18aTFL8idJMLVMtBCc53qhUhxSitW/mFHaofOFYqu8efRPJCj
 wW7cnwHp9+UOttWeyDZKt2pvXnVABl/sfe4gWbFnbptP04zOLq4Y4ChbLAW7pgZJkC
 SwM+nOttjcssQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 21:46:39 +0200
Date: Sat, 28 May 2022 21:46:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220528194639.GF301044@scaer>
References: <20220526213406.384405-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220526213406.384405-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/qemu_arm_vexpress_tz_defconfig:
 optee-os needs dtc compiler
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-05-26 23:34 +0200, Romain Naour spake thusly:
> optee-os 3.17.0 need host-dtc package to compile the devicetree
> added by the commit [1].
> 
> [1] https://github.com/OP-TEE/optee_os/commit/3e03eb38ae68be06f43432d8034b69b7b3bd7ff6
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/2510255578
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/qemu_arm_vexpress_tz_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index def11721ae..f8956f1c05 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -38,6 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
>  
>  # OP-TEE components
>  BR2_TARGET_OPTEE_OS=y
> +BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
>  BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
>  BR2_PACKAGE_OPTEE_BENCHMARK=y
>  BR2_PACKAGE_OPTEE_EXAMPLES=y
> -- 
> 2.35.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
