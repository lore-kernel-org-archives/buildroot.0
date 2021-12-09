Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BA2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 14:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC3F040BFC;
	Thu,  9 Dec 2021 14:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skql83xIN7tG; Thu,  9 Dec 2021 14:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9F2D40BF4;
	Thu,  9 Dec 2021 14:10:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 399F01BF391
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 14:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3555340BF4
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 14:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQpYhsP-XCT1 for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 14:10:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBDC740BF0
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 14:10:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DCD82240002;
 Thu,  9 Dec 2021 14:10:54 +0000 (UTC)
Date: Thu, 9 Dec 2021 15:10:54 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andrey Nechypurenko <andreynech@gmail.com>
Message-ID: <20211209151054.3799fb4e@windsurf>
In-Reply-To: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
References: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Building packages for Cortex M4
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
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andrey,

On Wed, 8 Dec 2021 17:46:58 +0100
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> I am currently playing with Avenger96 Board which is powered by
> ST32MP157 with A7 and M4 cores. Part of my system is the firmware for
> the M4 microcontroller which should be compiled with a corresponding
> variant of gcc (not the one used to compile the rest of the system)
> and placed in /lib/firmware in the rootfs/image.
> 
> I am wondering if this kind of scenario (two different
> cross-compilers) is supported by Buildroot and if yes, is there any
> documentation on how to do it? If there is no "standard" way to
> achieve this, I would appreciate any recommendations.

Yes, it is possible by installing a separate bare-metal compiler using
an additional host package in Buildroot.

You can see https://github.com/bootlin/buildroot-external-st is able to
build the M4 examples from ST. Note that this BR2_EXTERNAL works with a
few patches on Buildroot itself, available at
https://github.com/bootlin/buildroot/commits/st/2021.02. One of the
change is precisely on the bare metal toolchain package.

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
