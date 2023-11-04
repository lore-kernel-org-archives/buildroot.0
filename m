Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92472C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28C14400BD;
	Sat,  4 Nov 2023 17:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28C14400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNoMI6uyPs-p; Sat,  4 Nov 2023 17:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D4E4014D;
	Sat,  4 Nov 2023 17:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D4E4014D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8733B1BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6825B4014D
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6825B4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdWjU0aNc7pL for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:37:28 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDDC4400BD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDDC4400BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id F398B20004
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:37:24 +0000 (UTC)
Date: Sat, 4 Nov 2023 18:37:23 +0100
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20231104183723.2bb97efb@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699119445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EB5kOw27eUQjjpX1Zsgvxf6R7cb3Y+73tjiv6dCeWI8=;
 b=JvUVK5kFUxexRPoqgF/pd2ER9ZL3vNFXzmlV1XFSIg+JSJ+0S5eXR0UQkokXxFvJkYQlSH
 2rHy1bvBazsk2QPDzYdnx/cXmFvh0Bp1QXpoCRpdeEEiOBx8tGkymabiGxdQs6p11ufsKh
 R70CXtyh8U+rc7OX3J0zloAGPoTsjC4YnMLoHMBqqbs1kbTULnNpL8gFkdqgKylHa+dPPu
 g215zRyp1qgMSG2UmjPsL7pMQ4KoZyHz4xvk2z++is/qvyRlSk+JVUOpaKLyhUC4ULm09o
 DQ00WNntPezTsRYF2bdtMgwX7mdk6XtGx7kwWJBTc98R+m1ievpgxOdx1U/wvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JvUVK5kF
Subject: [Buildroot] Buildroot Developer Days at FOSDEM 2024: Feb 5-7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

FOSDEM is taking place once again in Brussels, this year on February 3-4.

Right after FOSDEM, we're inviting all Buildroot contributors and/or
developers interested to participate to the Buildroot Developer Days, a
3-day event to meet with the rest of the Buildroot community and work
together to improve Buildroot.

See more details at:

  https://elinux.org/Buildroot:DeveloperDaysFOSDEM2024

The event is free. Attending all 3 days is not required. If you want to
attend just 1 day to get a feeling of what the meeting looks like,
that's totally fine.

Registration is directly on the Wiki page. If you don't have an
eLinux.org Wiki account and don't want to create one, you can either
reply to this e-mail or contact me.

The exact location of the meeting in Brussels is not yet defined. We
are working with one possible host company (not confirmed yet) and will
announce the location when it is confirmed.

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
