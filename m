Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8FCC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 10:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC0C60C1D;
	Sat, 13 Aug 2022 10:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC0C60C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOZW9lSKG32L; Sat, 13 Aug 2022 10:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 578AE60BEC;
	Sat, 13 Aug 2022 10:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578AE60BEC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C02E91BF3DA
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A7F141695
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A7F141695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jb7KNu81DQuo for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 10:54:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D18C41684
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D18C41684
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 10:54:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 269E01C0004;
 Sat, 13 Aug 2022 10:54:25 +0000 (UTC)
Date: Sat, 13 Aug 2022 12:54:24 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220813125424.6caa746b@windsurf>
In-Reply-To: <20220813093627.369221-1-ju.o@free.fr>
References: <20220813093627.369221-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660388066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLRvZwWCVsS3cMsLo5Wh/JVWKOMn/J9RXEohqPh7EFM=;
 b=Gu/No1g8UZOOf6Kl70HBzR1T+my/Jz7pmGcO69C9HD1BPmickHZZlXcaJ6/Vcbnl32nume
 NsroeTT+5Npv8PMn2iS2T6WrkMZVH6Dihzhi2g6R8+tb2sAGWS7Updvjh3qFurpGi2hjAL
 OvHu9RP1YndImNaGsq4R67tvkXi63zENmSINOQ6QvvtWEzuDr/JxtZPIyzCT9HHdl+gcq5
 g6u7xn4dYWuPk7ecjrcmsRduqyT9nOHOCKTbFxPBZ2EC0RW37MEPjZRh5DoLj6QdFWQOhg
 NOm71gEHyVMDEg3N5+eBm+heRMo5239rX3tpYAHtBidq7omR4D5fNHUtAmlo6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gu/No1g8
Subject: Re: [Buildroot] [PATCH next 1/1] package/linux-backports: bump
 version to 5.15.58
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

Hello Julien,

On Sat, 13 Aug 2022 11:36:27 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This commit also change the minimal supported kernel version from 3.10
> to 4.4. See [1].

Could this be problematic for some of our users? Do we want to keep
support for an older linux-backports release to still support 3.10
kernels?

I can imagine that the people who end up using linux-backports are
probably stuck with an old kernel for some reason, so raising the
minimum kernel version required to use linux-backports is probably
something we should do with a bit of care?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
