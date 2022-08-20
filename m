Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F153CC25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 12:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69765408D7;
	Sat, 20 Aug 2022 12:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69765408D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0cQJb2WBkNj; Sat, 20 Aug 2022 12:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D633408CB;
	Sat, 20 Aug 2022 12:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D633408CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 163C01BF2B0
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 12:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E545860768
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 12:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E545860768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3FF_zNQuLpN for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 12:13:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B0D60709
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03B0D60709
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 12:13:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B18686012F;
 Sat, 20 Aug 2022 14:13:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 14:13:23 +0200
Date: Sat, 20 Aug 2022 14:13:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220820121323.GI2167049@scaer>
References: <0e18605c9938776a707a4aab032be74a1a9afe8e.1660828116.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e18605c9938776a707a4aab032be74a1a9afe8e.1660828116.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660997606;
 bh=dxb77WtJyAW++KQeS9bwCPGR81rhoRZhfXnAvB7Xgs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MXmsIo83CeNsbNMMTyoC/SDtMHN/MAA0FXaqyN7OPlry+ieow/boSQPyh3ZYESvid
 G4Ct0ATpgExRfCrpXav19TgYUJpc6zUr0T76NWtNWncqkki9sRzseof8NH06GH3JmZ
 CgJmcxk5kwuTecIyzejU5A2/vDVrkgeSQXa6fTxJLy0MHTnx87rbduP9NMXT+KDqCU
 DIzQxOlWASfugQphwGliKY1vDuxovshjOMCPBBO6tF0zIIItxk61RctpqmqRxX+Ie7
 jZn/tFXPN4weNXw3jaT7O9pZnMZWnFiKR6MNSNBT3GIyA3IThV85IuhXVTYYrqw/3c
 OLMIrZPpmCN/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MXmsIo83
Subject: Re: [Buildroot] [RFC PATCH] package/linux-firmware: Add more Intel
 WiFi 22000 series
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2022-08-18 15:18 +0200, Stefan Agner spake thusly:
> Add more Intel WiFi 22000 series firmware files. Allow to select the
> firmware version using shell globs.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> With the Intel WiFi 22000 series the amount of firmwares is just stagering. So
> much so that it causes size issues in our case.

You know that you can write a post-build script to tweak the target/
directory at the end of the build? That can be a workaround until a
better solution is devised.

> Intel firmwares seem to have an API version, which is the last digit before the
> file ending .ucode. The Linux kernel sources have defines which API each
> individual driver supports (e.g. Linux 5.15 22000 series kernel driver
> supports ucode API 39 up to 66).
> 
> This crude method uses just file glob matching to allow to select firmwares
> which match the kernel in use. However, this approach has a problem: Some
> API versions are missing. E.g. simply using "66" doesn't work since some
> firmware are not available with the latest API supported (e.g.
> iwlwifi-so-a0-gf-a0-64.ucode).
> 
> Also if an older kernel is in use, some firmware files with an older maximum
> API might just be missing, which leads to tar complaining about missing files.
> 
> In this case, we can use 6[46], which happens to select the newest version of
> all firmwares (it seems that firmwares which are available with API version 66
> have only been released with version 63 before).
> 
> However, this of course might be just a coincidence. Ideally Buildroot would
> select the newest version available for a particular API version. Not sure if
> this is easily doable.
> 
> Thoughts?

First: on one hand, I like the simplicity of that patch; if we can't
come up with better, I can see going with it.

But on the other hand, it is also very un-userfriendly. I don't see how
we could _reasonably_ come up with a way to cherry-pick appropriate
firmware files.

First, the linux package depends on linux-frimware, so linux-firmware
can't depend on linux; we could still use a patch-dependency, so that
linux gets at least extracted and patched before linux-firmware gets
installed, but that is going to be tricky to maintain.

We could then grab IWL_22000_UCODE_API_MIN and IWL_22000_UCODE_API_MAX
from drivers/net/wireless/intel/iwlwifi/cfg/22000.c

And then, we'd have to code some non-trivial magic that iterates over
all iwlwifi-Qu{,Z}-*.ucode and check if their API part is in the range,
and for a single "family" of firmwares, keep the highest one (how do we
know that two firmware files are f the same family? Just because they
only differ in API version?) That's a bit brittle...

[--SNIP--]
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 64d096df14..2283cd7d5e 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -436,7 +436,20 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
> -LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
> +LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB = $(call qstrip,$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB))
> +LINUX_FIRMWARE_FILES += \
> +	iwlwifi-Qu-b0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-Qu-c0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-Qu-b0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-Qu-c0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-QuZ-a0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-QuZ-a0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-cc-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-so-a0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-so-a0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-so-a0-gf-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-ty-a0-gf-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-so-a0-gf4-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode

This list is not entirely alphabetically sorted.

Also, why do you extend the prefixes, from iwlwifi-QuZ- and iwlwifi-Qu-,
to include extra c0, b0, a0 and so on? Why can we just have:
    iwlwifi-Qu-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
    iwlwifi-QuZ-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode

Oh, and in at least linu 5.17, there are also references to
iwlwifi-QuQnj-, iwlwifi-SoSnj- and a bunch of others. And
specifically, there is also iwlwifi-cc-a0- which in Buildroot is
installed with BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260 and not
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000

So, maybe we could split the families further as an alternate solution?

Regards,
Yann E. MORIN.

>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>  endif
>  
> -- 
> 2.37.2
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
