Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D89C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 12:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 048D560EA0;
	Fri, 19 Jul 2024 12:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qH8R6GVkk1FY; Fri, 19 Jul 2024 12:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 188F460EA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188F460EA6;
	Fri, 19 Jul 2024 12:41:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4A51BF316
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 12:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59C1060EA6
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 12:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmCNbBgVounY for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 12:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32B4860EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B4860EA0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32B4860EA0
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 12:41:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5356B60007;
 Fri, 19 Jul 2024 12:41:46 +0000 (UTC)
Date: Fri, 19 Jul 2024 14:41:45 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20240719144145.6d16eeee@windsurf>
In-Reply-To: <2ea94197-d2f9-4e01-b138-c28e9cab8c13@gmail.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
 <20240717221000.5ced2d0d@windsurf>
 <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
 <20240717235322.5f90b271@windsurf>
 <57bbc792-5d28-4f2d-b33f-f0735c31fbae@gmail.com>
 <20240718220557.189b6f22@windsurf>
 <2ea94197-d2f9-4e01-b138-c28e9cab8c13@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721392906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2ZebvK3iGdAdZpaOIbAPj1A78a98G3MkvWMkdADZck=;
 b=TajVv4VwX8MNUYr3fsmSc01l6D34r7gePTntwcTz2x5tGonv/i1oBDf5eEOiW2NpXILnw2
 4LevE9IstnRniK8pstgNBGKS/PWax7jwk4FcNs2gJ1efwqeTW5hQgpulqhTFF40lGP3rHw
 0YOswr2fBcFWepndcX18xohO+QTcdgGpm2vON7/k4N8YXzWRncpZyWMymAstEkP/ZVhuSn
 0Qi6b9M7zgpNb8LjzqgglsuRmlV+5M29kHky0Chjobvdv5h1vN2pY+wJuseNIo7b0scrtD
 PBteCNsm38I9vo0xW6dz+eZ3JxQAnQFnjGP9LiYLGj5PmsgrYulWsNEJpBnTDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TajVv4Vw
Subject: Re: [Buildroot] Year 2038 time util issue - Build failure in
 2024.02.x
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
Cc: "Karicheri, Murali" <Murali.Karicheri@sandc.com>, "Karicheri, Murali via
 buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jul 2024 19:55:28 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Thanks for taking a look! I can reproduce it consistently from an 
> incremental build. Distribution is Ubuntu 22.04.4. 
> /usr/include/scsi/scsi.h is present and valid, so I am not too sure yet 
> why this happening, I will try to investigate over the weekend.

I don't think /usr/include/scsi/scsi.h matters here, it's really the
scsi/scsi.h in the toolchain sysroot that matters as libsanitizer is
compiled for the target if I'm not mistaken. You're building with
glibc, and glibc definitely installs <scsi/scsi.h>, so I'm a bit
puzzled by your build issue.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
