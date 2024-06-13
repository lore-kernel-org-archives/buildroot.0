Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A2C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 21:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBE38400D8;
	Thu, 13 Jun 2024 21:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEohnt9yzluT; Thu, 13 Jun 2024 21:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 912DF400E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 912DF400E7;
	Thu, 13 Jun 2024 21:29:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F393C1BF340
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 21:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C03610CC
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 21:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaHOFbTwbUxa for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 21:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9A5160626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9A5160626
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9A5160626
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 21:29:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0DC240002
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 21:29:41 +0000 (UTC)
Date: Thu, 13 Jun 2024 23:29:39 +0200
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20240613232939.11bd0f54@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718314181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6Cc4vRhD2n7gr0TcmWMArT4Doib5fydNC7EOa/rP8SE=;
 b=dbMErPIMd4EoyOdWMVq4yI0T7CIm7PpEb7HZzWzqcQod4WTdLR55StlqmxL0Hs3sdHS1p9
 7L4Iocj/LdloqAhc4C7odvdyLCRsi/IFmODJ90SEEOyz9t0DibwVyepn0zTqr57z8Zu40R
 vRvmibvPrKk7lnPPv2wKJ5izyZib89sBCJOB59E7WVr7gBO9ttaHrpRAm0X28sxXpHpc6E
 CFLj5AD1BHf+Q28yvqWo57R+RVlnCVVR0QMwaE3a3knql8YdPONtUeugaCwBpb5t2sGFFh
 Hk7Oph1HsUEH7I9hL5m84LVwW7ofGH29g33C83TUzs7p0n1cotVd+NnPvCC99w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dbMErPIM
Subject: [Buildroot] Next Buildroot Developers meeting: Sep 14-15 in Vienna
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

I'm happy to announce that the next Buildroot Developers Meeting will
take place on September 14/15 in Vienna, right before the Open Source
Summit Europe 2024.

Please see:

  https://elinux.org/Buildroot:DeveloperDaysELCE2024

for some details regarding this hackathon, as well for registration.

We encourage Buildroot contributors to consider attending this
hackathon. It's a super nice way of making progress on Buildroot
development, reducing the backlog of patches, fixing issues, and simply
meeting each other in person.

Three of the maintainers have confirmed their presence to this
hackathon.

The event is free, after registration.

Do not hesitate to contact me if you have any question. We hope to see
several contributors participate to this event!

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
