Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492EAC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 08:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C916281365;
	Wed, 28 Dec 2022 08:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C916281365
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9k6NqMirgcZ; Wed, 28 Dec 2022 08:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10928812D6;
	Wed, 28 Dec 2022 08:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10928812D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7CC1BF316
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 08:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAF72408BB
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 08:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF72408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UB6i5Gx6EM3d for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 08:37:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4D040243
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C4D040243
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 08:37:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19E171BF203;
 Wed, 28 Dec 2022 08:37:26 +0000 (UTC)
Date: Wed, 28 Dec 2022 09:37:24 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221228093724.397df80e@windsurf>
In-Reply-To: <20221227215802.GC2498764@scaer>
References: <20221226180353.1897840-1-bernd.kuhls@t-online.de>
 <20221227224354.3b1d1fdf@windsurf> <20221227215802.GC2498764@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672216648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+mqE6yEt8AGjCnDge/jujGLE3JdTo7g2tPmJKJ3kbg=;
 b=cBMteYYR1c7YRjP/3jclVUt5hZUTgOqyNOO/ROhlAu6AJ9SNT5q6D/3D0Oywsu5Q7AVtxZ
 3v6CSR0zAwTLxMuEbyjuQZwvvU7RI6srIcHJkSSL8tngRoDvuMPIsfqtBFV0PQuhTrtS+F
 hiRlZQV237XSAIq5NsxAqwFgCp63hBIdcDroScwHOUkAPXefUVyS+WWTVsjih3vRkCFMy7
 TUUrqPw3WGS7QkUONNLe+7WYr1zJWGdthjh9LaXMHS55VsjSLGMOu51XqrmFVjDbHz3BmT
 XbLyXUEupkHt+OAQ0NQE3i0BjtAmrVQGKLwDwoWqtdlL+jRVL27LsE+bxfNq3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cBMteYYR
Subject: Re: [Buildroot] [PATCH 1/1] package/dvb-firmware: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 27 Dec 2022 22:58:02 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > > +DVB_FIRMWARE_VERSION = 1.4.2
> > > +DVB_FIRMWARE_SITE = $(call github,LibreELEC,dvb-firmware,$(DVB_FIRMWARE_VERSION))
> > > +DVB_FIRMWARE_LICENSE = PROPRIETARY
> > > +DVB_FIRMWARE_REDISTRIBUTE = NO  
> > 
> > This DVB_FIRMWARE_REDISTRIBUTE = NO is not good, as it would actually
> > encourage people to violate the license of those firmware files. Indeed
> > what DVB_FIRMWARE_REDISTRIBUTE = NO says is "to not mention this
> > package in the manifest" and "do not copy the license files".  
> 
> Wrong. _REDISTRIBUTE = NO does not exclude the package from the manifest
> or from copying the license files; it only restricts copying the source
> tarball and the applied patches. The entry in the manifest is still
> added, and the license files are still copied.

Aaah, I didn't remember this. Thanks for the reminder! Then my point is
moot, I suppose (even though the fact that the package was missing
LICENSE_FILES in fact prevented the collection of license files into
legal-info).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
