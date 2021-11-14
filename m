Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2303C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:30:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233C460EB4
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 233C460EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D585F4022B;
	Sun, 14 Nov 2021 13:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kGUgwFR-NHG; Sun, 14 Nov 2021 13:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DC60401F7;
	Sun, 14 Nov 2021 13:30:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D30761BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C33C56069F
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBfOdOXUUy80 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:30:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7F0E60699
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:30:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8249D1BF206;
 Sun, 14 Nov 2021 13:30:15 +0000 (UTC)
Date: Sun, 14 Nov 2021 14:30:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Message-ID: <20211114143013.27c6ff4f@windsurf>
In-Reply-To: <34f46376-70a2-e4b9-9dfa-4475c2bd5ca0@gmail.com>
References: <34f46376-70a2-e4b9-9dfa-4475c2bd5ca0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Speed up the launch of Uboot on Orange Pi Zero
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Sat, 13 Nov 2021 20:50:47 +0300
Sergey Kuzminov <kuzminov.sergey81@gmail.com> wrote:

> Speed up the launch of Uboot on Orange Pi Zero.

Thanks a lot, but this is really project/product specific, I don't
think we want this sort of fine tuning in Buildroot when it requires
keeping some extra configuration/tweaks compared to the base U-Boot
configuration.

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
