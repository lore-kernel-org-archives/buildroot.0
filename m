Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E62C001DB
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7224040598;
	Sat, 12 Aug 2023 20:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7224040598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROrAnBz55AaK; Sat, 12 Aug 2023 20:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98F7040577;
	Sat, 12 Aug 2023 20:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F7040577
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D90A91BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1C78415CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1C78415CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INVKlJO04Jnz for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:00:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5668741554
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5668741554
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ED5E60002;
 Sat, 12 Aug 2023 20:00:23 +0000 (UTC)
Date: Sat, 12 Aug 2023 22:00:22 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20230812220022.4a43443d@windsurf>
In-Reply-To: <2696013.mvXUDI8C0e@kilian-aisec>
References: <20230811162546.8088-1-robertoxmed@gmail.com>
 <10318288.nUPlyArG6x@kilian-aisec>
 <bf3eb1b7-2bee-4cbe-bc43-49660535c94c@gmail.com>
 <2696013.mvXUDI8C0e@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691870423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGwZw6tbHWbt1gQANoKJ46dgeNJfwMa3wBP8PoLuRKI=;
 b=XrYyO422ylqud7BVQ0L/BWbdSZU3JrcNSXQTMKAvRBvFoOe4ED3bhuXnC2MBRoxQhm0FoF
 073MmH7jqYU6Xv5sGCcg4UZbYjtqmxqyEPhFzcAGdhsB7m7lrMiyZjUmo9MYycqBb+CiKk
 wEvYJYu3QwA15X6+dHWFG5GE2Vudin/B/sm9iF1SP+FnPR1JDBvDPIjabF82JWHtc5ygv5
 LVnbFTVxaA8ocugCdr4Q9RHwsf3Jer27+wr7HHiemWyKo2oVflDLzvLi3GQrK7todxBL06
 +Qw/pZqiTHlyDP93cWKeBw7Hw7z/cfFYK2hNh8eg1H3jKdz/6h1RaiNe1RMZpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XrYyO422
Subject: Re: [Buildroot] [PATCH 1/1 v3] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Aug 2023 23:59:11 +0200
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> > Actually in v2 of this patch, Thomas requested to set a fixed version
> > for U-Boot (mail from 08/08). Which made sense to me as TFA and Linux
> > have a fixed version as well.  
> 
> Ah, I see, makes sense ... then never mind my comment :)

Correct, our convention in defconfigs is that the version of the Linux
kernel and bootloader/firmware should be fixed. Indeed, we want the
defconfigs to be known working configurations, that have been tested on
hardware. If we let them the default/latest Linux/U-Boot version, it
means this version gets auto-updated, without the defconfig maintainer
necessarily checking that it is still works OK on HW.

So: policy is to use fixed version for Linux kernel and bootloaders in
defconfigs.

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
