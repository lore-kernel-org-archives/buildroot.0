Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D04DEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 19:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E96E060AF8;
	Sat,  1 Jul 2023 19:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E96E060AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-BSl-u8jwl2; Sat,  1 Jul 2023 19:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E2E60AE2;
	Sat,  1 Jul 2023 19:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32E2E60AE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 995B81BF2BA
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D43B41711
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D43B41711
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcywp87nHBDF for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 19:55:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED9764150E
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED9764150E
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 19:55:04 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 77679C9FB5
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 19:44:22 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0AA420003;
 Sat,  1 Jul 2023 19:44:16 +0000 (UTC)
Date: Sat, 1 Jul 2023 21:44:15 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230701214415.339f69c0@windsurf>
In-Reply-To: <20230319101420.9440-1-ps.report@gmx.net>
References: <20230319101420.9440-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688240657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOzd7jzM7Tl6wGaSCMzKml4T7f+umaXDyXQpZE/b+6s=;
 b=a9H6ShLpXNukmnSEGImJOQN9PfUvE9rRZ8Gba7FCvP9g12nu6AXnkiHNWd8BdAhW8Nygys
 r78tEP5Unpdem/u28chCO9h7CN3E2XzS1B9ofeY8dNW7+Dk+3SE6l+1uyfenOHUdjTgDiX
 W0jDSTcwqeyY8DSXmcEIiTKunq7O2ztWJtN+G3UoZg+RF6GLzUMBafFlfeF4GwUmEjgNS9
 j8Kf/9LRX51V4IH4+1TYf8zShYbL7TCZD//5CLZ2IJEmWBNSV9n6sgOYbZsWAM/exWgTiw
 9bOQBmCgBZ02OAM7uo8IdFnK4SvjJwra16M3PaKfxrGGKRVLhUR4UfqOVnkHvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a9H6ShLp
Subject: Re: [Buildroot] [PATCH v1 1/2] package/qt6: bump version to 6.4.3
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Mar 2023 11:14:19 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1].
> 
> [1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.3/release-note.md
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt6/qt6.mk                           | 2 +-
>  package/qt6/qt6base/qt6base.hash             | 4 ++--
>  package/qt6/qt6serialbus/qt6serialbus.hash   | 4 ++--
>  package/qt6/qt6serialport/qt6serialport.hash | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
