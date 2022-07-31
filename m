Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78836C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 08:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D588682F6F;
	Sun, 31 Jul 2022 08:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D588682F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbJv6yJ6J8zu; Sun, 31 Jul 2022 08:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 610AA82E5F;
	Sun, 31 Jul 2022 08:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610AA82E5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD721BF395
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 08:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 667B240510
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 08:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 667B240510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSoOubbS-U_C for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 08:32:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DB2E403EA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DB2E403EA
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 08:32:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0148B20003;
 Sun, 31 Jul 2022 08:32:39 +0000 (UTC)
Date: Sun, 31 Jul 2022 10:32:38 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220731103238.36ae5e7f@windsurf>
In-Reply-To: <ed4ed152-a334-d21f-23ff-b141e8f25422@benettiengineering.com>
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-5-x-shi@ti.com>
 <ed4ed152-a334-d21f-23ff-b141e8f25422@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659256360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B64iQojRttThtGfv9oIcO4WjswilMiUx1oeMmdxsa+g=;
 b=ijqa8PonpEnolChsyfnOejPK80SokxH6O4/OLBcxnV9SC5RS9VxE+Qn4JGtp3kaRWi3XP7
 ZFbp74cg7xveA7DvdzoCpoBnFaKiZuKmrl5bTdITENM1LWBO/Oag6iFbs9W3I9zOjAMsWr
 QGde0vpdrMtIFQk3Tl+thK3zaKnNH66oxwxfwv48LFTXpUr3Atd6iCjwT24l7lhhXo9Rn4
 dtLepkI+w3qO1aMuI81dHAqEp9tNF4utRh4ueJkVrRBlM0eDSoJ1t8wlKcIAsjzvaMbMmU
 9Uj+MfPQrwM7f6BcOLD2V5PX6qmu6wsAD4C7JJOIvuqXzHt1SopAvdedLcRQ0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ijqa8Pon
Subject: Re: [Buildroot] [PATCH v2 4/4] board/ti: add new boards
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
Cc: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <x-shi@ti.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio

On Sun, 31 Jul 2022 03:15:17 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> I don't know the boot-flow of this processor, so you need the SPL and
> then again another SPL and u-boot too?

This was explained in previous iterations of the patch series, and to
some extent in the commit log of PATCH 2/4 (though perhaps not very
clearly).

This SoC is kind of special. It needs a U-Boot that runs on the
Cortex-A cores, built ARM64. But it also needs a firmware running on a
separate Cortex-R5 core, and it turns out that this firmware is also...
U-Boot.

So indeed, we need to build two U-Boots: one for the ARM64 cores, one
for the Cortex-R5 core. The U-Boot for the ARM64 cores is built using
boot/uboot/, like for all platforms. The special U-Boot for Cortex-R5
is built using the boot/ti-k3-r5-loader package.

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
