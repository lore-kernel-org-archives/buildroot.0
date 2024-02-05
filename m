Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5027C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 794DA41A3A;
	Mon,  5 Feb 2024 15:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794DA41A3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOiYPvKSv-Dv; Mon,  5 Feb 2024 15:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B986041776;
	Mon,  5 Feb 2024 15:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B986041776
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C517D1BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73F4781364
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73F4781364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9mmi8GnEIJu for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:38:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C2568135F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2568135F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DF05FF804;
 Mon,  5 Feb 2024 15:38:46 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:38:45 +0100
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240205163845.74b6cd72@windsurf>
In-Reply-To: <20240115214809.2352232-1-petr.vorel@gmail.com>
References: <20240115214809.2352232-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707147526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=reU+vz3IR1BenWXTusfcQBarfIMk5nFGmYHCgIi5yS4=;
 b=X+kpLZndbcfxZ2CoyJLadyfHsGJsWgQOygS/f1iPgGnDHphOl3zl2N5XGz9l8KCGeBEnVz
 7K++M4G42yZHzxYqhkt1iB3t+fyPdCbbmcbjLJysnJo/5089JIBIJd/chap4k6wTzUjfkw
 hQzwPXFMx2ZaXf77Ozx48It4ZqwJBmHr1TpZCa/3oM4ULVGjFjvezIDnbrIzmOCK5MVep+
 EJAg0Hf3JFSd4Raa62HZ1IQ3plhy64TOgIqUMSsSCqUYpZC+oVWJYi4sNMG3fpyNP8Mwpg
 fkcYf9I1gwW2AiCPW4ZLf6cgSFdN9wZ9SWvM+Ve1a3FgunqjxwHVlCU4wlQ7Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X+kpLZnd
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: bump version to 1.3.4
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Jan 2024 22:48:09 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/libtirpc/libtirpc.hash | 4 ++--
>  package/libtirpc/libtirpc.mk   | 2 +-
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
