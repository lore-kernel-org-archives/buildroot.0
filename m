Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50657C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B96611C3;
	Fri, 25 Nov 2022 14:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1B96611C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peTSiqDcfAlU; Fri, 25 Nov 2022 14:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C029D611D8;
	Fri, 25 Nov 2022 14:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C029D611D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 352401BF30A
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E1D841D15
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E1D841D15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_9QELGYslSI for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 14:13:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B542D41D14
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B542D41D14
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 14:13:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 81C591BF20F;
 Fri, 25 Nov 2022 14:13:02 +0000 (UTC)
Date: Fri, 25 Nov 2022 15:13:01 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221125151301.3518be13@windsurf>
In-Reply-To: <CH2PR12MB500409BAF4E58B1189BC3184F00E9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221124102144.16833-1-neal.frager@amd.com>
 <20221124221557.4a18a2a9@windsurf>
 <CH2PR12MB5004D69C65B84BEB0241DB7CF00E9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20221125120246.1fed3208@windsurf>
 <9EE282D7-0646-421F-BF16-BD424E508ABE@amd.com>
 <20221125123344.045a4441@windsurf>
 <CH2PR12MB500409BAF4E58B1189BC3184F00E9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669385584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWGuefeEIN/NoZRhGQm7XWj1tZqEclFh7oeoXCzPTh4=;
 b=PV663cSVC+CqS8w5oNUvZcRHBU+1mZXdcm8toBOxId1K8Ys1qD2SIIWzrlznAUkx1MrWo+
 CzOxpEa1OlBTf7CHY+Twkibuhe6QFTh1U1Pkma7mHdyuqvCDuoEV7i4F+/HcyNGRbeDRtK
 4W/5v+/ggZ4fEKv8/+zWjA0adMKWBQzTq4MFrM4sNCaoVSu4qUDb4Q3lO/6jMN8S1axe/r
 xVsKY6IsiCqRy+I7kUK7epFsUbnDAuOUlhrbQE0yvPfA2i/SGi4WCOazxlzIbaoXK+GdRh
 fnTd1WiD5TZ9OI7h5hxWPynfQfH3XQIYyTWaV0iTwwAurpQs4ma6eMCKbIgOXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PV663cSV
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

On Fri, 25 Nov 2022 13:18:38 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> This is a good idea!  It seems adding a microblaze compiler should be
> easier than I thought.
> 
> I am not aware of any pre-built microblaze compiler that we could
> just download, but perhaps using a package, we could download and
> build a microblaze gcc compiler from sources?

This is much more difficult, we really don't have the infrastructure to
do that in Buildroot right now. It requires building another binutils
and another gcc than the target gcc, and Buildroot is clearly not
prepared/designed for this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
