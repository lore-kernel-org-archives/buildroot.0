Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF62AC43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 07:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 647BC4022C;
	Mon, 18 Jul 2022 07:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 647BC4022C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMlulHhED_iK; Mon, 18 Jul 2022 07:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71E0840142;
	Mon, 18 Jul 2022 07:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71E0840142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4E2E1BF30E
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 07:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53FF60FBB
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 07:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B53FF60FBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-TRJ-qaYoxU for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 07:13:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17ADA60AE5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17ADA60AE5
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 07:13:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3CB3E1BF207;
 Mon, 18 Jul 2022 07:13:50 +0000 (UTC)
Date: Mon, 18 Jul 2022 09:13:50 +0200
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20220718091350.4b968717@windsurf>
In-Reply-To: <IA1PR12MB62105EDFE310AD93A55A33B6A18D9@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20220717200407.1400318-1-thomas.petazzoni@bootlin.com>
 <IA1PR12MB62105EDFE310AD93A55A33B6A18D9@IA1PR12MB6210.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658128431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMDNrp0TbFdP+TVRUzN/B8WO5zIh9kOeDoV9LJBD7F4=;
 b=Z18/SvWz3Nr9vGEydMk6+CiygWTpZlHw33HVRm/deVd3db7PiyP5JlpizHPY5hbDzMopnB
 czF1plcZJViCVvHXmp3eE8A5s+ocWTatJdCD94pJehqIrfMq1sLDR+RW7IhLwhGShYo/RZ
 oBbEMyRGyoduDJ+tpcLIg6M+v4SG0d/erhzY+80PEDIf0n4tQCBptX8qO8KwCOSv7W8t0M
 kNry0jNh+iTXQdYPy/+fn+tvWrU4s36/Id7xZXDBBxRajZC/xQW14u6yxYRgBs7Fd7qwFb
 6qqLTP/PhIKdWgnxY2lhsKEWMrMPUaDV9DW1UfqoRNQI0jZaAuZdgmarCdLcnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z18/SvWz
Subject: Re: [Buildroot] [arc-buildroot] [PATCH] arch: remove support for
 BR2_ARC_PAGE_SIZE_4K
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Buildroot mailing list <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Sun, 17 Jul 2022 21:13:08 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Please let me take a look at this one.
> 
> The point is we do use 4 KiB page for building for the ARCv3 processors,
> see https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot/blob/arc64/arch/Config.in.arc#L133.
> And so far I haven't seen any problems with either uClibc or glibc.
> 
> And since I don't immediately see any changes in Binutils for ARCv3 which touch
> "common-page-size", I'd like to figure out what goes wrong here.
> 
> I'll get back to you soon with some explanation of what we see here.

Thanks for your feedback. Will definitely wait to hear from you before
merging this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
