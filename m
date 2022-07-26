Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D87C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04CBA408F6;
	Tue, 26 Jul 2022 20:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04CBA408F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lx5Muz2rTh8X; Tue, 26 Jul 2022 20:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B11E1408F0;
	Tue, 26 Jul 2022 20:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B11E1408F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC6971BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B310560644
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B310560644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myuss9X9EhLM for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:59:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D82060608
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D82060608
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:59:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2345520007;
 Tue, 26 Jul 2022 19:59:47 +0000 (UTC)
Date: Tue, 26 Jul 2022 21:59:46 +0200
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20220726215946.32cdfce9@windsurf>
In-Reply-To: <20220726194129.44446-1-pevik@seznam.cz>
References: <20220726194129.44446-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658865587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LT2rmndYTN1Zjd0/JzX0bcOoAS/a9z793Uqa8MO91Rc=;
 b=DNNM7OOrdr7PxQFwHo66BUZKxsDXEcweN8mfbUzOSE2nuEohEz2tul/PCnIG7/gvdcdc5W
 hlBO1dQC3AS5BKuRhary0UloemkAwVJFjYrAfRhqIvQ5zR5sGmCubGLJgJ1HsZ3qdz6O0p
 GDBmXd5Su9hA5Kn1HPoqDqLRNcOk8TXp0f2kEJ2RuxgGmG/IuoJzTmnzJMmDu/8MYXEMbb
 DKKJsGALM9xcLOyOWjF8yMtTPzIiuG+mAjeYNiadKbecupwLd6zWo5k7ka6ZxJeOd3/lKO
 gSvMnBRtjzgJ5Qkz7Eigws8Bh266kosO82qviHFZXovHwJo8K7ZIQcgcjpU3Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DNNM7OOr
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 5.18.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 21:41:29 +0200
Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Tested with test-pkg.

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
