Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C4BEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77E7740BC6;
	Fri, 14 Jul 2023 21:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E7740BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5sOPVSDqqrd8; Fri, 14 Jul 2023 21:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B740540BC0;
	Fri, 14 Jul 2023 21:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B740540BC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4021BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E60888226E
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E60888226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id utNlUBlIohaq for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:26:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8015C8224A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8015C8224A
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:26:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B1CF20002;
 Fri, 14 Jul 2023 21:26:26 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:26:25 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230714232625.7a0b9b83@windsurf>
In-Reply-To: <20230714164230.9975-1-ju.o@free.fr>
References: <20230714164230.9975-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689369986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCAXlXYnwnWR2xvxegCRU3R+JDBUtwZwIGe0XXc8ji4=;
 b=Kl8vboQVuInuEnfoN997CmuCPqVqtM+D1jBDCjCh6txx9XNApwtXYxCExoMVSwkN6lpOas
 OwJkwDD/hGAUdYMXcU65xrpXuM0k/094Ch2TfQaPsW14Tq4F6LrMkuGvnrrB+srKx8Ckje
 3Cx1gHIhtjt92lfgRR/O38wTBmMQHXrTWAoKnO/rfAMaXSc2DcjWr8vH33Devc0byaQRhm
 prQGFbDRgY7lMBCLGh9Pzrfie55uG4fBA8WdlPXAvB+r/splzxCoRx6dvUiUF0zol8Ungv
 sI0Af3WgaHDjf7DKLglIRD1zOP/5qw42TReZ90uzO94//xCZJ7nT00tC4G+zVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kl8vboQV
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_zchunk.py: new runtime test
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

On Fri, 14 Jul 2023 18:42:30 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                   |  1 +
>  support/testing/tests/package/test_zchunk.py | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 support/testing/tests/package/test_zchunk.py

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
