Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EB0C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 19:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C24040614;
	Sun, 25 Sep 2022 19:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C24040614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8bnJ2Yt1ciW; Sun, 25 Sep 2022 19:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEA2C405C7;
	Sun, 25 Sep 2022 19:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEA2C405C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 273261BF577
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01E9A81766
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E9A81766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnoXsxAE2n5S for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 19:41:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34CA81749
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D34CA81749
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 19:41:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B190E0002;
 Sun, 25 Sep 2022 19:41:44 +0000 (UTC)
Date: Sun, 25 Sep 2022 21:41:43 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220925214143.05ba673a@windsurf>
In-Reply-To: <20220925160320.80027-1-angelo@amarulasolutions.com>
References: <20220925160320.80027-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664134904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hed+KdAf0bxk1gVGDKi29CjrNFUjKeiTwb587lkmEe4=;
 b=ZekXFsTYsHV5G3a2WBbNEjrc2sbpbycZvcr0t74dlfVs/eLGLeI4lHkWPp0ik1HE9CyNDa
 4EgbejSTEcqOYRrrj/8ftJOg67ymy8uQR/MMSC7J9W1Knf14mMNZZbVlOqx3bBLJcvSd4b
 jgb269tnVRuBqnaTgrAmBtyS9FRgXJuzAIqSGwWLveoqvvwiGIR63R+YW+1oyfB1k48TE/
 78yUaIp0T5yzFJfiPN515VS7NAovMbiq7vpj0JsEBThRWjOElgu2rN7VSYhk4soLuIEdh+
 xGl9kQoFJkj04j7eotTnI/xPClP5cel/v8o/ec6NNkgd5oENW56/DZmaUHbvSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZekXFsTY
Subject: Re: [Buildroot] [PATCH] docs/website: fixing js for the new feed
 source
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Angelo,

On Sun, 25 Sep 2022 18:03:20 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Feed source is moved to a local atom file available on the web server to
> remove further problems with unreliable feed sources.
> Moving the feed required a bit of refactor of the load_activity function
> so it won't download two times te same url.
> 
> This change requires a cron job like this enabled on the website:
> * * * * * wget -O new.atom https://lore.kernel.org/buildroot/new.atom

Thanks a lot for working on this. Based on the cron job like that you
propose, I can see how this can fix the list of last e-mails on the
mailing list, but how can that fix the other box visible on the web
site, which lists the latest commits ?

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
