Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5709EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90BD161021;
	Sun, 30 Jul 2023 21:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90BD161021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZvP5Smm1SAN; Sun, 30 Jul 2023 21:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3666461023;
	Sun, 30 Jul 2023 21:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3666461023
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5AB1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4300A416BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4300A416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFLiCihdysZA for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:42:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 122F341686
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 122F341686
Received: by mail.gandi.net (Postfix) with ESMTPSA id E816140004;
 Sun, 30 Jul 2023 21:42:28 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:42:27 +0200
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230730234227.08d99fea@windsurf>
In-Reply-To: <VI1P190MB0493EB214DD0DF6418B029E69FBF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493EB214DD0DF6418B029E69FBF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690753349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=az9pobBE65bjH1fSS0c4xgHwkB8IAjlDGLu+G8jPghA=;
 b=kfC0bcY2CClHmOOQZYSAibtTIihrBsfkpuQ2pNbQdWdFIJOYMWlt2Bp3QVGUmKZHt4g07P
 oQtqz4WuCmuBYUtnfXsm7mViGC2SCkBnHtOVggvAxekVbodX8C0wKGml6Nzzxc9UlvBPKr
 k2dMXXVro/SnxzKaqsbN4EmdydVd0ClPlOcAaVPRj4Fg9xhIP6Wed/r3s99Z71/QxJNoQV
 LDlpzbEFQIaV3rFzk/4UAvgfJLKhM3il0X6DL7VLlA023N2sJyBqAK4CfrAk1xIoTRs3nG
 44I1IZnSchTDOY4zir6ajRMcjdCnpzwA9gfuyvDMCa+YffnDf58asAUCrQfRdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kfC0bcY2
Subject: Re: [Buildroot] [PATCH] package/sam-ba: drop 32bit host lib
 requirement
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Daniel,

On Wed, 15 Mar 2023 16:21:11 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Current versions of sam-ba are 64bit only.
> 
> objdump -p $(HOST_DIR)/bin/sam-ba
> $(HOST_DIR)/bin/sam-ba: file format elf64-x86-64
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  Config.in                     | 2 +-
>  package/sam-ba/Config.in.host | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Indeed, this was wrong since commit
b26a62236f015ee723206c6a6da431799e8866da. So: applied to master!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
