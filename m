Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38D8C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 07:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1572740207;
	Mon,  7 Feb 2022 07:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSu1Og3KQjb4; Mon,  7 Feb 2022 07:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3894400E5;
	Mon,  7 Feb 2022 07:55:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9914B1BF309
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94076400E5
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dAkOguT8Gzid for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 07:55:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24833400D8
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 07:55:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0BB4E240004;
 Mon,  7 Feb 2022 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644220519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfgbBI1aCyCv44/PT+lxPWE1EYuedVMBkpetSisMDF8=;
 b=f2N3KCtoIAQ5qOltSSyPwvZNcnUvb5Y5uxTPM2sbL3BH1AA+r8DfC/rhjp1smsodfX2Ydu
 gEgFkOB49dYYgdwlMYR6UdRsMLg1nqPTuqXT37PYx/HgG/LRTw/oOdSLPTRnYIyOHeu10C
 BJPyrrFH/C471ZmvtJwfUBV2erPyIcJ6bt/SYrk6ONc4UuKdPf1z+dqjXRSvNKmBIGjNQe
 3WhEIPEnM3w8rNiKhGXLw/tIRtEZoHBevBjzw0GyilJQF05RUyXUHwApTinRGySzztvRY1
 DHs1YdsMrOrAERYf8UotrA0Kdwf3bp6fa66uzG0qMgI5BzJQrdQYtJpb6Kysrg==
Date: Mon, 7 Feb 2022 08:55:17 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220207085517.5c13c097@windsurf>
In-Reply-To: <20220206213657.GA457876@scaer>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
 <20220206200532.2758493-2-giulio.benetti@benettiengineering.com>
 <20220206213657.GA457876@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 01/16] board/aarch64-efi/genimage-efi:
 convert partition-type-uuid to single letter notation
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 6 Feb 2022 22:36:57 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> >  	partition root {
> > -		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> > +		partition-type-uuid = L  
> 
> As we discussed on IRC, this is not the same thing. genimage will extend
> the 'L' shorthand to the full UUID 0fc63daf-8483-4772-8e79-3d69d8477de4,
> which is different.

And? Is that really important?

> So I don't think uaing the shorthands are correct.

Why?

> The UUID assignments are available on Wikipedia:
>     https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
> 
> But the systemd docuemntation has extra UUID definitions:
>     https://man.archlinux.org/man/systemd-gpt-auto-generator.8

Yes, but how useful are they?

Unless these systemd-defined UUID are really relevant, I would prefer
that we use the shortcuts provided by genimage wherever possible, and
only rely on using the full UUID for special cases, such as the
board/sifive/hifive-unleashed/genimage_sdcard.cfg (PATCH 15/16).

This way, it would be pretty clear that we have the "common cases" (boot
partition, rootfs partition) and the "odd/special cases".

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
