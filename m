Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1764FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0CFF404C9;
	Sat, 26 Feb 2022 10:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbXDcbuh2KK7; Sat, 26 Feb 2022 10:33:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABD70401A3;
	Sat, 26 Feb 2022 10:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D29AA1BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF924401CC
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jzmMlJzppeDn for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:33:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A42A3401B7
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:33:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7ED3BC0004;
 Sat, 26 Feb 2022 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645871580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+HqvqTWyb9d9eU4zAAjLOCthsif5piPpem01SzAzB6A=;
 b=gNVWv8hGutl1X2pkIFxJrbbIsoxVtVq+8lp9ad++t8q1OzAhQA+6m/sqLbyZqp0ho35a+4
 dsGbho5o4AvcFzYwc1otk0z+pjJdHBMhCA984CXSP03xrkvQE/lE5Mp+PlxBRt4pbEdG7Z
 OdhG8xm0sROUvAYdx+eh1IzWaP2BIFNIkZf6ENP+6WI/TujE9p3Ilv59c8fAPoVatuMMCP
 1qYRMdRWglrUUpiOoVj0dzuFwos9Yoin71dPybO2wcJs9IMsWWLOG3WY9iF2EycYFGB58H
 5ZDlSumieLdoVgbfxSqVOiTgFPiYJXbKDTHJbgR39dM4rIPAHPiOJgLpwYMatw==
Date: Sat, 26 Feb 2022 11:32:59 +0100
To: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Message-ID: <20220226113259.6e11ec54@windsurf>
In-Reply-To: <20220225113400.802049-4-kamel.bouhara@bootlin.com>
References: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
 <20220225113400.802049-4-kamel.bouhara@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] package/libodb: add host variant
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Feb 2022 12:33:59 +0100
Kamel Bouhara via buildroot <buildroot@buildroot.org> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I know this commit is originally from me in a local tree, but it needs
a commit description.

And your Signed-off-by.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
