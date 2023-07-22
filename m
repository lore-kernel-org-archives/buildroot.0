Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDC9C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B3D78333F;
	Sat, 22 Jul 2023 21:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B3D78333F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 359J96jqjpLJ; Sat, 22 Jul 2023 21:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F94C83547;
	Sat, 22 Jul 2023 21:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F94C83547
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24B2C1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F123B4151B
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F123B4151B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMZlIcbYteWF for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:15:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 829524151A
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829524151A
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAF5CE0003;
 Sat, 22 Jul 2023 21:15:24 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:15:23 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230722231523.3172e93f@windsurf>
In-Reply-To: <20230722161708.402598-1-ju.o@free.fr>
References: <20230722161708.402598-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIF3G0uN4/+55baoBGzvZKiL+8z1nxlOdMEIF/UVFvU=;
 b=ozyW6KrCxjxRNOX2+cd1EhrmxFdsnuFFM55sRD78tIKoDsrgGFrePzFX8etWJjcgoxrx25
 3GpsIwyAZcAouyRvXWA+7FQFcGyqRvv5cQd3aZIGavpvonpU+dUhDWwP6nArEV8+WwLKNj
 4eo54TkbM04Y42jjuOXKEMiGsXcWR/jFo3niMi5b8ToQvaG8DUqNaQNX1G6ZvXUsjRFLNF
 BpIOnKVveLegwB5CQdMR1Bw5g6KQmq979Afrkll9KE4KhAG+NUf2zIGrVJ5vF6gV+6CXdB
 z8grjyCNSlGvWIzFbTSTirfsulXBlNAU0tOwvoIyszPC0+JKpdN/KzEZqTOosA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ozyW6KrC
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_gnuradio.py: new runtime test
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

On Sat, 22 Jul 2023 18:17:08 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> This test was suggested by Thomas in [1].
> This test fails without the patch proposed in [2].

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
