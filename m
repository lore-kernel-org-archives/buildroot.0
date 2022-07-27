Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E993C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D89A3405FA;
	Wed, 27 Jul 2022 15:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D89A3405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMQXPLyEtiuF; Wed, 27 Jul 2022 15:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDF594013D;
	Wed, 27 Jul 2022 15:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDF594013D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A26AE1BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C3E58141F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C3E58141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VzeXvQLSia7P for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:04:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FFA2812E4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FFA2812E4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:04:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8F6DA60002;
 Wed, 27 Jul 2022 15:04:16 +0000 (UTC)
Date: Wed, 27 Jul 2022 17:04:15 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220727170415.570726bd@windsurf>
In-Reply-To: <cover.1658919469.git.yann.morin.1998@free.fr>
References: <cover.1658919469.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658934257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oae1mLSRHmKGaIzMG16W7Eg0jeny03KjU+2e2KOgtCo=;
 b=k3yHu8004r1maqO7ZHBcx9IQ9jnWA4gnSLwWLToX/+z9iriGVTbNvlIEejLNIbtvPCA3wO
 WBwPBdnErGkmilECH/e8qJorlyZKbycHug6JUVyUOMvAqJE1pKu94XVqPSg9Ho+/xYNk5k
 NQfWktem+fgtUgONL9NMclaU1XHgN6lL/uQ7Z3I9Bi4xdfIUIBdf/ERGZostPZZaB4d+x9
 6O/sO73mp2wgjHEJ+zft+o9z+kj7s/NpKPE85McX6YTW4iY5meSG61i46J+a/mVdPzT64/
 09OZyXyq1/+tdGSuH9z7CZBtxb+tvw8//LEntN7j3Q3UvFOqkG6l8hyQGjNNLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k3yHu800
Subject: Re: [Buildroot] [PATCH 0/5] arch/cskey: remove (branch
 csky-in-the-sky)
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
Cc: Guo Ren <ren_guo@c-sky.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 27 Jul 2022 12:58:05 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> This series removes support for the csky architecture in Buildroot.
> 
> We haven't had a toolchain for csky for a long time, so it means csky
> is, for all practical concerns, unbuildable:
> 
>   - support for the internal toolchain was dropped in 2021-10-17 with
>     commit 547d681b45ed (package/gcc: remove csky version);
> 
>   - we have no external, pre-built toolchain for csky.
> 
> So, drop the support for csky altogether.

It took me a while to find the small joke that you always include when
dropping the support for an architecture, but I found it! I won't
disclose what it is, to not spoil others :-)

I applied, with the following changes:

- On patch 3/5, I removed the gdb patch that was specific to the C-SKY
  special version

- On patch 4/5, I fixed the small typo in the commit title.

Thanks for this work!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
