Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE10C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0532F408A5;
	Mon,  5 Feb 2024 15:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0532F408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwkAtfmTRqfL; Mon,  5 Feb 2024 15:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CAC41737;
	Mon,  5 Feb 2024 15:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39CAC41737
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5DC1BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1AA40089
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1AA40089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QANBPCNkTWR0 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:38:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA70D4151F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA70D4151F
Received: by mail.gandi.net (Postfix) with ESMTPSA id D134120005;
 Mon,  5 Feb 2024 15:38:34 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:38:34 +0100
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240205163834.4f365ce7@windsurf>
In-Reply-To: <20240115223952.2532111-1-petr.vorel@gmail.com>
References: <20240115223952.2532111-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707147515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZEFlkUF6dEzrPnwOHfHL2AH4tagoJOt+iyXf4Fa2yA=;
 b=HyVd6SxeFnpOqqQr/O5dD/1RTTASV9urYbYTU/hsQgozE6NMO5kId7JEKEsMIt4syo18bl
 25yV7pdWdsBjPfQq50F1U7a6QGtwIuq3XOmM0QJlAND1k8ghWi3Mh1+gn1TxtuHcWcvX2b
 1ddo9V6KG2hjF25Je+pQqitvhxU2sGW/2u7LosbtFJa12yo/CMOJmYjYM3dkqEA9Yb3sek
 c6VDK63fZNYdm+cja43Pov4uqkmRZ+wVXY4Ktmw4Ufpte+29COKp0TZbRYGVsMq1ahDzkK
 x0Ca45tuWjRh2IJvJwqfGcLeN1A35F0GeZgciSeuylTUXpqkKUW//oWlbSGLKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HyVd6Sxe
Subject: Re: [Buildroot] [PATCH 1/1] package/libqrtr-glib: bump version to
 1.2.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Jan 2024 23:39:52 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Project switched to meson.
> Use gitlab.freedesktop.org for download (previous URL did not work for
> meson), thus moving to tar.gz archive.
> 
> Disable gtkdocize (not only to follow Buildroot approach, but also to avoid
> build failure: ERROR: Program 'gtkdoc-scan' not found or not executable).
> 
> License file got renamed:
> https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/commit/974e4231eaf4a3bf087c1df54e77df8cac935e15
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,

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
