Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74F3C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 08:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43ED340608;
	Wed,  8 Feb 2023 08:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43ED340608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43kSJO1yJYqG; Wed,  8 Feb 2023 08:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90CF2405FA;
	Wed,  8 Feb 2023 08:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90CF2405FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC48C1BF5EA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B028610BD
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B028610BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjP5ApXnqmCc for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 08:57:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A1861059
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62A1861059
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 08:57:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D6861BF209;
 Wed,  8 Feb 2023 08:57:18 +0000 (UTC)
Date: Wed, 8 Feb 2023 09:57:17 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230208095717.66678de3@windsurf>
In-Reply-To: <20230130174339.36794-2-bernd.kuhls@t-online.de>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-2-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675846639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM2L8Dgm2sikG2mjxlK8PB8eN9D5gv6IiNwgJhhHDbo=;
 b=hXme/WzH7qpvZHBdd4YEaFyparfA2adAW5B2/PJmTnoGyW8YpKKfABcPwRtz3ZbHqi2UvY
 MadqlKOCnFhtXMUQLxUJwJRpS3rCPXluz1Hg8KYEzLh2DgAs7F5PWPaJaPePq44dOh453i
 ZsoFKnZDwt+i6RD+KGLCLkU1ENNqXacbOGGbs1SzP8vji9dELKNoRM3tNb5cqAe6S5M/RF
 0D+frwxuomWhtolSn2vczMQH/1tS+REBCx2PvQIyB+gQlGaXoIt/fH9FwR0HrRWe3dFa/C
 0BJwi0KAzv9wrhmBYU6a5JzZI3sD5KZsCHPjf22EA/AV5UBcWIYXW8F4l386Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hXme/WzH
Subject: Re: [Buildroot] [PATCH 2/5] package/libva: switch to meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Jan 2023 18:43:36 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The time between version 2.17.0 being tagged and the release of its
> tarball version containing autoconf scripts was three weeks now.
> With the switch to meson we can directly use the github-generated
> tarball while not needing to run autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva/libva.hash |  4 +---
>  package/libva/libva.mk   | 19 +++++++++----------
>  2 files changed, 10 insertions(+), 13 deletions(-)

Github has fixed their tarball generation logic so that the hashes are
now correct again, so I've applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
