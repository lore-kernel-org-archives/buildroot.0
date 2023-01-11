Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60E1C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 21:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E08B404C8;
	Wed, 11 Jan 2023 21:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E08B404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAK48psfFXrj; Wed, 11 Jan 2023 21:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 715FE4027A;
	Wed, 11 Jan 2023 21:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 715FE4027A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD7D1BF2A3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 21:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15BBE4088B
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 21:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15BBE4088B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbwBFKQ0XsVP for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 21:52:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C82440873
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C82440873
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 21:52:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8FB5AFF803
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 21:51:57 +0000 (UTC)
Date: Wed, 11 Jan 2023 22:51:56 +0100
To: buildroot@buildroot.org
Message-ID: <20230111225156.14dbcd34@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673473917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a0djGnrDN5eIaMwFkYT5+B6JAP935oj6M/dzer4nU5k=;
 b=WfS3BmdMufcrmwn7gyfdi7Q/KmTD1uelWUoRjFhEqbN3EuOrf9jqTd+Ap5nk0iAkq88XnJ
 SHCTONNo29neTBogZ8RGqK1ShdKjPXnMeqoPgszbkMdR1gWBta/bvHbDSqQWdOzyAr1wWq
 8svPfn2ZkBoc0hCuBh+lQcZJ33/UUi7wlbH35cEXMTq2cqLG0++/6b5tI3EGS4XGfzJLG5
 MjPaQfUuqiX1ObmkwOKItcAtLSgSLofUlAkvo2WlT5+IsHOzo69Xg4GwwW29LD1HeRUG0T
 +YAvC3XoG/EY1dqmcJLBZ55wXeqpg3zJGd3Qxe/V/WbXOBF+JhwatrcuKiXzAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WfS3BmdM
Subject: [Buildroot] Buildroot Developers Meeting 2023 at FOSDEM hosted by
 Smile
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

We are happy to announce that the next Buildroot Developers Meeting,
scheduled on Feb 6-8 in Brussels right after FOSDEM is going to be
hosted by Smile (https://www.smile.eu/en).

Thanks to Smile, we have a confirmed location for the meeting, which is
described at https://elinux.org/Buildroot:DeveloperDaysFOSDEM2023. It
will take place at "The Nestwork", which is located very close to the
Montgomery metro station in Brussels.

Thank you very much to Smile for offering to host our Buildroot meeting!

Registration to the meeting is still open for the Buildroot meeting, so
let us know if you're interested.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
