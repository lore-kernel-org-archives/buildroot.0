Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38364C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 09:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5AAF41751;
	Tue,  7 Feb 2023 09:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5AAF41751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxfvq_wPB_lD; Tue,  7 Feb 2023 09:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B97C841721;
	Tue,  7 Feb 2023 09:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97C841721
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3691BF2C2
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0078460D4E
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0078460D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sLX5kUtx38el for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 09:04:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E816260B9A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E816260B9A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 09:04:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EDDBD20003;
 Tue,  7 Feb 2023 09:04:23 +0000 (UTC)
Date: Tue, 7 Feb 2023 10:04:22 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230207100422.5fbd4d71@windsurf>
In-Reply-To: <20230207082136.90164-1-dario.binacchi@amarulasolutions.com>
References: <20230207082136.90164-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675760665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKBGB0BSD21dS2Ha5qzq2jvKgSaj1IEq4cm/z5qsEFY=;
 b=LKjtMhNfxhcVJdUT/PQFhNQvTqxm65blcRzYsdVs7cvfRDHk2XEWm0wyZUM/rv5AGADtbL
 NoGyl8lrOWelyUXPVH1kVRm+UwAD26XGKYerxNTnaiZazPP45NVn22hr79L2oetgBbV0Vo
 rqwURImV+8XCZs1Yzl6Cik/bVY6bg/1Zo3JfdpZnTT+MtgMIj0dt7mgXi5bvR5aMQGNZDw
 YSvIyiofYfjQL950RUATZ0Ul9u9KAu/qDwCqr4yLFlkF66QRf0GmzbUeR+eCIvc3M4Q2F6
 bVH/Pmzc8wErEcg5Z8JSkikj5onOgn5XT7XHzNofa75tPynq4vzAY/ZrpsB1fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LKjtMhNf
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/beaglebone: bump Linux
 version to 5.10.162-ti-r56
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
Cc: linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 09:21:36 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The previous version failed to boot from sd card with a log reported by
> the document [1]. In my case it always failed, a 100% failure against
> 75% reported by the document.
> 
> Instead of adding the patch to fix the problem, I preferred to update
> the kernel version.
> 
> Tested on beaglebone black.
> 
> [1] https://forum.beagleboard.org/t/5-10-x-beaglebone-black-fails-to-boot-from-sd-card/33297
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Applied to master, thanks. However, when you send a v2, please always
resend the full series, otherwise it's very confusing for us on the
maintainer side to figure out where are the other patches of the same
series.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
