Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC1EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 19:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE24D41803;
	Mon, 10 Jul 2023 19:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE24D41803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GACJtOnQWUrr; Mon, 10 Jul 2023 19:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3AFB417F6;
	Mon, 10 Jul 2023 19:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3AFB417F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED221BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 273CF417F6
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 273CF417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOdBeYtlQewU for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 19:17:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB184175C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACB184175C
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 19:17:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85A4420004;
 Mon, 10 Jul 2023 19:17:48 +0000 (UTC)
Date: Mon, 10 Jul 2023 21:17:47 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230710211747.0986fb94@windsurf>
In-Reply-To: <20230620170726.3644-1-ckhardin@gmail.com>
References: <20230620170726.3644-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689016668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnUfR2W9PPTiLq08ERHw8n9g1C08WPvDw+w/F9LpwP0=;
 b=V8ECdZrPNk5Kb76ecy0uJz6FlF4/qgbgbCqRykvJSlqPDcuoiNNpmQ/qb3IOsU6YX9bZFw
 ilr9xQpXUDnv8UsQt+gRryE9blnoQAmjxCxy4kKQRpg8vqbTNEgWQWP6sd1Fb0HPglv6jT
 JE11qKgcXPbkM089RuVV+qbUAqoJ2webpTIk/8lDamyUcMdaT3XWM5ISHEwTfXhdSAVafy
 3D4MTxEVYLE6Jfni0uoaX0syICW8TeJ8wX5iMkObWErzSlNvuIUg5pZ2r0cGRI7eklsxO/
 +deluIAiAqgG/x/jTl/s3JpRexkj1IdwCOfdIhka7ClnGV9AKi1aTupvbB399Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V8ECdZrP
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix dhcp symlink in
 target/var/lib/dhcp
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charles,

+Yann in Cc. I will ask a few questions below, but honestly I'm not
super familiar with this part of the code base, so I might be asking
some stupid questions.

On Tue, 20 Jun 2023 10:07:26 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> In a readonly fs configuration the skeleton-init-fs will move

I supposed you meant skeleton-init-systemd. Indeed, there's nothing
named skeleton-init-fs in Buildroot as far as I know.

> the var directories to the usr/share/factory and the run a command
> like this:
> 
>    mv $(TARGET_DIR)/var $(TARGET_DIR)/usr/share/factory/var
>    mkdir -p $(TARGET_DIR)/var
>    for i in $(TARGET_DIR)/usr/share/factory/var/* \
>             $(TARGET_DIR)/usr/share/factory/var/lib/* \
>             $(TARGET_DIR)/usr/share/factory/var/lib/systemd/*; do
> 
> If the symlink is to the /tmp directory the glob compare on the
> dhcp link will evaluate and result in an incorrect entry being
> created in the resulting tmpfs mount on var.

I'm not able to parse your explanation here. Which glob compare? Which
evaluation?

> 
>     L+! /var/lib/dhcp - - - - ../usr/share/factory//var/lib/dhcp

Not obvious to me what is invalid in this entry, but admittedly I have
not done a test build/test run to investigate more.

Perhaps you can give a little bit more details to make the issue
obvious to the reviewer, and therefore help your patch to be merged?

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
