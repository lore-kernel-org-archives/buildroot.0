Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA485C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 11:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F9FF608B7;
	Fri, 25 Nov 2022 11:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F9FF608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MjTyOKPKWKN; Fri, 25 Nov 2022 11:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E4CC606CB;
	Fri, 25 Nov 2022 11:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E4CC606CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 760731BF37B
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 11:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51D83813BD
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 11:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D83813BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYdkEW0Rnwqz for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 11:33:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 012ED81384
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 012ED81384
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 11:33:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 120241C0005;
 Fri, 25 Nov 2022 11:33:44 +0000 (UTC)
Date: Fri, 25 Nov 2022 12:33:44 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221125123344.045a4441@windsurf>
In-Reply-To: <9EE282D7-0646-421F-BF16-BD424E508ABE@amd.com>
References: <20221124102144.16833-1-neal.frager@amd.com>
 <20221124221557.4a18a2a9@windsurf>
 <CH2PR12MB5004D69C65B84BEB0241DB7CF00E9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20221125120246.1fed3208@windsurf>
 <9EE282D7-0646-421F-BF16-BD424E508ABE@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669376026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjHfBULzH5T6L0anLGtqlth+FkkPDhS5p2VFyZ93Trg=;
 b=JLnsL62liA4Rjtue8vUZxRgDo4Pu4FHh/3+Kd2lzOaQav2ft6oNILHs6+0b2bCk7Qqe8t3
 SM4JDFzL3jCx2HyMoumRvH4LTe1vDI+j3n9+heSe2RdXqM07/8Pf1fWNEm1gBzjJr2dxgC
 FdySbkYTA68vJPAbSQdlTpF+B9GIUNv3ssH9mk9uhl1MqiYAoEzLnFXPOnSpIYZuzEIofB
 E+w9z8Ck2fWyVSOjuPq3LbLHF3NY8RoRhjnjeIHzZCi9ML2YpN7dmZJE7VY2jF7W9Bjpv1
 wIs0r4Z8qoiwJuZ/jlEAMo9pjGeUBuzv9fYe6EipxfLOpz7sBuXmPFliMERVjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JLnsL62l
Subject: Re: [Buildroot] [PATCH v6 1/2] package/versal-firmware: new package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "O'Neal, Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Fri, 25 Nov 2022 11:18:43 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Yes, it is the full source code, just like there is the full source
> code for the zynqmp pmufw.  The problem is that all 3 of these
> applications are running on a microblaze.
> 
> So to build them, we need to be able to work with two compilers.  A
> microblaze compiler for all the firmware applications and an ARM
> compiler for the rest.
> 
> Normally, it would be much better if we could build the pmufw for
> zynqmp and the plm and psmfw applications for versal.  We have
> discussed this before, but do you have any new ideas for how we could
> configure buildroot to download and build two compilers for two
> different architectures?

Sure: we are already doing that for some ARM64 platforms that need to
build ARM32 firmware: this needs a different compiler.

It is for this reason that we have the package/arm-gnu-toolchain/
package, which downloads and installs a pre-compiled bare-metal ARM32
toolchain. Then this toolchain is for example used by
boot/arm-trusted-firmware/ in some situations:

ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN),y)
ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-toolchain
endif

So if you have a Microblaze bare metal toolchain available somewhere,
we could create a package for it, and build the firmware from source.

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
