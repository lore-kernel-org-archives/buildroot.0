Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A32C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 13:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6474883DB7;
	Fri, 12 Aug 2022 13:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6474883DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccfLkm8kMLN8; Fri, 12 Aug 2022 13:52:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910FE83459;
	Fri, 12 Aug 2022 13:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 910FE83459
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10BA91BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C62906115D
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C62906115D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fJAzD26XFIM for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 13:52:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BBF56115C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BBF56115C
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 13:52:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BF7AB1BF205;
 Fri, 12 Aug 2022 13:52:34 +0000 (UTC)
Date: Fri, 12 Aug 2022 15:52:33 +0200
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20220812155233.132edc8b@windsurf>
In-Reply-To: <20220808215900.0fc19e1b@tuxfamily.org>
References: <20220806224338.0159e15c@windsurf>
 <20220808101452.566fd732@tuxfamily.org>
 <20220808102653.5a7a0584@windsurf>
 <20220808215900.0fc19e1b@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660312356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ueVdGUN4cWTpa4NcwIIxNo/LTZR8QEzvwsv1b19Rfjg=;
 b=MHDDb0ZrSbu2X9mF8xQ8JGzKniz5gtUfavYAZ4gRbi/bShzt1F15qhubhEo4gDpCndMZBT
 JvLeLW712dHSlFpVEdgOcc17KZxDrdzfVRj+WzQVi0XU7EQW75W+WaSD2C0MTNJ/FbNHeM
 SwblGu0cD8CJBZHQts+J6zQZoZk9nJar4pQbh2oJ38QHHaK/SJBjZHNxYZQlFYwnnatAwI
 voYw2env8l/WoxwZDbaj1bCUqtnLQgL6yK3ScDzcMnkrXxhtPnAgq3msTSLICjYIYQ3AJH
 xPuQSQOPnDB0pbASXEqKLNGERtbmR+JTRnQv9JRtEJPafRyzLIsYR+pg+gVVEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MHDDb0Zr
Subject: Re: [Buildroot] Buildroot defconfigs about to be removed
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 "Yann E. MORIN\"  <yann.morin.1998@free.fr>"@osuosl.org,
 Suniel Mahesh <sunil@amarulasolutions.com>, Davide Viti <zinosat@gmail.com>,
 Mike Harmony <mike.harmony@snapav.com>, Peter Seiderer <ps.report@gmx.net>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Heiko Thiery <heiko.thiery@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, 8 Aug 2022 21:59:00 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> Thanks for the pointers! I had a look at the source for a while, and from
> what I can see, I came to the same conclusion that the modifications for
> ARM should really not have been done for m68k / binutils 2.32.
> 
> I can get the mcf5208 board back working by applying a patch like this on
> top of the current state in buildroot (fixes both, the segfault and the
> section overlapping):

FYI, a patch was posted and merged:

  https://git.buildroot.org/buildroot/commit/?id=95402089c314fbc03b934f5fcf9c29db043d758c
  https://git.buildroot.org/buildroot/commit/?id=9dd179d43ffe9be98035f921a0db2bf051b632fb

Don't hesitate to give a test on your side!

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
