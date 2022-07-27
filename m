Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4016BC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E9382A29;
	Wed, 27 Jul 2022 20:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83E9382A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLFlanoTVRs2; Wed, 27 Jul 2022 20:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9770382A0E;
	Wed, 27 Jul 2022 20:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9770382A0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 719521BF39A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D1060E8C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D1060E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7faP5JvCw_Ob for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 20:56:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E10260E62
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E10260E62
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 20:56:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 41C0D60004;
 Wed, 27 Jul 2022 20:56:48 +0000 (UTC)
Date: Wed, 27 Jul 2022 22:56:47 +0200
To: "Danilo Bargen" <mail@dbrgn.ch>
Message-ID: <20220727225647.480ad013@windsurf>
In-Reply-To: <1494d3a9-0b16-45fe-99f4-9b8d0bd28aad@www.fastmail.com>
References: <20220117001814.2645cd1b@c3po> <20220727114938.2d337033@windsurf>
 <1494d3a9-0b16-45fe-99f4-9b8d0bd28aad@www.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658955408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVktD0N7Qr/4278DoDv/Q3aDaXomp82m88++HPrrzyI=;
 b=e+SQi6dpDCijwnQVMIyw/mG5iCYgSpw5xCdmeoVRv6r66rJ3J10KeC6V1Uvx49edGUq44F
 +ZaSvGQmQbF5U0IYYLGFzGxrmY/Tu+HSuehGOzkHB8cCojlNkbQ8oFTfbkEqx3IFKscDLR
 7d1mFqOmt202n4F/VaZP6jzVxB0VAeoz1s4BQcToGoVl9qgXcDtEOpZZWpku1zOldJg9TB
 JE38FzI4IE+ktKhLAzH7umVHbEcHYCAGL/Uc1kP8STJ+xFaVgqG7epH7VVVcqG8Pjde4BE
 EbxtO3AW+nFBwkw3DqlrYVUldQm9k0DfEsGBVhxC/lL8t0e/RdkUJMxl0Y5fWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e+SQi6dp
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Danilo,

On Wed, 27 Jul 2022 22:25:06 +0200
"Danilo Bargen" <mail@dbrgn.ch> wrote:

> For a purely embedded headless system, the package is not really
> useful, but on a system where administrators actively log in (e.g. a
> system accessible via SSH, with some administration tools
> preinstalled) it may be useful as a local command-line based
> reference documentation for commonly used tools and commands.
> 
> I looked at the list of existing packages, and it includes packages
> like htop which are primarily used for system administration, so I
> figured tealdeer might be welcome as well.

htop is a tool for system monitoring/performance analysis. You can't
run "htop" on your PC to get the information about your target, while
you can run tldr on your PC to get any tldr page, just like on your
target. So you can't compare htop and tldr.

> On the other hand, if you decide that man pages are excluded from a
> target system, then I'd understand if you'd reject the package.

man pages are removed from the target filesystem in Buildroot,
unconditionally. From the target-finalize target in the main Makefile:

        rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
        rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
        rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc

> One could argue though that tealdeer does not ship any tldr pages
> when installing. All tldr pages are fetched and cached at runtime,
> unlike man pages, where including them for all packages would bloat
> the target image.

It is true that is less heavy than man pages in that regard.

In any case, the patch is applied. I just thought it was useful to
share the discussion/concern we had when discussing whether to merge or
not this new package.

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
