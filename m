Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9706EC6FA92
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 10:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D51BD40B66;
	Mon, 19 Sep 2022 10:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D51BD40B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9--XsrIiU5Y; Mon, 19 Sep 2022 10:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC19340B54;
	Mon, 19 Sep 2022 10:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC19340B54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3871C1BF279
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 10:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E09B640B54
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 10:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E09B640B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNomOO_ZHKEe for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 10:48:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A76D400C4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A76D400C4
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 10:48:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 452871BF209;
 Mon, 19 Sep 2022 10:48:41 +0000 (UTC)
Date: Mon, 19 Sep 2022 12:48:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220919124840.0f8d8b4b@windsurf>
In-Reply-To: <3a565e425e1bb39439434e1681918682@free.fr>
References: <20220821160143.16646-1-ju.o@free.fr>
 <20220917224934.01388da4@windsurf>
 <3a565e425e1bb39439434e1681918682@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663584521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znavvdv3h7I7tYh2nmVVRwF1yxGKpUIogLiAYqo02Xw=;
 b=aCTBQ+GryvTtI02j8+fVrpmApyFTtMJi8zcBQ7x+lma3gRqvjx76QXZIMoo5LSy39RJms8
 ozxSMTP9nkmrh2aAbOOAC98XKp8+PkqvAaayoIPrMongc648mmavkUIaK+DhKTcpSrv+26
 8M2VOEAlovnat/9lwVsbvkzRHMUzOFP8iHJhzhgfFlyhVnfPT5oEm47lBnzPg4BoNzsB3d
 c8xn3JofrUb9ybRx2+XU+tE5HiMrNtNVX1sEXTdi5kBl+IdWqYrpltmWtO47tgC8IAdEMv
 Jit04M3Q2fuj6ET45C7fHgv1uVwO4N5CBTnB1rgjG+UfC60B+Xt0HIliEZmR2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aCTBQ+Gr
Subject: Re: [Buildroot] [PATCH next 1/1] package/rdma-core: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Mon, 19 Sep 2022 00:38:27 +0200
Julien Olivain <ju.o@free.fr> wrote:


> >> +The Linux Kernel needs some Infiniband configuration. In this example
> >> +the kernel "rdma_rxe" driver is needed (CONFIG_RDMA_RXE=y). See the
> >> +example fragment file provided:
> >> +
> >> +    package/rdma-core/linux-rdma.fragment  
> > 
> > Did you consider using the <pkg>_LINUX_CONFIG_FIXUPS variable instead?
> > This would make sure these configuration options are always enabled in
> > the kernel. Or is your fragment just an example?  
> 
> Yes, I considered <pkg>_LINUX_CONFIG_FIXUPS but decided not to use it.
> This fragment is really an example with the rdma_rxe driver. The
> rdma-core package could be used with any other Kernel InfiniBand
> driver. The reason I picked this one, is it's a purely software
> implementation and does not require any specific hardware to test.
> 
> The only Kernel config that could always be enabled would be
> CONFIG_INFINIBAND to enable the core support. The value would be
> limited as it would be an empty shell since no other driver/options
> would be enabled.
> 
> I could then enable a bit more kernel configs, but I think this would
> go against the Buildroot philosophy (which I could summarize as
> "Buildroot only enables the mandatory things, the user enables only
> what he/she needs/wants").
> 
> I used the word "example" for that purpose. If needed, I can clarify
> even more in the text.

Then I think there is no need to provide this example, just put the
kernel config fragment as an artifact together with the runtime test.

> >> +Buildroot package configuration
> >> +-------------------------------
> >> +
> >> +For setting up a software RoCE link, the "rdma" program is needed. It
> >> +is provided by the "iproute2" package, when "libmnl" is also
> >> +selected. Make sure to have in your Buildroot configuration:
> >> +
> >> +    BR2_PACKAGE_IPROUTE2=y
> >> +    BR2_PACKAGE_LIBMNL=y
> >> +    BR2_PACKAGE_RDMA_CORE=y  
> > 
> > Then is there a reason to not select iproute2 and libmnl? Or is it just
> > that they are needed only for specific use cases?  
> 
> Yes, the reasons are:
> - Those are indeed needed for a specific use cases,
> - Those are not mandatory dependencies (neither for build nor runtime).

OK. Then indeed, suggesting that they can be relevant (and in which
case) in the Config.in help text would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
