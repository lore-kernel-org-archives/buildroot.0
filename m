Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0C0C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 21:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4F7E409DB;
	Wed, 27 Jul 2022 21:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4F7E409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZH9FxfDZ27P; Wed, 27 Jul 2022 21:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE38240983;
	Wed, 27 Jul 2022 21:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE38240983
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31F531BF405
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06D8F40355
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D8F40355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjHR1_LI6fQj for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 21:23:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AF340305
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42AF340305
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 21:23:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A0E820004;
 Wed, 27 Jul 2022 21:23:17 +0000 (UTC)
Date: Wed, 27 Jul 2022 23:23:16 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220727232316.24bdd018@windsurf>
In-Reply-To: <20220727154114.1378721-1-sen@phobosdpl.com>
References: <20220727154114.1378721-1-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658956998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezBML0WzIiwYfGd+3tihClwRgysCCOyAG68P4DuIXn8=;
 b=UtaPCXO4Cs8GLEEAz4X4R50n4ofP/UW/n1O1BZAcx0TsltMBSLDuEQshw6ZBjHssbVKWKw
 yDDEEQUMs2hvtIPIHkUXCWoRL8dSY6pZKoSU9XB7gG4Pi3ofoI4hwIUXGsfuPVwsCiNqjp
 VTPO9e95LzOc0QvFLXQs6fc2NhNW841PZLOId1O33jtiU83DbHo1HvGwSAcWrhEUuCJhpz
 qYBNbmfhe38DkBXX1Xe04ByK5zaMlnZpjQxzpO04BYXdarAgs9Z7ZPC49FZB2Y4edThR+n
 pAwBQ9GjlfWjihlLwT29j7HL7Jo0lVYfOqegaMeyAftNDKUuTiEWYi4+vLsPFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UtaPCXO4
Subject: Re: [Buildroot] [PATCH 0/4] support/scripts/pkg-stats: sortGrid()
 and CSS fixes
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

Hello Sen,

On Wed, 27 Jul 2022 10:41:10 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> patch series to fix some perfromance issues as well as some styling with
> pkg-stats.html
> 
> Sen Hastings (4):
>   support/scripts/pkg-stats: fixed CSS cascade
>   support/scripts/pkg-stats: fixed sortGrid() performance
>   support/scripts/pkg-stats: fixed numeral in beginning of CSS class
>   support/scripts/pkg-stats: updated copywright notice

Thanks for the new work. I can confirm that the sorting is much
faster... but it messes up cells.

Before sorting: https://imgur.com/a/uZLV8V8

After clicking on the CVE column: https://imgur.com/a/YrF7NuT

You can see the weird line with versions, you can see that the column
"CVEs ignored" now contain what used to be in the CPE ID column, etc.
It's all messed up :-)

I have applied patches 1, 3 and 4 of your series, but left aside patch
2 as it breaks the sorting. Could you have a look?

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
