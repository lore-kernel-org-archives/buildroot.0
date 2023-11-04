Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E38C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F52E8237A;
	Sat,  4 Nov 2023 13:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F52E8237A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOxI0UutM6_P; Sat,  4 Nov 2023 13:37:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A63822ED;
	Sat,  4 Nov 2023 13:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A63822ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BBF31BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71DA641DD5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DA641DD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgOEDk6vAAQJ for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:37:06 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 378D641923
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 378D641923
Received: by mail.gandi.net (Postfix) with ESMTPSA id F28D760003;
 Sat,  4 Nov 2023 13:37:02 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:37:02 +0100
To: Javad Rahimipetroudi <javad321javad@gmail.com>
Message-ID: <20231104143702.667728af@windsurf>
In-Reply-To: <20231104072458.7369-3-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
 <20231104072458.7369-3-javad321javad@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699105023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNuMXl6pIKbC37HJRh/w67sSUVNkYY8dKASSfgtvlec=;
 b=CPB0DWGgVop9FLwTO+4/4QvZwmmETUJmXR+ROvF9vmrvwjNDyT9ZWtqbxtPklqW6uG6o7j
 +rYiI+4vEFBnjsdicUHeGtdFjdwq472/JoQBrxpMnpsSChmyaAnUHadJB0ekHjfoxBf2GI
 3seruwIPrqkvyEZRRtxCEtaRdCkVe2k0nxmLsbj6TWfHP8ff0gmvpq20BHyv7A+vzozmHh
 vIoEpEwjPozO8XFtDBfAq1wFege7QHRG6sLaOdII+DLdBhc66O4xMzDtWnAJCa4aR9bTl/
 Hq+dNfDHkgqCUEFY1B+d/40d0UCen9Y+fEg0z9qjkroXOiaAxt4EvcDCB4MBmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CPB0DWGg
Subject: Re: [Buildroot] [PATCH 3/7] configs/pine64_defconfig: bump Uboot
 version to 2023.04
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 10:54:54 +0330
Javad Rahimipetroudi <javad321javad@gmail.com> wrote:

> The Uboot version has upgraded to 2023.04.
> Furthermore, the custom itb was no longer required. So it has been deleted.

Where is it deleted? I don't see anything related in this commit.

> diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
> index 8d2324260c..b567462f5d 100644
> --- a/configs/pine64_defconfig
> +++ b/configs/pine64_defconfig
> @@ -16,15 +16,17 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_plus"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>  BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"

These should most likely have some explanations in the commit log.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
