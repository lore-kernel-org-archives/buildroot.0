Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27C4C001B0
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 21:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2513841ECD;
	Fri, 11 Aug 2023 21:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2513841ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dr8lZcIW4-iT; Fri, 11 Aug 2023 21:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C1C041DE8;
	Fri, 11 Aug 2023 21:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C1C041DE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE4D61BF228
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 21:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B84B040471
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 21:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B84B040471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIbDyRAyj5r4 for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 21:59:14 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F24AE402D4
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 21:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F24AE402D4
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 2B08CA05E9;
 Fri, 11 Aug 2023 23:59:12 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 12FDD8029D;
 Fri, 11 Aug 2023 23:59:12 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id C97CF100136;
 Fri, 11 Aug 2023 23:59:11 +0200 (CEST)
To: buildroot@buildroot.org, Roberto Medina <robertoxmed@gmail.com>
Date: Fri, 11 Aug 2023 23:59:11 +0200
Message-ID: <2696013.mvXUDI8C0e@kilian-aisec>
In-Reply-To: <bf3eb1b7-2bee-4cbe-bc43-49660535c94c@gmail.com>
References: <20230811162546.8088-1-robertoxmed@gmail.com>
 <10318288.nUPlyArG6x@kilian-aisec>
 <bf3eb1b7-2bee-4cbe-bc43-49660535c94c@gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 730
X-purgate-ID: 154282::1691791151-1AFFB7B6-7DCD594A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691791152;
 bh=zvhRNKqhMj3WyvPLpSKr+n6+5258sHxeO8iD7gToJII=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=pXxQbt4V45BjpyqAUVMic1EgkM8SYgxoPkQ53p9oxNmjNdjQL4XvBNxFeoBX2If+M
 PoWwu0pvhMeVMmfaWgfDUXLdFSJ0yyBiM/Ez/B+a8+MR9XROzf2vp0le+qCrp/2MYw
 NZqvsDX5ZqMCx/l/YFNitMCWrvPXpMhLv0modnNPIUx0Yd6GCE90ftfcAuiBx7gK/E
 sLUkvo0Sh30+f3JHoMu3GxJkrkOYZTD920G+icalBRM3rc5Yko4vLV/erOyapngybF
 aawuew/T3Z7hlmOLnuB64e4qkoAL3cq2CWXlXcwre7eBkEx4/vb3LkNUzQPoDiI4te
 Z0Y0BHQvN6p9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=pXxQbt4V
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

[--SNIP--]

> >> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> >> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
> > 
> > I think 2022.04 is actually the current default version of buildroot. So
> > unless you have reason to freeze it to this version on purpose (e.g.,
> > because older and newer versions are known to be not working with this
> > board - which I don't believe is the case) you could simply omit these
> > two lines.
> 
> Actually in v2 of this patch, Thomas requested to set a fixed version
> for U-Boot (mail from 08/08). Which made sense to me as TFA and Linux
> have a fixed version as well.

Ah, I see, makes sense ... then never mind my comment :)

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
