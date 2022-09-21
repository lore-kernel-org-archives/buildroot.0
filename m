Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031C0C6FA8E
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 09:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71ABC40CE6;
	Wed, 21 Sep 2022 09:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71ABC40CE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 049eZRTHjc3s; Wed, 21 Sep 2022 09:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E3BD40CE2;
	Wed, 21 Sep 2022 09:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E3BD40CE2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DB001BF5DD
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 09:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD1AC81392
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 09:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1AC81392
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZs87OpE2LLf for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 09:05:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 997CD81300
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 997CD81300
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 09:05:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 944A024000A;
 Wed, 21 Sep 2022 09:05:01 +0000 (UTC)
Date: Wed, 21 Sep 2022 11:05:00 +0200
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20220921110500.5128d0b9@windsurf>
In-Reply-To: <9ce68f90a18642ad96e8010fd87dd15f@AcuMS.aculab.com>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
 <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
 <20220920115459.2aca37f7@windsurf>
 <2ec945e7-22ab-36c9-9ccf-ef022bcfb0ef@mind.be>
 <9ce68f90a18642ad96e8010fd87dd15f@AcuMS.aculab.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663751105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXrEjXlY0JANwlCK5vtC7KWdsbUwosH19KVu1LLyp+0=;
 b=BkCbgLkDalMGP1ina35t5ZocCAmobgJUNASanawUUrD4XvtxWzgiLcKdPKnCYyhX4YW11Y
 HauD581CwFwYs+c7NFgU+2IVLPtfFdqBNiBDzlqqOUC7GQ7QJ0QrojBRWkM068XMo5VaPY
 rQYB5HHOExl8fnVCZTtbIEgEdXcjZJsMmWmTczZ1WPLdVw3LUMFneLlLXMmsQx0H3uF1/V
 ZGW7WDJow2uQRGgEJ9ygQUyhQroXhWMfnsHP3DRu7/L3f+RFahoPvZhMdVOe2coit8Aasw
 FgHEqYg4QDDmZL4w7NseaDI+c9Iou71Ihfu/8KEAFuJd+ZPulGI5VZonCRTGOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BkCbgLkD
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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
Cc: "yann.morin@orange.com" <yann.morin@orange.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 21 Sep 2022 08:23:54 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> Think a bit further and you can remove the exec of cmp, eg:
> 
> $ time find /usr/lib -type f | (ELF="$(printf '\x7f\x45\x4c\x46')"; while read f; do read l <"$f" && [ "${l#$ELF}" != "$l" ] && echo $f; done )| wc -l

Thanks for the input and proposal. Isn't read l <"$f" going to read
each file entirely in memory?

> That takes a few seconds on my system.

On my system, your command took 19 seconds. When doing this kind of
test, make sure to drop the contents of the page cache first by doing:

echo 3 > /proc/sys/vm/drop_caches

Before each experiment. On my machine, with the page cache contents
dropped, it takes 19-20 seconds to run your command the first time.
Subsequent runs only last 12 seconds.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
