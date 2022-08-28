Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA3ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 08:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96A5760B70;
	Sun, 28 Aug 2022 08:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96A5760B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpYehTNnQa0D; Sun, 28 Aug 2022 08:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01F9260B06;
	Sun, 28 Aug 2022 08:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01F9260B06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCC731BF330
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 08:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EC2D408D5
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 08:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC2D408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmCidIgIpBgg for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 08:06:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F53408D0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8F53408D0
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 08:06:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3710F240002;
 Sun, 28 Aug 2022 08:06:06 +0000 (UTC)
Date: Sun, 28 Aug 2022 10:06:05 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220828100605.509b1ead@windsurf>
In-Reply-To: <20220827084732.GR37358@scaer>
References: <20220826130843.264607-1-johan.oudinet@gmail.com>
 <20220827084732.GR37358@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661673967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7b36lJ8iXQprERazGty1sZjEAmylAOmLbalbGGIzi0=;
 b=hSJsTIfwwNddKMgrP+lXxKoAHP3NXVxs4iBDGClI8ObNgZ01Qt1LoOBEaEAdvp+kMIy17o
 XSQETxcClKMVR0XOmaKiLFRYjHcFqIfagAHgXM9ja3Ga11BjkgbQODmljYJKZkmxlrP0xk
 o0NFQNqYYAZCId5qKDIDCzqs55icX3zTam436y6MEwS2oS4vlaz9qw1WJK0oZyMq62i7RR
 kVp/NoZXeFUlmzsKfu8rixEwDd8g2VPTB27tef7dHVobDTp4wLqMv+ZXE61bFJ+bwMeq98
 ybJK11K6FtwQvO6Lhxdo+M7h+ThSgZPjA7ekd3tfckGfWN8rXNRpjQn0ArhOyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hSJsTIfw
Subject: Re: [Buildroot] [PATCH v2] package/forge: new package
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 27 Aug 2022 10:47:32 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +FORGE_VERSION = 1.3.1
> > +FORGE_SITE = $(call github,digitalbazaar,forge,v$(FORGE_VERSION))
> > +FORGE_LICENSE = BSD-3-Clause, GPL-2.0
> > +FORGE_LICENSE_FILES = LICENSE
> > +
> > +FORGE_DEPENDENCIES = host-nodejs
> > +
> > +define FORGE_BUILD_CMDS
> > +	cd $(@D) && $(NPM) install && $(NPM) run build  
> 
> So we have to install before we can build? I would have expected the
> other way around... I have (almost) zero experience with npm, so I am
> not sure about the semantics of 'install' vs. 'build'.
> 
> Also, where does 'install' installs things?

And side questions are:

 - Does this $(NPM) install step downloads stuff? If it does, then it's
   wrong, because it works around Buildroot's download infrastructure.

 - Does this $(NPM) install step installs extra stuff? If it does, are
   these extra things accounted for from a legal information
   perspective?

Yeah, I know, annoying questions :-)

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
