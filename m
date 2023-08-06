Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BF1C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DCF760B4E;
	Sun,  6 Aug 2023 21:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DCF760B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leLc5s_uqLWA; Sun,  6 Aug 2023 21:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7967605A6;
	Sun,  6 Aug 2023 21:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7967605A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 970391BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E3F3404C8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E3F3404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaT81erGwa7L for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:10:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34B63401C9
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34B63401C9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 140D8FF803;
 Sun,  6 Aug 2023 21:10:51 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:10:51 +0200
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20230806231051.47144577@windsurf>
In-Reply-To: <20230806225127.02236235@windsurf>
References: <20230802220321.6af766af@windsurf>
 <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
 <20230803001230.284ba84d@windsurf>
 <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
 <20230806225127.02236235@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691356252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OqDQkUoW1B2xqide1gEhu9NI3wrvw779tXxwqRCJm+Q=;
 b=W7//TUafjQjBRyDmzh7zD/ddrsLqfg2lnU3EWERCQ3wYVOCYQ4k6W1d1phJhp6go9KfQUR
 MjXgprojd/n4U1XiHencakGu6YrOdky8uaz29SDDSVoWj11THFw70kkvl7gHKD4oZjHpqG
 NQa4WvEFHg88Fp6I2GiMz3Xe4XyEp5ymwAsKeuPC6hVIe7EgnJoSn2d7EV6m93Me3OsBia
 6/yIGQFy96yPbKm8VW5Pe1mTGofyf4JXCOOYMzf3B9Sj8VbfH+vvnZHoNW/kbHY2AwEbEc
 mGY5l7XpJj3nR8BAq3Wr/QgxaiWv55hN4/FbgUUPVp2kfSR86XcbUa3JBnC1Sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W7//TUaf
Subject: Re: [Buildroot] ARC support in Buildroot
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 ARC Buildroot mailing list <arc-buildroot@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 6 Aug 2023 22:51:27 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Something more important: fix the broken snps_arc700_axs101_defconfig.
> You're normally receiving e-mails about this. If not, let me know,
> because it means there is an issue in the notification machinery.

Speaking of defconfigs, I just merged
configs/snps_arc700_nsim_defconfig from Sergey, but he is apparently no
longer at Synopsys:

<sergeyim@bouncer.synopsys.com> (expanded from
    <Sergey.Matyukevich@synopsys.com>): User is no longer with Synopsys

Should I move this defconfig to the ARC Maintainers entry in the
DEVELOPERS file?

Is someone receiving and looking at the mails received at
<arc-buildroot@synopsys.com> ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
