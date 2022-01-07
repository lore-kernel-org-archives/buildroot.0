Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6626C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D594813F8;
	Fri,  7 Jan 2022 10:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eemSyMNIxsh; Fri,  7 Jan 2022 10:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A19813FD;
	Fri,  7 Jan 2022 10:17:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4CB1BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28F126FC32
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3OF6HUmmsRb for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:17:32 +0000 (UTC)
X-Greylist: delayed 03:14:40 by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92C3A60A80
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:17:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EBD1820005;
 Fri,  7 Jan 2022 10:17:28 +0000 (UTC)
Date: Fri, 7 Jan 2022 11:17:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220107111727.1d021ffd@windsurf>
In-Reply-To: <0ebbe6b2-2932-862f-52a1-a34ab7d0f11e@smile.fr>
References: <20220107090348.3947187-1-romain.naour@smile.fr>
 <20220107110522.523586ae@windsurf>
 <0ebbe6b2-2932-862f-52a1-a34ab7d0f11e@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv4] package/bat: new package
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
Cc: Romain Naour <romain.naour@gmail.com>,
 David Pierret <david.pierret@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 7 Jan 2022 11:08:21 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > But we don't even pass this variable at build time.. why would it be
> > needed at install time? Due to the fact that "bar" builds stuff during
> > the install step, I understand that we might need extra variable during
> > the installation step, but I would expect to only need variables that
> > are already passed during the build step.  
> 
> It seems we just need to add $$(TARGET_CONFIGURE_OPTS) to _INSTALL_TARGET_CMDS
> 
> http://lists.busybox.net/pipermail/buildroot/2022-January/632613.html

Ah, OK. This indeed we are passing at build time, but not at install
time currently. We can certainly add that at install time too. Though
this "build during install step" thing is a bit annoying...

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
