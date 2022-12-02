Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25111C4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 22:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADE5360E52;
	Fri,  2 Dec 2022 22:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADE5360E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTv7o9oi20bx; Fri,  2 Dec 2022 22:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0179F60C1A;
	Fri,  2 Dec 2022 22:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0179F60C1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3CA41BF332
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 22:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D485419CA
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 22:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D485419CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjQuOCvJ9yTK for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 22:16:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6BB1419C7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6BB1419C7
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 22:16:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E7AB20002
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 22:16:25 +0000 (UTC)
Date: Fri, 2 Dec 2022 23:16:24 +0100
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20221202231624.3688a1cd@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670019385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n2lhSW/lrvrd9syPivaCJJeKP84qUYObpqA59U0JNIE=;
 b=o6AcXGdEhefXXmVNIK7m02jiULVq5xVYWpOd5zUPjbcsDirwQ6sjqoQchGYzf5knLzNNg8
 cZUM0d1mOvNMd5P/xoUzKjTRkN5scRxeJjkXVc3boZLIIW4+gP5DQNy3MA8Bdf0KDbjhoj
 e6dz5nzV/njSptx83nfFCACi2yhMoMdgyH1Nd+kPHPdVYvvGQJNxpCp8eDKDb2l/zfa3me
 NBaiZclVNw7HNtAJW29ViGUR9R+Rq/kdD1QgIQWVz78Mvg4c/KTukGCFE9SZJTwkXZzbHH
 erNz16G4WTp+PiLGaUuW8L+zERryyWJMXIy1tEAjWMm3neYSSw/R5eaICPciKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o6AcXGdE
Subject: [Buildroot] Buildroot Developer Days at FOSDEM 2023 in Brussels
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

FOSDEM is back as an on-site event in February 2023, and so is the
traditional Buildroot Developer Days right after FOSDEM.

We're inviting all Buildroot contributors/developers interested to
participate to this 3-day event to meet with the rest of the Buildroot
community and work together to improve Buildroot.

See more details at:

  https://elinux.org/Buildroot:DeveloperDaysFOSDEM2023

The event is free. Attending all 3 days is not required. If you want to
attend just 1 day to get a feeling of what the meeting looks like,
that's totally fine.

Registration is directly on the Wiki page. If you don't have an
eLinux.org Wiki account and don't want to create one, you can either
reply to this e-mail or contact me.

The exact location of the meeting in Brussels is not yet defined. We
are working with one possible host company (not confirmed yet), but if
you have some connections with companies in Brussels who would agree to
host the event, let us know!

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
