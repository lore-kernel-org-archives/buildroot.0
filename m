Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27758C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 13:58:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC17C60F24
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 13:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC17C60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5E1E82C7C;
	Sun, 10 Oct 2021 13:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTiDnnqcPhAb; Sun, 10 Oct 2021 13:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1A082C61;
	Sun, 10 Oct 2021 13:58:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4051BF403
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 13:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 383C56073D
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 13:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJAxmzzIYDGy for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 13:58:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CF97606A0
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 13:58:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 67111100002;
 Sun, 10 Oct 2021 13:57:58 +0000 (UTC)
Date: Sun, 10 Oct 2021 15:57:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211010155757.37201b31@windsurf>
In-Reply-To: <20211010084923.GJ2081069@scaer>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
 <20211009191646.1076266-2-thomas.petazzoni@bootlin.com>
 <20211010084923.GJ2081069@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/gdb: append to dependencies in
 conditional
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Oct 2021 10:49:23 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2021-10-09 21:16 +0200, Thomas Petazzoni spake thusly:
> > Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> > conditional is the root of all evil."
> > 
> > Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> > conditional is the root of all evil."
> > 
> > Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> > conditional is the root of all evil."
> > 
> > Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> > conditional is the root of all evil."  
> 
> Forcing the value of <pkg>_DEPENDENCIES inside a conditional is the root
> of all evil.
> 
> > Enough? :-)  
> 
> I guess so, yes! Next time you send a patch that forces the value of
> <pkg>_DEPENDENCIES in a conditional, I'll try not to apply it! ;-)

	 :-)

Thanks for having taken care of the patch!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
