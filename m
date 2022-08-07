Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8682C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 17:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C6F04056F;
	Sun,  7 Aug 2022 17:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C6F04056F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c25iYooPvLmx; Sun,  7 Aug 2022 17:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59F5940550;
	Sun,  7 Aug 2022 17:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59F5940550
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A56051BF3D6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7152260B2B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7152260B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldg-_tf8LJ3d for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 17:32:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61D3F60B26
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61D3F60B26
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 17:32:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 98572240006;
 Sun,  7 Aug 2022 17:32:39 +0000 (UTC)
Date: Sun, 7 Aug 2022 19:32:38 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220807193238.50297112@windsurf>
In-Reply-To: <20220807165538.850640-2-ju.o@free.fr>
References: <20220807165538.850640-1-ju.o@free.fr>
 <20220807165538.850640-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659893559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=067aASeC1pVcRDXgeSMaRdXUHaH0u0Ux+OjgleEOX4E=;
 b=dKDRxdm2uRsrm3uqSSKGZriOTl2zdw2IboHmLf6XVvJaZjYbew353z15y3mwuakDOwoVar
 mGHwRkeYh9HhPMx3Dmi1k4kHZUkPAryof0jeF9brQ12wfcbtceRtn8s5f/Wqj9jj6tCKR5
 orTOhuJInUWvyhswkZwX7iNrKT0ORVXZh66YMwDSfqR0CWeQhpvuAhtBeEknm+hYZRtSIh
 zbn47jZZf4eWdxe2q10utGJ893iB+v5aJcY4+5Xjlk0yfj+nJOTXgEbNIpWg8L1s0Jz+ev
 cTmVUiUwxG93eHfb0cO3I/g8y3bfOmSEoVSPlo/hVpUDEkKc2uo2QQMuHoG8Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dKDRxdm2
Subject: Re: [Buildroot] [PATCH 2/2] package/octave: bump to version 7.2.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Aug 2022 18:55:38 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 7.1.0, see:
> - https://octave.org/news/release/2022/07/28/octave-7.2.0-released.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Commit tested with:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
