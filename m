Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D35EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD7936103F;
	Thu,  3 Nov 2022 22:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD7936103F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sak-19YHD4bC; Thu,  3 Nov 2022 22:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14AC26102E;
	Thu,  3 Nov 2022 22:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14AC26102E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EEE51BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3422240362
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3422240362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fnz4fMun7MwJ for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:00:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C19744034F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C19744034F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:00:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 733A9FF808;
 Thu,  3 Nov 2022 22:00:31 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:00:30 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221103230030.5b78b481@windsurf>
In-Reply-To: <CADvTj4q=9OB0Qk-E=UhDj3Dp3KCQsB+cJceZpLvJnoYU7B9vqg@mail.gmail.com>
References: <20221103202350.9395-1-james.hilliard1@gmail.com>
 <20221103220710.409e33ea@windsurf>
 <CADvTj4q=9OB0Qk-E=UhDj3Dp3KCQsB+cJceZpLvJnoYU7B9vqg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667512833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tha2OC2KIPNZnhbMmpI0w0s+TNaDoLDf4CzFb27IPuA=;
 b=kycOCQNMrigjMWhfLn2jdfG8oHN2BFgb0hBLJk11JPa+q+Hr4PRcEu1kEc+6e96eLPurJ3
 ILJBErTJGXS4X3LlejXGUKhf/UoaxyouUukkouq23BAuYPAQs7bdj9yIX03KA2pxmvDUgt
 Zr9r4sHBjpyJ3ECS1wny3tCt7urYQgJDI80JfJoZ0zp+q/i7hOTUgQtIIxbQEmqEUINsRJ
 cUZ5W0K1ZGDBRSbqBADczq+shngdjHAMeiiQNnb9wMI2urHsBJL3g0KE8CmLu+1LCxfSqb
 qpwfTYpWqPm3JTHcXCBRrn7+hWH2WW5dKi1xrDqvLpA22xvPcpYoummIb94L8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kycOCQNM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 22.10.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 3 Nov 2022 17:26:33 -0400
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Hm, did you look at the comment above these variables? :-)  
> 
> Yep, tested that this didn't break python-treq build which only has a 22.2.0
> release so far.

Something to note in the commit log? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
