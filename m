Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD216C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8792B6112E
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8792B6112E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 643F9606D4;
	Sun, 14 Nov 2021 13:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HixNpxB00ZQt; Sun, 14 Nov 2021 13:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFD0606C8;
	Sun, 14 Nov 2021 13:54:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 426F81BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31DA8606C8
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NThBFadI7K2m for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:54:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 405C06069F
 for <buildroot@uclibc.org>; Sun, 14 Nov 2021 13:54:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5BD181C0007;
 Sun, 14 Nov 2021 13:54:27 +0000 (UTC)
Date: Sun, 14 Nov 2021 14:54:26 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211114145426.14923bdd@windsurf>
In-Reply-To: <pan$5dd7f$70401f45$5083c352$9afab98b@ID-313208.user.individual.net>
References: <20211113170403.2795532-1-bernd.kuhls@t-online.de>
 <20211113180846.2009b6e4__48491.8654475891$1636823353$gmane$org@windsurf>
 <pan$5dd7f$70401f45$5083c352$9afab98b@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/2] package/postgresql: security bump
 version to 13.5
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sat, 13 Nov 2021 19:50:46 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> this patch is the security bump for the master branch:
> http://patchwork.ozlabs.org/project/buildroot/patch/
> 20211113170147.2795149-1-bernd.kuhls@t-online.de/
> 
> I cherry-picked that patch mentioned above to the -next branch which is 
> the patch I am here replying to:
> http://patchwork.ozlabs.org/project/buildroot/patch/
> 20211113170403.2795532-1-bernd.kuhls@t-online.de/
> 
> On top of the security bump for the -next branch I sent the bump to 14.1:
> http://patchwork.ozlabs.org/project/buildroot/patch/
> 20211113170403.2795532-2-bernd.kuhls@t-online.de/
> 
> The two patches for the -next branch should avoid a merge conflict when 
> the -next branch is merged back to the master branch.

Thanks for the additional explanation! I've applied the series for next
to the next branch :)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
