Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBC2C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 22:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1A194161B;
	Sat, 14 Jan 2023 22:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1A194161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGspq3HJNqoN; Sat, 14 Jan 2023 22:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0547641624;
	Sat, 14 Jan 2023 22:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0547641624
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF85B1BF3AA
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B65640895
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B65640895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5SGbUyXl57N for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 22:10:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C5D340640
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C5D340640
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 22:10:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 008F3240002;
 Sat, 14 Jan 2023 22:10:11 +0000 (UTC)
Date: Sat, 14 Jan 2023 23:10:11 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230114231011.737af7f4@windsurf>
In-Reply-To: <VI1P190MB0493FDD823C21285E5D1D60D9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493FDD823C21285E5D1D60D9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673734212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hE9gCrUBFhQsliwY/rTV83yCgqeGLc5KlUdUNq8kY/Y=;
 b=dJmQICxsyOT9c2gAExCqyGS7GLPrATwedOzMEqXvJox3Pfa2ZaEe4yzFpqBUzEXahTrBKH
 6unZn+LBSj3/pWveK+U+er+C+vbds/ylZQjSGVUtgJz0ktYMNKbWXBUJakxQckibae48a0
 fmiPgWb38NDAWsY4444Kc77PWzHVfInuE5CAlYZImXqU93KGnpBcG3hHZxyWYrjp98xLE5
 am7uTOfOUEcrO0IwYvz+Y6HWmPMsrd8LN9X05cVhO94avH0RF+lbgUg9S5W+YDAevLZXUC
 2ggffALk9dep1ADozq+pg2mBZ1HKFG0301ek2eiC56X0tVjyevDHGrU5Up7xtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dJmQICxs
Subject: Re: [Buildroot] [PATCH 3/3] package/freescale-imx/imx-gpu-viv: add
 platform specific drivers
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
Cc: Lang Daniel <d.lang@abatec.at>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 10 Jan 2023 09:33:39 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
> the archive contains platform specific drivers that need to be copied
> and included.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/freescale-imx/imx-gpu-viv/Config.in      |  8 ++++++++
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 11 +++++++++++
>  2 files changed, 19 insertions(+)

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
