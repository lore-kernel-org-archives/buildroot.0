Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48CFC74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 13:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A9DF405F4;
	Sun, 12 Mar 2023 13:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9DF405F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIFqqB44NfqB; Sun, 12 Mar 2023 13:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE80040376;
	Sun, 12 Mar 2023 13:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE80040376
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 701CD1BF339
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 13:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D0D4607BC
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 13:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0D4607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbxOWkaKjUma for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 13:13:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE4E0605AF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE4E0605AF
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 13:13:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9870760006;
 Sun, 12 Mar 2023 13:13:51 +0000 (UTC)
Date: Sun, 12 Mar 2023 14:13:50 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312141350.31546482@windsurf>
In-Reply-To: <20230304133516.3412402-1-ju.o@free.fr>
References: <20230304133516.3412402-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678626832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eykanxznsiL4QrG+tkzLrrc67uOjloOGHCyyQgae7cA=;
 b=m/I6kkkdzoO9y21PrDZhs/PtWB5jvFMGuCr9Dex2svwCwn29fs4lxbyCzfOiRWXIWoj2M5
 9uocyL2bZ/+KjNEflHIOPiuv3ToS3MfbTvmVfy/OyuHth3BZPw360+DpSCeeSQjTilacEW
 VQ7qVCcNeQpnMNJy9udFyNvR4xIe6063AUfc9uAEAduq315sk6R9rOVqYn99iDmSU59miw
 NWDUYazFWoN055oSytM1JRzbdRdA6IZp33zhHnDSjleITWOgt67akgoxN6aFUx90KgRR3o
 VshL68UbGxN0Vi0PeGcGti6OqbZQfnHdCKzaFm++oPKHGCfhGdz1pDTxGQkdhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m/I6kkkd
Subject: Re: [Buildroot] [PATCH next 1/1] package/ola: bump to version 0.10.9
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

On Sat,  4 Mar 2023 14:35:16 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/OpenLightingProject/ola/releases/tag/0.10.9
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> This patch was tested on branch next at commit b793f3a with commands:

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
