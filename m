Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F1BC32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 13:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C9540BB3;
	Mon, 26 Sep 2022 13:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C9540BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANplXyoVoh3i; Mon, 26 Sep 2022 13:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7408640BB4;
	Mon, 26 Sep 2022 13:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7408640BB4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 819321BF345
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 13:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B03B60FA4
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 13:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B03B60FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzfPzBhzN_-f for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 13:57:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D732C605A5
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D732C605A5
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 13:57:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 56EA5100006;
 Mon, 26 Sep 2022 13:56:59 +0000 (UTC)
Date: Mon, 26 Sep 2022 15:56:58 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Na Luke <NJLYF2011@hotmail.com>
Message-ID: <20220926155658.3f283176@windsurf>
In-Reply-To: <SJ0PR06MB68164DBA8D22BACEACC3B30ABA529@SJ0PR06MB6816.namprd06.prod.outlook.com>
References: <SJ0PR06MB68164DBA8D22BACEACC3B30ABA529@SJ0PR06MB6816.namprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664200620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wc2gkNg9oR0JvAHPEAtKjohFKlKclDGF+RgLODwshlA=;
 b=IaZcywkRf+fuqOlO42HbIMvV91P1GSNqcWWDUtQGOKeNlQSSqYDxLhxVwi3g78Ns9AFQX5
 3tJtP4RBLPD5upmmshRmfSWxmwUEVpiHp+39S7ztrjUhfAnpwIc2BV5MndbpXHjDrbmnBp
 baaCCu7nBcJz7qRYW7mwOO+qaTV4z9mhUI53NxVszFmx8d65QZXoEhXQyScaex5Uls8/u2
 ax9A6svEu4zyPLf6t4vDqm9au6t0kn5D8AXayscRdqJiy7h1dnofY5QxnrbtYzZ3Ejk5bb
 MNRuCNEUJfUOHjxMIS9QbXsKhDde1NyFSprrzjlfABWhJBABd3rH1BKp+NyMkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IaZcywkR
Subject: Re: [Buildroot] Can you consider add official support for toybox?
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 26 Sep 2022 13:46:25 +0000
Na Luke <NJLYF2011@hotmail.com> wrote:

> Toybox is a toolkit similar to busybox, it provides similar functions
> to busybox, and it is also used on the Android operating system.
> 
> Its license agreement is relatively loose and can be used in some
> occasions where GPL is not applicable, so I think BuildRoot can
> consider adding support for toybox.

We would most likely welcome patches. I think there was a proposal a
long time ago, but it was complete enough. Packaging toybox is not that
simple. Of course, building it is easy. But then like Busybox, it
provides replacements/alternatives to a lot of tools, and we have
special handling in a number of packages for this. Would need to see
how that would work with Toybox.

So, yes, feasible, but not necessarily as trivial to do as it might
initially look like.

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
