Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D31C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6BA082768;
	Mon, 30 May 2022 20:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JrLeqMHZbUu; Mon, 30 May 2022 20:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7E228272C;
	Mon, 30 May 2022 20:18:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 938A61BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9006E41926
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3t85EBGGG7Z for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 041E741923
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:18:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B76E1BF204;
 Mon, 30 May 2022 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653941926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYkNbOkQ74uUMxEfmucrnRIBE+7ZSxqKkyrFKa4AvWI=;
 b=c01IfgB4E0l3kIfmckayKDZmlwpJIATY2lnTPEwZj7Bk5345pAR9Ih7DkCLtHHF0wovKk/
 Ku+SpbTCbjWGZLcDKn0JXFzA0CzvSNaq7qGZkZUB6y7qV2vRYm3deij/ZA9a0foHgEDH77
 r7f2apZK3qCNsS+vvNZe5EcnCEhHOoA5pqJiRwPGCWAn+aSNUgnaaCBcx8HldaseXqegYy
 hc4m2ETTIVq6PvwyZgkccNTfeb5/6Fo79YqzrTDTbaJ2NKrYIDPtkDNc7wCuDIuKsT8BRH
 E/g+KRLVuAFA7p4S1YWa77CeheHzgrp/39iUDIsrhHi3oA12Xth08KsBmdlW7A==
Date: Mon, 30 May 2022 22:18:45 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220530221845.009ef9d6@windsurf>
In-Reply-To: <CAEyMn7ZADNXiVpg2=AL4OrsJ7=ywmp0NmkX37uW72X5D8pFy0Q@mail.gmail.com>
References: <20220524220006.906954-1-festevam@gmail.com>
 <CAEyMn7ZADNXiVpg2=AL4OrsJ7=ywmp0NmkX37uW72X5D8pFy0Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/imx6-sabresd: bump U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 May 2022 12:24:09 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Hi Fabio,
> 
> Am Mi., 25. Mai 2022 um 00:00 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
> >
> > Bump U-Boot to 2022.04 and kernel to 5.15.41 version.  
> 
> Just to let you know: U-Boot will need gnutls.h on host since 2022.04.
> Thus some additional host dependencies are required. This will be
> fixed in the patch series I provided [1]

This is not true: the U-Boot configuration used for this board does not
build the mkeficapsule tool, so host-gnutls is not needed. I just build
tested in a Docker container which doesn't have gnutls-dev installed,
and it builds fine, and the U-Boot configuration has
CONFIG_TOOLS_MKEFICAPSULE disabled.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
