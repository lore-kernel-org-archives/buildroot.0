Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F010C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:32:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C2C61056
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19C2C61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC92D4031E;
	Sun, 14 Nov 2021 13:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-tR76AlI5jl; Sun, 14 Nov 2021 13:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404D440314;
	Sun, 14 Nov 2021 13:32:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE89B1BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA696401F1
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1jD-PcBkc8z for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:32:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD39940202
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:32:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 94D7E1BF206;
 Sun, 14 Nov 2021 13:32:41 +0000 (UTC)
Date: Sun, 14 Nov 2021 14:32:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Message-ID: <20211114143240.2fdb75f0@windsurf>
In-Reply-To: <0ee5faa0-e4dc-a8a1-11ad-a1908a3d43aa@gmail.com>
References: <0ee5faa0-e4dc-a8a1-11ad-a1908a3d43aa@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Enable uart1 and uart2 on Orange pi zero
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

Hello Sergey,

On Sat, 13 Nov 2021 20:21:41 +0300
Sergey Kuzminov <kuzminov.sergey81@gmail.com> wrote:

> Enable uart1 and uart2 on Orange pi zero.

Thanks. Could you please send this as a proper Buildroot patch, i.e
after doing a commit in your Buildroot repository, do:

 $ git format-patch -1
 $ git send-email --to buildroot@buildroot.org 0001-....patch

See the Buildroot manual for details on how to create patches and
contribute to Buildroot.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
