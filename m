Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C1AC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 19:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71401402A1;
	Sat,  5 Nov 2022 19:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71401402A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVYl7n3sHvBP; Sat,  5 Nov 2022 19:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F10740239;
	Sat,  5 Nov 2022 19:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F10740239
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 843BC1BF403
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 19:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4870E40259
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 19:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4870E40259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIyYz6Jo2IqH for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 19:40:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EA3D4020C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EA3D4020C
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 19:39:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38BB6240009;
 Sat,  5 Nov 2022 19:39:56 +0000 (UTC)
Date: Sat, 5 Nov 2022 20:39:54 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221105203954.70037088@windsurf>
In-Reply-To: <20221105123417.GD3918838@scaer>
References: <trinity-5e5104ec-f62c-4643-b0ac-dfd2df7c6f42-1667640576096@3c-app-mailcom-bs11>
 <20221105123417.GD3918838@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667677196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zGL4xumQeUmdR3+sMV6ctOF1eYUrZ5Jy5Z+bYf05g8=;
 b=LrIXojABxyClUmW+wKfTPS8OO/Cxle6yZxLUh9Vj5CN6iMSIWAL65K6ADEF+f5N3npbxYH
 mW7ynZJDY8FRTBQKth9CrZUqxNwd9oXBzTmhn2zR3WW+vd91KOc5kbSn2x6jH3f8h59cnj
 beUxkEbljlb2i70s0qKMrrwXFsc28En9DoxzLEIdlXN9menxG7QzzC+vh5eFKTm3d6caSG
 GpvbVCuNJrmk2NJK0YBYZ/PHMgZG6LpWLPTPxAk0lje0NAELA5sk5dGNdNvgdp1pMWfzs7
 cRdwstVC8pRplVqbtmbM59qmucgCMd09gnEMAASZ/GuO3WaxGkTZ/rIFpRc6JA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LrIXojAB
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-04
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
Cc: daggs <daggs@gmx.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 5 Nov 2022 13:34:17 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Err... This is simply a case where the disk is full:
> 
>     xzcat /builds/buildroot.org/buildroot/dl/linux/linux-5.7.tar.xz | tar --strip-components=1 -C /builds/buildroot.org/buildroot/output/build/linux-5.7   -xf -
>     tar: drivers/watchdog/ftwdt010_wdt.c: Wrote only 4096 of 5381 bytes
>     tar: drivers/watchdog/gef_wdt.c: Cannot write: No space left on device
>     [...]

Yeah, Docker stores its container volumes in /var/lib/docker, within /
which is quite "small". I need to move it under /home, which has TBs of
storage.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
