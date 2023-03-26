Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967FEC74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B0A40999;
	Sun, 26 Mar 2023 20:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12B0A40999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rJ5ixYrlQzQ; Sun, 26 Mar 2023 20:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1239341684;
	Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1239341684
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAF711BF3EC
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68C12400E2
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C12400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DxRgx1pEYVC0 for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 20:01:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F5CA4052F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F5CA4052F
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 20:01:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9154EE0002;
 Sun, 26 Mar 2023 20:01:08 +0000 (UTC)
Date: Sun, 26 Mar 2023 22:01:07 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230326220107.394f4c9a@windsurf>
In-Reply-To: <20230326080034.14629-1-ps.report@gmx.net>
References: <20230326080034.14629-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679860869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZdxDFpKV/MRuDoki81ZHWyl+s5k4IE7oyyklZ1sN28=;
 b=MQxhzNNe0XmnavH3wNO2jdPI/oP6fP2hRj9Bn+rvbKvpDvUBPnxWCaa5qFG1MBf1e0cyG0
 FMhZS331ychbJ9COuWtXNQhb07hi2RttXO9VApSGDZ5jpAiKmkEcBXJ3m1PCM5PlEVjDV/
 U0CIq9ajk8oBEtz6O2D42QuPa//NiQk4XVtueO3NCNHkgZ4BvIqdrsqa2hgirznM1rwhVt
 IUXt5n3GVWOIloyyZ6tLlj8D0FbvOUK1VNX6Vp9L0ZcHLQO1w3RjzsRNv3SGj0CaAqsyJG
 C7QTuueEUTwzfNvw3mDLH9PrQ39OfiJ2RX4p4/5DSb1Slm+6Dj+fjNk5Asa3Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MQxhzNNe
Subject: Re: [Buildroot] [PATCH v1 1/5] package/protozero: fix double space
 in Config.in comment
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 26 Mar 2023 10:00:30 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/protozero/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
