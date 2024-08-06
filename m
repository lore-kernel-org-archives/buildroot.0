Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9903C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 21:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B9C6061F;
	Tue,  6 Aug 2024 21:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6S1tuaf74nT; Tue,  6 Aug 2024 21:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF3F60657
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FF3F60657;
	Tue,  6 Aug 2024 21:33:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7189B1BF30B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FA4560657
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryfdzCZbF0ZC for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 21:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B7CF6061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7CF6061F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B7CF6061F
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 21:33:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F8F160003;
 Tue,  6 Aug 2024 21:33:23 +0000 (UTC)
Date: Tue, 6 Aug 2024 23:33:22 +0200
To: <nick.whitlock@eizo.com>
Message-ID: <20240806233322.679a8d3a@windsurf>
In-Reply-To: <OSAPR01MB45613F3A13D852BB4C96256D84E22@OSAPR01MB4561.jpnprd01.prod.outlook.com>
References: <20240513155907.104270-1-nick.whitlock@eizo.com>
 <PH1P110MB1603A56A788CF657472E9F8C9FE2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <OSAPR01MB45613F3A13D852BB4C96256D84E22@OSAPR01MB4561.jpnprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722980004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JM910KZEX/a0opRADVmix7SoPnox3HZhzQNwKLE2W/g=;
 b=iEcjgtrRSOfRb5EdL69Ptg1cQn5jVIC9PWjacGyepfuU+tJZCbzbldkHIsKv/NHhQydoUx
 za+GfZLVWLIY7XShgZz37fANuF5XZ5RGARdZL+wY1rauY9Er4ZY6dFETHvseekN/SRhdXT
 R2//J77da0slIR94C00AAwCpJrL6LOKLpF2PMDHQA+ji6WqFkO/MiBXKWMvxmeIN3Nq0ez
 NxYv1QWmsEQRZRV3P0lrEX+FGtDeQqiIusZiJ7GW+EQbnI/nt0w0CWhiRhVhIu2H+6ladn
 eBVcq9XgSJ6/bUwPJ1xyVs9VuQrw7ToYUXUNLmnZ6xIq1WWQCqv+N/dy8Gtgyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iEcjgtrR
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
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
Cc: vfazio@xes-inc.com, yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nick,

Sorry for the delay in getting back to you. Thanks as well to Vincent
for the review.

On Mon, 13 May 2024 20:03:56 +0000
<nick.whitlock@eizo.com> wrote:

> If a selectable (or user-enterable) version number is the consensus,
> then I'm all for that.
> 
> There isn't currently a way to use recent NVIDIA discrete GPUs (read:
> Ampere and up) for GPGPU in embedded spaces until this gets resolved
> though. 

I think a version selection is the only approach that we have. Indeed
keeping support for older GPUs is important, but supporting newer ones
is also important, so we will have to live with a more complicated
package that supports different generations of the driver.

Nick, do you think you could prepare a new iteration with such a
version selection, but also taking into account the rest of the
feedback from Vincent?

> > +config BR2_PACKAGE_NVIDIA_DRIVER_GTK
> > +       bool "nvidia GTK acceleration"

Could you also give a little bit more details about this GTK
acceleration? How come two additional .so files can "accelerate GTK" ?
How do they interact with GTK ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
