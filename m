Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63E2C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 17:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E304540104;
	Sat,  3 Dec 2022 17:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E304540104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uiaYVffjBRDn; Sat,  3 Dec 2022 17:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D03D400FE;
	Sat,  3 Dec 2022 17:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D03D400FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 913E61BF32E
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 17:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75C5B605DB
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 17:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75C5B605DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_9nFEugT_1L for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 17:23:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35FF660596
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35FF660596
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 17:23:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E7430240004;
 Sat,  3 Dec 2022 17:23:24 +0000 (UTC)
Date: Sat, 3 Dec 2022 18:23:23 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221203182323.30a07da3@windsurf>
In-Reply-To: <20221203160506.GD3302@scaer>
References: <38529777-79a9-dfb5-ec42-b7c37e617281@gmail.com>
 <20221203155247.428cb5a1@windsurf> <20221203160506.GD3302@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670088205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UH4ai0bCZRSisiTbsp7MjtbIIFWxb5GPBwmlcCrKdWk=;
 b=AUfWAuJJR5AAzk5x6jpA9NeAf41qJOjdECqgS5cv+iopjXTvX/LKJBxySO0bEUtetY+Tgy
 EcHS6QIacuWwUZr290Pu7p1xGhXfR3EyJkAzwtAqSkGBC63BBLlX/cG503x7fzoEfryfVh
 QmwRKUDCc3Y6LEMdA8E2/CLVSHuEY+WxGn2bspmSI9aQwfLRcz6RWb6IgmUosGEkym6ypZ
 fCfAhSJ8O+Ujdvlg3VWrIgTgrYCfe3ZeEVejpM8ppmKRwyyjcokiO8nJfUah6o/wJ2EQLX
 NJi5trWZtGouXc9pjJ+XeRwPYWSi4n33wOCtE5iVCMRzu2/31CdpN7kWM3t32g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AUfWAuJJ
Subject: Re: [Buildroot] <PACKAGE>_SOURCE with <PACKAGE>_SITE_METHOD = git
 can result to tar.gz with mismatched file extension
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Buildroot Mailman <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 3 Dec 2022 17:05:06 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Yann, thoughts? (1) seems easier to me, I don't know if the benefits of
> > (2) are really relevant.  
> 
> I think the only meaningful solution is to go for (1): detect and abort.
> I too do not think letting packages each request a different compression
> would be interesting...
> 
> If we believe that gzip is too slow/big, then we can think about
> switching to another scheme globaly, but that's orthogonal...

Actually, (2) would have an advantage: it would allow to migrate from
one compression to another package per package, instead of requiring a
flag day where we switch all VCS-fetched packages to the new
compression.

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
