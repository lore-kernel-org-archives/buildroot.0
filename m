Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A624C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD101415B5;
	Thu, 28 Jul 2022 21:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD101415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RvhQVB0LxIam; Thu, 28 Jul 2022 21:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD85415A4;
	Thu, 28 Jul 2022 21:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FD85415A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AA871BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0836960A73
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0836960A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rUfIgPWtpii for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:05:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF31060812
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF31060812
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:05:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6A72A240005;
 Thu, 28 Jul 2022 21:05:04 +0000 (UTC)
Date: Thu, 28 Jul 2022 23:05:03 +0200
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220728230503.5bf0a582@windsurf>
In-Reply-To: <20220728193726.1465662-1-arnout@mind.be>
References: <20220728193726.1465662-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659042305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZziMRxPt4y8IUwzQDUkxCSnx5oA1/GfrBrWIPUJiki4=;
 b=JlDrQCeUCfXyb2cBq1BvJv7YxhubXUCdzDEsU2+1UsbbVoodm3R/yXVAS1CxOKg+y7yK0U
 AClL8byd5STU4j8gcwmLOGSCcYy0mmzWJLYWZ/eEQrlmfxupuLnDm3A8X5Igpsfs7PIEH9
 wQR6bcKSz3FC/CNdi7wSpiNB7wufKLepCitLvpBM8uf/HR8fqal0locKE79UnpvZpuw2vs
 t87QaceuygPy8puJj5PPDwHw9o5rlHIoSYzpaZdk4rwfn0IZ9iTOOevfRl2TnHHpWMv6Jd
 Xl27qFUXTOQFJdgy5ek9Ni+kPfK3G6OuDdtLjMRsRKJst44UVsQyallNfI2AZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JlDrQCeU
Subject: Re: [Buildroot] [PATCH 1/2] package/eudev: remove
 HOST_EUDEV_SYSCONFDIR
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 21:37:25 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> The HOST_EUDEV_SYSCONFDIR is a leftover from before eudev, when udev was
> still built from systemd sources. Now that we have a separate file for
> eudev and systemd, there's no need any more to have a condition there.
> In addition, its usage in systemd.mk has been removed.
> 
> Remove the HOST_EUDEV_SYSCONFDIR variable and instead use /etc directly
> in eudev.mk.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/eudev/eudev.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
