Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527F1ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED5DA8198A;
	Mon, 31 Oct 2022 14:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED5DA8198A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6GYXxy5uxXK; Mon, 31 Oct 2022 14:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0A381425;
	Mon, 31 Oct 2022 14:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0A381425
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16B381BF3D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F38CD81250
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F38CD81250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPZZcj-TTxYZ for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:43:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D147E80DCF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D147E80DCF
 for <buildroot@busybox.net>; Mon, 31 Oct 2022 14:43:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC0F3C0002;
 Mon, 31 Oct 2022 14:43:47 +0000 (UTC)
Date: Mon, 31 Oct 2022 15:43:46 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221031154346.0b854452@windsurf>
In-Reply-To: <20221023071946.433502-1-francois.perrad@gadz.org>
References: <20221023071946.433502-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667227428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRjIGoPItsM4zGOaJR5dUG3vBU094Rp/CT61F3LG+MI=;
 b=Nlb+aYpdQPVmfkfpkohnL1E8JgWkJKn1yVJ+2fgYKNBq4YpA+PqaAb3VCZuWYWRtkNAKCD
 w1KIUbHU8u5NAczUWQ1zTIrU1BPW/Du1ujM6aMWZ4FOm8FfbsSHzNo4uPmtTy7N+TOG0QB
 gg2RDdpVB1j8izO1NfXIZjhHV+0jiTb00jM1e8zs0stkiJjdOdCxISM0cXNklm4i2esmxe
 CEZbsawAiBX4uhf5sMI7gFLkehwDAqtsCIIiCjJPFmacDvDF8RPaj+maBwGN+GeoaWnN5L
 FlBBYfFFYsHbQUzhNGtonaF1xkaBkK3qNvUxqR0cp6o0bjU1MPitWzzRZsU/4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nlb+aYpd
Subject: Re: [Buildroot] [PATCH] package/lua-lyaml: bump to version 6.2.8
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Oct 2022 09:19:46 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> diff LICENCE:
> -Copyright (C) 2013-2020 Gary V. Vaughan
> +Copyright (C) 2013-2022 Gary V. Vaughan
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-lyaml/lua-lyaml.hash | 4 ++--
>  package/lua-lyaml/lua-lyaml.mk   | 2 +-
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
