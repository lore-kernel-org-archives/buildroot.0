Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EC5C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B8A241530;
	Mon,  5 Feb 2024 17:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B8A241530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LzzuSxjZ9f6; Mon,  5 Feb 2024 17:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D771B40A50;
	Mon,  5 Feb 2024 17:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D771B40A50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 311F71BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1BAD417F7
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1BAD417F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Fy-ArjxVHlN for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:10:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EBC7417F6
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EBC7417F6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A243FF808;
 Mon,  5 Feb 2024 17:10:00 +0000 (UTC)
Date: Mon, 5 Feb 2024 18:09:59 +0100
To: Alisa Volk via buildroot <buildroot@buildroot.org>
Message-ID: <20240205180959.5c662ae1@windsurf>
In-Reply-To: <20240115142744.70711-1-aolvolk@salutedevices.com>
References: <20240115142744.70711-1-aolvolk@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707153000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+ddO84UKUBLecNR4nPFp4kSA4h/qW8ayckdulTL8E0=;
 b=eHK2UpzR4WtHZRfUGNx5yxidWXyhBTWBkJDAftLq5l7iJr7DS1xaL5N1yk1QF+tbF+0dII
 MWJTcUnr84HoFcS7UJfzlbDz4otVeZNlxTwY+kDwJZCDU4dXSo2iWIvKT2OTyhJLVuqmMZ
 HXdS/Brb4VbXnURixBEMFcDYuC/GhTsbt4TwiutDEqbtMrqpvPraHE/AVLJb5tcUMAIdtF
 BeI+bdTHYwefQAcoChGjCCRrgzryVICL2+v6GC2VCAKiegDH4i82yzikx8aHplDbI7WB5T
 Z2Hflv4jPzCKPwh0pR14Hx0XeVFly+dhSThQylX1Q/xaClRMxHFeFDR85SEPNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eHK2UpzR
Subject: Re: [Buildroot] [PATCH] package/ifplugd: add option to override
 sysconfdir
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
Cc: Alisa Volk <aolvolk@salutedevices.com>, ovlevin@salutedevices.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alisa,

On Mon, 15 Jan 2024 17:27:44 +0300
Alisa Volk via buildroot <buildroot@buildroot.org> wrote:

> Add BR2_PACKAGE_IFPLUGD_SYSCONFDIR option to pass custom --sysconfdir argument.
> 
> Ifplugd init script is auto-generated with sysconfdir="etc/" by default.
> As a result path to ifplugd configuration file is hardcoded
> to /etc/ifplugd/ifplugd.conf.

Thanks a lot for your patch! However, looking at it, the --sysconfdir
option has no impact on the path to the ifplugd.conf file. This file is
sourced by the init script before starting ifplugd, as explained in the
ifplugd man page:

FILES
       /etc/ifplugd/ifplugd.conf: this file is sourced by the init
       script /etc/init.d/ifplugd and contains the interface to be
       monitored and the options to be used.

Looking at the code, the only file affected by the --sysconfdir option
is ifplugd.action, and the path to this file can be overridden at
runtime using:

       -r | --run= EXEC
              Specify program to execute when link status changes
              (default: /etc/ifplugd/ifplugd.action)

So, in the end, it looks like your patch is not needed, as the location
of both ifplugd.conf and ifplugd.action is runtime configurable.

BTW, the ifplugd package does not have a Buildroot init script, it
would be nice to add one, if you have some time of course :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
