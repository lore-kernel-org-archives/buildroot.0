Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD07CC46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 22:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C6EE415E7;
	Wed, 11 Jan 2023 22:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C6EE415E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPuIQtSBs4dl; Wed, 11 Jan 2023 22:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285FE409E6;
	Wed, 11 Jan 2023 22:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 285FE409E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B142F1BF2A3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 22:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76065409E6
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 22:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76065409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38-I973qB2mJ for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 22:03:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 234CE4040B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 234CE4040B
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 22:03:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 517FB40004
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 22:03:30 +0000 (UTC)
Date: Wed, 11 Jan 2023 23:03:29 +0100
To: buildroot@buildroot.org
Message-ID: <20230111230329.5f68a75b@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673474610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nEpeEHrhFON1+pJFKcYnKgmc2SX30jFWpcryWXDdmH8=;
 b=kE9l4a06s5tZsSTBYiblhxACvCB3hHDSoZFpfEwPLzny3UuRkIlgYSPCS8FdC7zkc0VFPr
 q4gUveLO2nYRVWt3D/CcescsHa0PROff9UHLpfEZN58ROzqz0Fp/0gNokzIZMzHKGsnGRm
 oATDb5ebqbH4uJEUOgKJXBKinaFamUTIzmX5QRh12RsmEnwLCnYWT/quk4FIVq5eHHCGqZ
 ew62wTFJmAccB4wSRZBMc0qntxqTcCxFhS7qpnhWZ140dwoE+nBQTHdaYFKt9+B43ifzlp
 h3d2PcG4TuYFvHWvcCWtlTOIFPRa5NpKfbmAOmX12oBs56iebFm2x1DnxUjxLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kE9l4a06
Subject: [Buildroot] General assembly of the Buildroot Association
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

As a president of the Buildroot Association, the legal entity set up in
France that supports the Buildroot project, I would like to announce
that the next General Assembly of the Buildroot Association will take
place on February 6, 2023 at 4 PM UTC+1.

The General Assembly will take place during the Buildroot Developers
Meeting, and therefore the physical meeting will take place at The
Nestwork, Avenue de Broqueville, 12, 1150 Bruxelles. Remote
participation will be possible through video-conferencing.

The agenda for the General Assembly is:

 - Presentation and approval of the moral report for 2022
 - Presentation and approval of the financial report for 2022
 - Election of the Buildroot Association board
 - Discussion on the next actions of the Buildroot Association

Voting rights are granted to people who are members of the association,
with a membership up-to-date for 2023.

We can provide the moral report and financial report ahead of the
General Assembly to anyone who requests them. Please note that due to
the Buildroot Association being legally installed in France, those
documents are in French.

Let us know if you have any question.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
