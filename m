Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3506FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2444481361;
	Mon, 31 Oct 2022 10:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2444481361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLI9NsIYn9u4; Mon, 31 Oct 2022 10:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 675558137C;
	Mon, 31 Oct 2022 10:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 675558137C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33F401BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BA9040579
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BA9040579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaFKGs5tOsdU for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:37:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4BCE405CA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4BCE405CA
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:37:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F3561E000A;
 Mon, 31 Oct 2022 10:37:04 +0000 (UTC)
Date: Mon, 31 Oct 2022 11:37:03 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221031113703.1d622fc1@windsurf>
In-Reply-To: <20220821041417.483818-1-christian@paral.in>
References: <20220821041417.483818-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667212626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNegvfg8GuirOx59LIXdEFYDXRhhrVOp/oOqLxjAsMY=;
 b=nlbD27ZVe1tbsxO2G+iVtm7gGaCBu76Ly+q6Ub8Q719zwJFuQGU5kf1WUB82UTElMw+ek7
 R+cGGSLzRcz7Le9Gg8ruFhU2Hwmp0LFGVrjrbUGtoyUnDdDqtO9oO8L8pRpqetpyrI7apf
 24aePJ1+Je62r29bXlnKz6XwMgp3S3HBeMw2DrqlKcEd3XiNbcGGbSV0cc/9KUwOFZY3XL
 2fpZH83dDLGOKlHs8DWljPz93fboeCCjTBlKlwbrwODKPqJ1WryyXNaZeVgLbL+EyS2uhK
 w0QKloxEjGHAO0nF1W+KQTpJY9tYAQCRVhQp+v5zb9XOwGstWfmdM7chfb4bKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nlbD27ZV
Subject: Re: [Buildroot] [PATCH v1 1/1] package/catatonit: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Aug 2022 21:14:17 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> catatonit is a simple but valid init binary to act as PID 1 for containers.
> 
> https://github.com/openSUSE/catatonit
> 
> Dependency of podman.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  ...e.ac-call-AM_INIT_AUTOMAKE-only-once.patch | 39 +++++++++++++++++++
>  package/catatonit/Config.in                   |  7 ++++
>  package/catatonit/catatonit.hash              |  3 ++
>  package/catatonit/catatonit.mk                | 14 +++++++
>  6 files changed, 65 insertions(+)
>  create mode 100644 package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
>  create mode 100644 package/catatonit/Config.in
>  create mode 100644 package/catatonit/catatonit.hash
>  create mode 100644 package/catatonit/catatonit.mk

A dependency on BR2_USE_MMU was missing, so I've added it, and applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
