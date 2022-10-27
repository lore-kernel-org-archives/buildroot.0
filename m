Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87075FA3740
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 14:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14BD160E4A;
	Thu, 27 Oct 2022 14:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14BD160E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULhhWWmE37kW; Thu, 27 Oct 2022 14:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D55A60E45;
	Thu, 27 Oct 2022 14:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D55A60E45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3881BF37E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 14:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042C2813CC
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 14:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 042C2813CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTzsconvakpl for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 14:22:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA7C813B2
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BA7C813B2
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 14:22:49 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id m6so1720890pfb.0
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 07:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kvLKEH5lkQLyl9Vbhrj0a87iK4fAEuCd34KjgX2dfac=;
 b=NmW0Q/+fybjMfdwP8BJPIjSe9GXy0MBZLw06SdfSxqeSOYE1+KSTn0sFXg5hPAXP1G
 mNww04Cjb54lJvI7jQLTPgw4BL5L8YuXoE4onezD9PdRXk8akqm4J0olGm63YbBs60Ly
 XomyNrxNes49xk+h4CBvR6BrGx/FuHquVxd84vY/UK5+3NftbU9ZCm2Bghi0j28cLw9H
 d7gLqS8WcdTosURswAToQ3hg8NhFc6vM3VB/l78DlrGGMAm4X+gNvkDEN6ruKl9YHJir
 WLukFJhUiwMc/32TLeHOHOYNbq8BMMx1xijxgGy0sqOPjm1f75qZ/HzFvOim3COh3081
 VfLQ==
X-Gm-Message-State: ACrzQf30T7lbaIEf2KZSPBN7wVrwlrdVd8UPgIQFd1zsHxl6ymNn/yz6
 eYIY9/w4VWuWD1+6uMpeKM87zJzyjQpOCliOveI=
X-Google-Smtp-Source: AMsMyM70Q5r69EKMN5YmmjJjHGMzzp+IpRJMc2qkdaJXKlyUSHHy2Np2qDohtMfg9iuArERXsaIYhDGVHKahOh9wGgg=
X-Received: by 2002:a63:555e:0:b0:43c:4f2e:dd25 with SMTP id
 f30-20020a63555e000000b0043c4f2edd25mr43467837pgm.131.1666880569389; Thu, 27
 Oct 2022 07:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221022142040.625468-1-ju.o@free.fr>
In-Reply-To: <20221022142040.625468-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Oct 2022 11:22:37 -0300
Message-ID: <CAOMZO5CxFizBnnyTf-bW=mJ=kO-cdrchN8xDgm6HaGr3+sKPMA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kvLKEH5lkQLyl9Vbhrj0a87iK4fAEuCd34KjgX2dfac=;
 b=NzpqHcCQRWxjTLIVOs0YIad5x8GDfxgX98H9ghHgcbnDlV5WSsheBvwxiY7HUsjAuI
 dBqP0OztKvANs0VRCbdQVnuXQnnV7Gd3XiGKYXTZjNIljUmeV45yCMaTSgECGmMgYVm4
 2V1n11rmHHfkYDaF9a3PFOCh5KDyhki36XeeEUr4h3SRkNXfzUvXhm75NMRVz9KkNXuo
 O87FHEyTyL06XP0G+232DGtcb+9IdrMqCZxS93eOGYeybqIxC9SUsp5bxZHSMk+YZWIF
 h4mIYrwt9LeJAcJj7sKBCyAN1AK6MgzZGSzEa6Ej9Lv/bYgHaETNm592YQqK4YL9JCzX
 yROg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NzpqHcCQ
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8{m, mm}pico: disable ATF SSP
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sat, Oct 22, 2022 at 11:21 AM Julien Olivain <ju.o@free.fr> wrote:
>
> imx8{m,mm}pico configs are currently failing at ATF link with output:
>
>     aarch64-buildroot-linux-gnu-ld: asm_stack_protector.o: in function `update_stack_protector_canary':
>     (.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'
>
> The ATF version in those configs does not provide platform level
> support for SSP.
>
> This build failure was introduced by commit
> 09acc7cbc91f50305730ca0690a58fb93529034b
> "boot/arm-trusted-firmware: fix SSP support". Before this commit,
> ATF SSP was globally disabled, by default.
>
> This commit fixes those build issues by disabling the ATF SSP in the
> defconfigs.
>
> Fixes:
>   - https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498119
>   - https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498120
>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

I met the same build error when trying to build kontron_bl_imx8mm_defconfig.

Tried your suggestion and it fixes the build error:

diff --git a/configs/kontron_bl_imx8mm_defconfig
b/configs/kontron_bl_imx8mm_defconfig
index ff376662e9e5..b05828981081 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+# BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880000"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y

Does this need to be fixed globally? I suspect other defconfigs face
the same error.

Thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
