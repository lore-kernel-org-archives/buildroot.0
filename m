Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE88C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538B1409A9;
	Wed, 27 Jul 2022 07:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 538B1409A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxRUWJ4gwDBh; Wed, 27 Jul 2022 07:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 865D2409A6;
	Wed, 27 Jul 2022 07:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 865D2409A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0BB1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39F6C60AA4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39F6C60AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzZitXWOqFJj for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:55:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A62607F4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8A62607F4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:55:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0E585240014;
 Wed, 27 Jul 2022 07:55:06 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:55:05 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220727095505.4b703b60@windsurf>
In-Reply-To: <20220124074853.77797-1-christian@paral.in>
References: <20220124074853.77797-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658908507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNVMZ1BbWckicPl2jPg3vTCbeC4Qr3R5WyY1H1/Q9Fg=;
 b=Hdsr132mqWiAJSQtms96gTzPYW68MZHaX60FW9S+u6xNJnTZUkfHqW1ofYcsd6U2HqXiHl
 17Fsl0vWDtR1PSW7/rKtYv7Q1isTrJ3lQOU/713yZfioTaAvJ7LH8s4Td5KGWZvl3Owfkt
 0zBhneVv02796vtfQZDHua77rR3IcnZGoWj1a5VxZgaOSGCRgITrgnOwZfF+IPc+suXckg
 IAVEefrcNxKJJCwTj5S2BXNsG9nVDS80FBxXABzpcuigH2XbOwweG8vFefdMXWDJyYOdvX
 LD/Mz39inAjJBHEzBUuy118KWthuYhBv2Z32RAo+Em0g6+t8zqUboCZAdYfYXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hdsr132m
Subject: Re: [Buildroot] [PATCH 1/1] package/moby-buildkit: support building
 as host package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Jan 2022 23:48:53 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Users may want to use buildkitd and buildkitctl to build images on the host.
> 
> Adds package host-moby-buildkit and BR2_PACKAGE_HOST_MOBY_BUILDKIT.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in.host                 | 1 +
>  package/moby-buildkit/Config.in.host   | 8 ++++++++
>  package/moby-buildkit/moby-buildkit.mk | 6 ++++++
>  3 files changed, 15 insertions(+)
>  create mode 100644 package/moby-buildkit/Config.in.host

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
