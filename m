Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70A9C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BDB0410BA;
	Mon,  6 Nov 2023 22:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BDB0410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgFeRJF5bLaw; Mon,  6 Nov 2023 22:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F404220E;
	Mon,  6 Nov 2023 22:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F404220E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8211BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EEA782896
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EEA782896
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-z3P8JaVxXe for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86F7D824D4
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F7D824D4
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE75060003;
 Mon,  6 Nov 2023 22:26:03 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:16 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232516.28329734@windsurf>
In-Reply-To: <20231105043651.2813029-1-james.hilliard1@gmail.com>
References: <20231105043651.2813029-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQI2+AKq0QcTiq1FUIpl4BDs0kQihEEIFRrbw0zx2Fo=;
 b=EAhU8R0oUcfgbNtJOdaJrBO6Z3Q7h9cPtWM9ZOJM5Q9vpd00M3UUWloBgjQWNFRlLE+Pjx
 rfwgSEWslFVHRx0zNTE+SwbFLUHTKfNauu1SeiPfd6AT2Z1KE+vuDzc+H0L1rEhM5Brq5H
 J/B8UuqS4elTr/BpT9bbiNrRrnGJWddnWZOSynGqt9G2nOvbp82XPcM0JieM38PgnuV6ig
 z4GXOoW/LoDpR0yKvZEzFNmnqQFLGA1lw+9M7qjDHpKWFvL6Nvg5evEReyvtqr1KsUu0FZ
 sHojWqP7OfOEX0ALzyb1OlaeXricv2JiDdhXCMOtzdyYxB6ONFirtSlw3jW1Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EAhU8R0o
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 1.0.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 22:36:51 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-dataproperty/python-dataproperty.hash | 4 ++--
>  package/python-dataproperty/python-dataproperty.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
