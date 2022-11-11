Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E67C4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 20:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3499C60FF9;
	Fri, 11 Nov 2022 20:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3499C60FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTCjE8Q_1il2; Fri, 11 Nov 2022 20:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A5F560FA4;
	Fri, 11 Nov 2022 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A5F560FA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C04C1BF42C
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB43140132
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB43140132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRnQoYrh6Ytl for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 20:18:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 608E2400B8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 608E2400B8
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 20:18:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 67F5640003;
 Fri, 11 Nov 2022 20:18:10 +0000 (UTC)
Date: Fri, 11 Nov 2022 21:18:09 +0100
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20221111211809.5cd3802e@windsurf>
In-Reply-To: <bab58c04544d0247bce855c8b984ce0d5349def4.1666935387.git.baruch@tkos.co.il>
References: <bab58c04544d0247bce855c8b984ce0d5349def4.1666935387.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668197892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRip/5a7GE4eFByY72bBq5vB+SnW/BtKWZHLUiHk6R4=;
 b=jqyh9qRxWQXNiQ8JFhb24K4FEpgGVBpRtfNBEPrLhd5Ld6eXK6mYttBWFggt7+WKytghVa
 Ptr+Wa4YRVFBz4j2ywrHkwPGG1AgyujelBlPLNhRt8aaT1LXKRSC6cwMVYR6soVn2XObQq
 iIlvG63rgNKdq+h8+jtEF5eHGPmNrMEUy04RxACtcbn/OrbWDKfBZucisvoQIa7sDlNzbJ
 9qU1BGhcddunN3rfP9DeHJuSK8Vvu1oHtKtYgLmhdMDqCeH7IRytKvgwK2/WvEI3R5n3IN
 9VLdPVBQ4FvMcBPWgtolAptOQDpGJVvJCN1G7keZTFuQnORvTo7YBoMaJZ9vnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jqyh9qRx
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: don't enable SSP
 by default
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Baruch Siach via buildroot <buildroot@buildroot.org>, buildroot@busybox.net,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Baruch,

On Fri, 28 Oct 2022 08:36:27 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> SSP support requires support in ATF platform code. Not all platforms
> implement plat_get_stack_protector_canary() hook. The result is build
> failure:
> 
> (.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'
> 
> Commit cf176128ec4 ("boot/arm-trusted-firmware: add SSP option")
> originally introduces this issue. But then commit ccac9a5bbbd
> ("boot/arm-trusted-firmware: don't force ENABLE_STACK_PROTECTOR") hid
> the problem by effectively disabling SSP for all platforms. So only
> after commit 09acc7cbc91f5 ("boot/arm-trusted-firmware: fix SSP
> support") the issue showed up.
> 
> Make SSP an opt-in for platform that actually provide the
> plat_get_stack_protector_canary() hook.
> 
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Cc: Dick Olsson <hi@senzilla.io>
> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Unfortunately, it seems like the SSP stuff for TF-A still doesn't work.
We still have build failures on several defconfigs:

https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821171
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821262
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821323
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821325
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821326
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821327
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821374
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821374
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821388
https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821583

Since your commit 09acc7cbc91f50305730ca0690a58fb93529034b
boot/arm-trusted-firmware: fix SSP support, we no longer force disable
SSP support when BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is disabled.

If one of BR2_SSP_REGULAR, BR2_SSP_STRONG or BR2_SSP_ALL is enabled,
all code gets built with SSP, including the TF-A code.

Prior to commit 09acc7cbc91f50305730ca0690a58fb93529034b, we were
passing ENABLE_STACK_PROTECTOR=0 when
BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP was disabled, making sure that TF-A
was forcefully disabling SSP, even if it was globally enabled via one
of BR2_SSP_...

So I'm afraid the fix in 09acc7cbc91f50305730ca0690a58fb93529034b does
not work :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
