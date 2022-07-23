Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6650C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E1561AF0;
	Sat, 23 Jul 2022 17:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35E1561AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHSiZ8z3hzkl; Sat, 23 Jul 2022 17:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B39961AF7;
	Sat, 23 Jul 2022 17:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B39961AF7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC3D11BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E38E60B5B
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E38E60B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xk-adamAYb_E for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:47:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12FF360B59
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12FF360B59
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:47:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EDE5324000B;
 Sat, 23 Jul 2022 17:47:10 +0000 (UTC)
Date: Sat, 23 Jul 2022 19:47:10 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220723194710.2865e29a@windsurf>
In-Reply-To: <20220621213413.2191964-1-angelo@amarulasolutions.com>
References: <20220621213413.2191964-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658598431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/ee6KSqPKLJV/bvRYUUZ/ghdZmTd+ZMUF0arxrHtBs=;
 b=Fgj+NZbrpdPljxLAUxCmai+vYnEIiUeRpSLmFScdtg9MMD1zw94zuXyBxEiELM4V4paQY0
 ayBX7/BfCwXTSpVC/Poxb1AVk8Im0dcf+2mQVsGeyRX+lAxmsJJm2snDOaeS6Q3APJ8t5U
 nMb3TA+4vlAthXmgFYA33GgJ3catb3pJXVWy5sHQ0VOm9hzM2n6B33cLr8lUH80armd8FK
 N8s6pTwx10+Qu4czRin1EIIHXzUpC0a/mg6yk/8ZVX4R+H1LoYzjbfTm1t1uUQqiau6zq7
 BLSLfiFaonXre/y6isqyA+o/eHFJZxNPXNZY5n8xKlILu0QP0oFcfUoXT03S6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fgj+NZbr
Subject: Re: [Buildroot] [PATCH] package/python-pydal: bump version to
 20220609.1
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

On Tue, 21 Jun 2022 23:34:13 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/python-pydal/python-pydal.hash | 2 +-
>  package/python-pydal/python-pydal.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
