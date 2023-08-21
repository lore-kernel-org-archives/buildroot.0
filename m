Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9704DEE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 14:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E3AB410DE;
	Mon, 21 Aug 2023 14:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E3AB410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSd4zNw0fMer; Mon, 21 Aug 2023 14:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A47410DF;
	Mon, 21 Aug 2023 14:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A47410DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD4DF1BF3E8
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 14:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96D12400DD
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 14:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D12400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PdmjyIyRjRjN for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 14:05:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93FAA4095D
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 14:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93FAA4095D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C86FFF80B;
 Mon, 21 Aug 2023 14:05:20 +0000 (UTC)
Date: Mon, 21 Aug 2023 16:05:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230821160519.64132d84@windsurf>
In-Reply-To: <20230816202147.1790367-1-bernd@kuhls.net>
References: <20230816202147.1790367-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692626721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eX2Ujj0bGdx8O8Ii24Kox8D/Hau6UZhmCbfXX3wrxJo=;
 b=Nq+FdX/pxH0i4OudwTfsZLr/MQDUJefa/II+jPBioxHymVUNOrO8cb9djUDQAXx1zWs/fj
 W4qsT6lNDSfJXzggfdYe8khQDpSbUzG6DXReDzY86bfPVInqHuqznwhCrkllrCFyJmpfPI
 Z0uElD0WfxHnl8mNFTSgDhCxg5CDUgSPkLCHuW+J1IWxvalktmSO4t1eEwZJ/wgZXCyVu5
 v0hQz60qRetA62OTZso701kZ2+dJmqsYnVtIDgI7IuLUIy6ola+7npgl5t3lPPAte9cS1w
 1Mz8hpPA/vMo6tFW1d9AHRyXD2Fzw28gSnpKZEDBY10EY3BI5AsUfXR+/gZBJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nq+FdX/p
Subject: Re: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.6
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Aug 2023 22:21:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2023-August/000727.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 6 +++---
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
