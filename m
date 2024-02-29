Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B02C54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 09:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DD6041714;
	Thu, 29 Feb 2024 09:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Gi6NW1919tU; Thu, 29 Feb 2024 09:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 160FC41716
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 160FC41716;
	Thu, 29 Feb 2024 09:33:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F7F01BF408
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AD7C41716
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 09:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXmySVZmYnml for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 09:33:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B56B241714
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56B241714
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B56B241714
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 09:33:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B619AC075A
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 09:29:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE5A6E000B;
 Thu, 29 Feb 2024 09:29:27 +0000 (UTC)
Date: Thu, 29 Feb 2024 10:29:25 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20240229102925.62a9ecbf@booty>
In-Reply-To: <CH2PR12MB5004F29862E7DA6B163B2C97F0562@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-6-neal.frager@amd.com>
 <CH2PR12MB5004CB6FA7EA005C4F36C796F0452@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004F29862E7DA6B163B2C97F0562@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709198968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owJab9M1fqA+B6N+DoLf7SdPiH1Z72KI/8KTYRR3lmw=;
 b=CJQ5pRXF5wiBj4ppx0JR4dvLtfE3S2OfoZATMKlkZ0pDzjH6WWFlyf4hOcn5IpFTzZu7Ue
 H8+wYek8oeo7eY36pC6ZDeTJEmQlIiS9JsJEpH2CScTeiefK0NE7mpBqIUfJifymITTdxC
 UvWw+fEKDgd3DQxVTRbczlG00vMY1Flhqrel+ivw5rbmpEdUff8CfHxwI0uHW90Y9SX3l8
 ZedXtYR/CxCrVDSfCRhs1OYcK6escMnG+KdfwTQ1kkla6jUi/LrC44h485LzPolA8fEKoZ
 RhSN1AwrGB3LOXq9NK+NmDI56OUwxkMf8jK5lA5N983uSlqhUP0jR07tvL9AkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CJQ5pRXF
Subject: Re: [Buildroot] [PATCH v9 06/11] boot/zynqmp-firmware: new boot
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Thu, 22 Feb 2024 16:35:21 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hello everyone,
> 
> Just a friendly reminder.  Any updates?
> 
> > Now that the toolchain-bare-metal-buildroot has been applied, do you have any
> > feedback regarding the remainder of the patch set?  
> 
> > One open question I have is regarding the patches for zynqmp-firmware and
> > versal-firmware.  These patches are no longer neeeded since being applied to
> > release version xilinx_v2023.2.  I kept them with the idea that users may
> > still be using older versions of software, so the patches enable users to
> > work with versions as old as 2022.2 for zynqmp and 2023.1 for versal.  
> 
> > Do you agree with keeping the patches or do you think it is better not to
> > include them and to say that support begins starting with version
> > xilinx_v2023.2?  
> 
> What are your thoughts?
> 
> > create mode 120000 boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
> > create mode 100644 boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch  

Apologies for the late reply...

I think we should not put any effort in encouraging the practice of
using old and perhaps not-maintained-anymore software that some
proprietary tools tend to enforce.

We do have a mainline pmufw that works without needing any patches
thank to your (very appreciated!) effort, so let's just support the
latest and greatest pmufw version and be happy.

Your patches are there in this series anyway, and will be, so whoever
wants to use an old version can do some research and find them.

So, I vote to not have these patches in Buildroot.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
