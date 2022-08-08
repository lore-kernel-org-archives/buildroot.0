Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC358C25B0C
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 08:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CAFE818D4;
	Mon,  8 Aug 2022 08:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CAFE818D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOwWtB6v4jUy; Mon,  8 Aug 2022 08:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5EB6818CA;
	Mon,  8 Aug 2022 08:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EB6818CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F4C41BF591
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66E18818C9
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66E18818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBA79NG9rqKx for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 08:28:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973AB81886
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 973AB81886
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 08:28:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7766D1BF210;
 Mon,  8 Aug 2022 08:28:06 +0000 (UTC)
Date: Mon, 8 Aug 2022 10:28:05 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220808102805.2ee4fa4c@windsurf>
In-Reply-To: <CAEyMn7ZtrsEdo18p2pjvdhrROnSemX2spZyxN8Tj67RLTcZG-w@mail.gmail.com>
References: <20220806224338.0159e15c@windsurf>
 <CAEyMn7ZtrsEdo18p2pjvdhrROnSemX2spZyxN8Tj67RLTcZG-w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659947290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvtTWWPyqgIBbABkhs+EifGLHrXH9fEQgt+WA2u2Tgg=;
 b=J9iKVvlMSW/+iAonmACx2uAIXiqiZULT1wi0zFlxatVgFYmJvlIlhjW8iWfz69C9xD3BGY
 z2O0Shr4ZV31qY7L8NEVNkO6yH3XHlcD8A57rAk+qu74WHKPzku98SAqI0Ld7yEWTtzLak
 Quj/bpxG4FHtlEgcOeoUZplR4Gs2UM49CHxCeejn2RAwpkqVfea7v74J3GYhOSErpSJbhX
 DQaKT7XiyHaeOl6H3tHeUAWkOTNbOoJPKSx0CyduvJ+u2ixMnsWN4gwXLnJcKCbpv8vxPn
 heX10QjAF7U/C0exZoqathsFTgcAXcaUxMteyJbdGXGk/rOV4/Qdju7ZPXBkvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J9iKVvlM
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
 Thomas Huth <huth@tuxfamily.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Peter Seiderer <ps.report@gmx.net>, Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Sun, 7 Aug 2022 00:28:46 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> This is the first time I have been informed about this build failure.
> I am surprised that I did not get any mail about this.

Sorry, your issue is potentially new. It's mainly the other issues that
I have already reported in the past, and which did not get any
feedback, on defconfigs that are not properly maintained (all those
friendlyarm/bananapi/orangepi boards).

> Nonetheless I will fix that and send a patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
