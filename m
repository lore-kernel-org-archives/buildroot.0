Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0320FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 09:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA9884CD3;
	Tue, 25 Jan 2022 09:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTH22N4z4lYB; Tue, 25 Jan 2022 09:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C798F84CAF;
	Tue, 25 Jan 2022 09:11:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AAA51BF232
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 09:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 963E960E3D
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 09:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgZUnSEGT1C4 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 09:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E09760B5E
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 09:11:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52DE21C0011;
 Tue, 25 Jan 2022 09:11:26 +0000 (UTC)
Date: Tue, 25 Jan 2022 10:11:25 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220125101125.6974b8bf@windsurf>
In-Reply-To: <20220125075817.GA457876@scaer>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
 <20220125075817.GA457876@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 00/16] Bootlin toolchain updates and x86
 updates
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 25 Jan 2022 08:58:17 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Thomas Petazzoni (16):
> >   toolchain/toolchain-external/toolchain-external-bootlin: re-update
> >     OpenRISC toolchains
> >   support/scripts/gen-bootlin-toolchains: add support for new x86-64
> >     toolchains
> >   toolchain/toolchain-external/toolchain-external-bootlin: update with
> >     new x86-64 toolchains
> >   arch/Config.in.x86: drastically simplify the BR2_ARCH definition
> >   arch/Config.in.x86: add "newer" names for several Intel x86 CPU
> >     variants  
> 
> I was wondering if we should expand the prompt to include the fact that
> they are deprecated, or specific to gcc versions before 4.9... But
> whatever I tried was ugly or confusing, so I just left it as-is.

Originally, I was hoping to simply remove them, and add
Config.in.legacy entries for these options, selecting the new ones. But
alas, before gcc 4.9, the "new" names didn't exist.

> Full series applied to master, thanks.

Wow, thanks \o/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
