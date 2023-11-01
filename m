Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55733C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 09:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60B16FBA9;
	Wed,  1 Nov 2023 09:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60B16FBA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbrLGFEALCzI; Wed,  1 Nov 2023 09:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F216FBBB;
	Wed,  1 Nov 2023 09:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F216FBBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1453A1BF47E
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 09:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7AB243030
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 09:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7AB243030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqN5-jQTNtlC for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 09:24:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CC3841972
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 09:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC3841972
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6ABA71C0006;
 Wed,  1 Nov 2023 09:24:39 +0000 (UTC)
Date: Wed, 1 Nov 2023 10:24:38 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231101102438.3bdf8707@windsurf>
In-Reply-To: <CH2PR12MB50047AC40733F136A2AE7DFAF0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-5-neal.frager@amd.com>
 <20231031135419.56b25f1c@windsurf>
 <CH2PR12MB50047AC40733F136A2AE7DFAF0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698830679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmr5Of4egvWA8K9HuS2ePGDlhdeSMIb7z4NjhsxzKmo=;
 b=KEl3+0KE2VpacI2Hvt3PXkA2Yr88kEofph/6kJICeweIOUwV/d2e4CDO5juOkXfHsmhOE7
 Vzaokl03PDmr8/HtFuFPTtG01zblQeQ6Ve55XQJdTVJM0JBcP/i5rNk5xk6AAKXznedTrO
 IsXsxe70YUzwYXWzGKROL8jLB3qD+Ang8vYN5RE7H4zFWp2l6Ew9sf6yPf1qQbFK78vuVO
 XytxC+zsG5saiqzKaFlfOOmoqpoJp7MP/RUL5c28HYmb/GdWUlUFEjKt4c7Ww1zUENHXfT
 d8TcVPAXt9hul8T5DzVOge+/2nN45mS2d+sIXXSpe9USnQi7Uw3xg5REEJb0ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KEl3+0KE
Subject: Re: [Buildroot] [PATCH v6 05/10] boot/zynqmp-firmware: new boot
 firmware
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Tue, 31 Oct 2023 19:07:29 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> When I do this, I am stuck with the following message:
> make: *** No rule to make target 'toolchain-bare-metal-buildroot', needed by '/buildroot/output/build/zynqmp-firmware-xilinx_v2023.1/.stamp_configured'.  Stop.
> 
> I also tried with host-toolchain-bare-metal-buildroot:
> make: *** No rule to make target 'host-toolchain-bare-metal-buildroot', needed by '/buildroot/output/build/zynqmp-firmware-xilinx_v2023.1/.stamp_configured'.  Stop.
> 
> I had this problem before which is why I solved it by just bypassing the dependency straight to newlib-bare-metal.
> 
> Any ideas what the virtual package is missing?

Yann just pointed out to me what is very likely to be the explanation:
your toolchain-bare-metal-buildroot.mk is incorrect. It does this:

+(eval $(host-virtual-package))

While it should have been:

+$(eval $(host-virtual-package))

due to that, this makefile is most likely incorrect from a syntax point
of view, and ignored by make when all makefiles are parsed.

What I am a bit surprised with, is why you send a patch series that
includes this virtual package if you know you couldn't get it to work?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
