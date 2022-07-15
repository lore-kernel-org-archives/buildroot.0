Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE24EC43334
	for <buildroot@archiver.kernel.org>; Fri, 15 Jul 2022 13:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DBA960B33;
	Fri, 15 Jul 2022 13:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DBA960B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4ONK2H4rKsQ; Fri, 15 Jul 2022 13:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 615DD60B34;
	Fri, 15 Jul 2022 13:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 615DD60B34
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E8671BF315
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 13:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E60340491
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 13:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E60340491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7r8pR7xxzu9 for <buildroot@lists.busybox.net>;
 Fri, 15 Jul 2022 13:45:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85218408C0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85218408C0
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 13:45:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A0881200003;
 Fri, 15 Jul 2022 13:45:33 +0000 (UTC)
Date: Fri, 15 Jul 2022 15:45:32 +0200
To: Ritvik <ritviktanksalkar@gmail.com>
Message-ID: <20220715154532.02a18e7f@windsurf>
In-Reply-To: <CAJxTgFw=_ztH8CWEC8-Fwy1Q+eUtVV26iqw99+v6YNKBwjE85g@mail.gmail.com>
References: <CAJxTgFw=_ztH8CWEC8-Fwy1Q+eUtVV26iqw99+v6YNKBwjE85g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0git41 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657892733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuO4IRJwoRjtse1G42nrBMzZqbYz86JrY6ISRXyhAzo=;
 b=A1Eai6W3XYR3mekQhmWnS5qR1MlJVsepXtp1Zo8JmZqENdSP3LAuNwioqky8qkPfGxtSSJ
 dR7yuomi9H3JXqabHqJRtO/sCqKErlFSv86vyaDAO12PywBtE3uPVC/QJDLxonYRuyiKiu
 Mdy3sIycABOwdmOTI+ZTyMjY5ARUbGhJV7pg8JZQ3/Nyu5bWhdyFbQG7RzhuViZ8QSzfIP
 tsfIIOKGvGcHHBpPTBbhVNWh3PHl+odymtlkYFPt1An4rFP61vK2tMxrYZNcr/eaN6Nddz
 nsufYW+NHhp7QkjGcLBXFvqjJ7LKzo+tHqW0fKD/hbINy3XQvGeqacQC1RsWlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A1Eai6W3
Subject: Re: [Buildroot] Buildroot failure due to undeclared variable
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

Hello,

On Fri, 15 Jul 2022 18:44:32 +0530
Ritvik <ritviktanksalkar@gmail.com> wrote:

> I have been trying to build the latest version of buildroot (2022.02.3) on
> ubuntu 22.04 (ec2 server), a thing to note would be that I wish to install
> literally every extra package that buildroot offers as part of it's target
> packages, so I checked every box of all packages and libraries of every
> category in the target packages. I also selected the linux kernel as some
> packages needed that as a dependency. My installation is stuck at an error
> apparently related to linux kernel's cobalt xenomai x32 syscalls stating
> that `__COBALT_X32_BASE` is undeclared. I am attaching a screenshot for
> reference. Any help in this regard would be highly appreciated.

Thanks for your report. Since enabling all packages doesn't really make
a lot of sense, and would make reproducing your issue very long, could
you try to provide a small Buildroot configuration that exhibits the
issue?

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
