Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB987C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4407641517;
	Sun, 23 Jul 2023 10:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4407641517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNYKkh90QRJV; Sun, 23 Jul 2023 10:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30DDC41511;
	Sun, 23 Jul 2023 10:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30DDC41511
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 686E01BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CFE041505
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CFE041505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRZ_giv2O2TL for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:29:00 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02338410D5
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02338410D5
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAB3DC0004;
 Sun, 23 Jul 2023 10:28:56 +0000 (UTC)
Date: Sun, 23 Jul 2023 12:28:54 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230723122854.1d40abe3@windsurf>
In-Reply-To: <20230715085058.103311-1-ju.o@free.fr>
References: <20230715085058.103311-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690108137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZZGW1246snSPPkLQRJGUPpStettzq7E6GHBB7BvliA=;
 b=MiUapcFTkgmbIS5/V05Mz6Y3aFb4h5N0mlZ6ylYkqwXazQeXeu64fQc5f8qxubZNnbAu6g
 qOVVk1EiBYWCjd4UxTHOMt60H2lObYEZkyxL/7JptGROSJNbQVHrm/p6xa+ilr5W7cXr+C
 EftiomS4onZCUM3gUxJ/lYNDyIumtKKTor8RrBgDQhAn6to6UI/p73z1YPaE7VDGSRShU3
 SGRbRoCdVdDVQjE8/Jj/DznBSTLN4zXtyazZryb5xxWxVJVIrZEYvjxC/AdEuK7a7IaBN6
 xbrrtXt5vulUT4uIYW08EjP2rcM7Oue1hrk+l8tH7XUuOCuxpTSAwbenQ6ZmFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MiUapcFT
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_lzip.py: new runtime test
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

On Sat, 15 Jul 2023 10:50:58 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_lzip.py | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 support/testing/tests/package/test_lzip.py

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
