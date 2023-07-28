Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820B0EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 219F8421FC;
	Fri, 28 Jul 2023 20:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219F8421FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFzQ9bHSN8c9; Fri, 28 Jul 2023 20:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E908421F3;
	Fri, 28 Jul 2023 20:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E908421F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FD911BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B7A784563
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B7A784563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cg0mYmeUh5H0 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:27:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D65E84561
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D65E84561
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2398FFF804;
 Fri, 28 Jul 2023 20:27:00 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:27:00 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230728222700.0e9857a6@windsurf>
In-Reply-To: <20230724170109.6853-1-ju.o@free.fr>
References: <20230724170109.6853-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690576026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNDMBAXQXS4fKzT4fl3/Vp7KTyftZJ9xWwonMtlsKZ0=;
 b=mRQeolhZ8YaA5GPLWZ2FItFK1MYmKy7/CNXH9eit2IXmfiHkIfIIgQJDHpHxvo54djllFB
 jX0D16psh66wDVLmBS+BUEjIsABykg2CqTYv6R5i790zcqbsnS+jH1dhK1bkVdUP3bvIrP
 QdbwQe3PV/13KahHoYw8mU3uU5n9hS1xP1J4aL2nZdEUb3IGpeCCw+CZP+gybx07Zl0fVE
 Uc3tmigWK084VhTcjIYiQIQpqD/qWf3yF762+sPdvZxBvfnXc5mem8DIbmfZlmyDz+BLSz
 OZNzGbwh6wAbLp76NZAXvwQkKSEnCgqURbSjD1iJimS26opCEQ3vw8CWiXvlQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mRQeolhZ
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: security bump to
 version 3.14
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

On Mon, 24 Jul 2023 19:01:09 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/esnet/iperf/blob/3.14/RELNOTES.md#iperf-314-2023-07-07
> 
> Fixes CVE-2023-38403:
> https://www.cve.org/CVERecord?id=CVE-2023-38403
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/iperf3/iperf3.hash | 4 ++--
>  package/iperf3/iperf3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
