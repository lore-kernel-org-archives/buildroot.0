Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B5CC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E81B8174C;
	Mon, 13 Mar 2023 22:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E81B8174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNBMnW2SvYu8; Mon, 13 Mar 2023 22:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B721D8144D;
	Mon, 13 Mar 2023 22:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B721D8144D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A914B1BF397
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81C126059A
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 22:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81C126059A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dU-JWUibzo5T for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 22:00:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87EBD60592
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87EBD60592
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 22:00:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9846720009;
 Mon, 13 Mar 2023 22:00:12 +0000 (UTC)
Date: Mon, 13 Mar 2023 23:00:11 +0100
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20230313230011.4afd5f15@windsurf>
In-Reply-To: <20230313051823.155236-1-fido_max@inbox.ru>
References: <20230313051823.155236-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678744812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJi3ZI6qgJxGd0Ga6iItYPX4J+hnA8QT5gF2DpeMraA=;
 b=fN/5b48difRnxKWdLcu9fV+lKdXUjiEUclfHjgTrSgSU5qUJQNzrxZ9UyGq041SqToV79I
 NACDGrQTDVrpJLUQZPVCKY6+1uqZ4Q5dOhPuqJnzERiwT0s+/XzUPImZGejpzqQV6sXUvP
 aWIhNdPqqGpFsjZ/ke9Ti7yL69hMfJEGVM+7niajw66b6CiiiqIK7b/aI/0BiW5q9Mayns
 MPL0bGJ9hrQtSSv5mYUFcZvB6WgJ4ETFWai2/RJsMsXh0ePIcCXeoCYL367oX369KO0ldD
 elZD/xRTElMZIn3aS+01l9J9iIdYFOqaVRimz3sQy1n81bfKd7Hh1zL7OfcWvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fN/5b48d
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.8.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Mar 2023 08:18:23 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.8.1
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/osm2pgsql/osm2pgsql.hash | 2 +-
>  package/osm2pgsql/osm2pgsql.mk   | 2 +-
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
