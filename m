Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442FBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4DBC404EB;
	Tue, 15 Mar 2022 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1T8rx4T1fgM; Tue, 15 Mar 2022 21:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA0B340525;
	Tue, 15 Mar 2022 21:06:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA0FD1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8CB66068F
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vJQJYdl3Me6 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:06:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 920CB60640
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:06:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45F9760005;
 Tue, 15 Mar 2022 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647378400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztHHMnjligx6hSWEM2gK9qbDX8tQ+R/GBTVepu+8eXk=;
 b=DKoUBdn5uEFS5vIKoP6eSgemWVqqwxfWLTSs9nZI0W8WEx4t5mT4KEvEurAMj5pO93CVNC
 EhQVpTdEKwJXOt5GKjhqeY27qv2z+ZWrlYO13hsjLALqTy/b1rYhJtA8FLfjAjUMAf0Sdf
 IzSSl9dhJP6Pq53+9xR2ri6aeyXE/gxgXWuroCPNTwmAiSdAuCv5d0eR1U4DP5rTMzVY7S
 MFU+sOFvgm+xDKNtq29kxyfeFPnjtFICIgiCz9vveMbInzaWbumQE4srA7mmL+YeT2AmaL
 dGQKwksl1AG1O7ldHVyxyV4jxq2Zw9fYHf1OQfVKJ3rf2BIuUUaTjmIZOaxjqQ==
Date: Tue, 15 Mar 2022 22:06:39 +0100
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Message-ID: <20220315220639.29413684@windsurf>
In-Reply-To: <20220310185921.8852-1-kris@embeddedTS.com>
References: <20220310185921.8852-1-kris@embeddedTS.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ts4900-fpga: bump version to
 20170510
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
Cc: Kris Bahnsen <kris@embeddedTS.com>, Mathieu Audat <mathieuaudat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Mar 2022 10:59:21 -0800
Kris Bahnsen via buildroot <buildroot@buildroot.org> wrote:

> Fixes TXEN on CPU UARTs not correctly asserting in some multi-byte
> transmits.
> 
> Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> ---
>  package/ts4900-fpga/ts4900-fpga.hash | 6 +++---
>  package/ts4900-fpga/ts4900-fpga.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
