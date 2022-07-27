Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE895C19F28
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86E0682503;
	Wed, 27 Jul 2022 13:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86E0682503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6D80_iRQYqO; Wed, 27 Jul 2022 13:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7910824A4;
	Wed, 27 Jul 2022 13:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7910824A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66CBD1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37AEC40573
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37AEC40573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lK7rFwoIc4fs for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:57:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFFD7403FB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFFD7403FB
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:57:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B23181BF216;
 Wed, 27 Jul 2022 13:57:43 +0000 (UTC)
Date: Wed, 27 Jul 2022 15:57:42 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220727155742.492bcb84@windsurf>
In-Reply-To: <20220115143344.12319-2-romain.naour@gmail.com>
References: <20220115143344.12319-1-romain.naour@gmail.com>
 <20220115143344.12319-2-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658930264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tloA7d40oNIbnAky6Dmroum1R8OEMq1PMP6O3iXsINA=;
 b=HGuwm+arFqkWPC9qh7bSh+oLqAsZe6zXXaypfrh6/S9bMl6/hP/2CtOdQFq8AzdtjwKqyM
 GyYzalqoKgj7NZqwlvD/8r75lC5MoRPwb1uULAgzd8Z8xg/9cpMoaHA1a+Le9MfVui6795
 62G2ldULEDwKSJ40gpYHbcGbUi1wQQrC/iEtPg4/2EGlGiPsDyV0Pss7ki0rGBXqsQwHN+
 gkm9T6A6HeCaTXksmj9z/7PRekT/C6deQ9mCSgXSs3J3bxCR50pufWIYDxQOY6krZWqFPt
 hjB2RcOiCV8ScIAa1bZEH+6Y8R1Hztq0vzw3pAjb6flckXRy3DwkPte9Q+kWgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HGuwm+ar
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/boot-qemu-image.py:
 increase the timeout by 10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Jan 2022 15:33:44 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> As for the Buildroot testsuite, multiply every emulator timeout by 10
> to avoid sporadic failures in elastic runners.
> 
> qemu_arm_vexpress_tz_defconfig tested locally with sucess.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084046
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/scripts/boot-qemu-image.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
