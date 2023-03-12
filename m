Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6F9C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76457607C1;
	Sun, 12 Mar 2023 09:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76457607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slLPdoziPZBY; Sun, 12 Mar 2023 09:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5674607A4;
	Sun, 12 Mar 2023 09:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5674607A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D3C21BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37CAB414E0
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CAB414E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ZCx6lkyT8GK for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:17:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB6D40982
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBB6D40982
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:17:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45A48E0002;
 Sun, 12 Mar 2023 09:17:48 +0000 (UTC)
Date: Sun, 12 Mar 2023 10:17:47 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312101747.03ebdddd@windsurf>
In-Reply-To: <20230311124607.464110-1-ju.o@free.fr>
References: <20230311124607.464110-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678612668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZI9r6gfUps1RC9sY3CM2iS0fZZ/0aErYxAAnh95qao=;
 b=agBSlN1MP4YTsrfspk146FIwAsfnCLlvHn+uHWIKcfbPwzfrTQZgBcJD945zEQLGdkes/X
 7dW173zAbyKx3asTZDmeJ4m7LzTobhc10qBPWf1SRClga//ph+90yL08yU2bVrP3aNGzZT
 s0llpwLGTJWFP2d6EAZwqn0UQBvKNZLqoi36rFEgxDhGDCAWi7BsQicx2W+PlPSHHSyVQy
 WQ39KDz+NbbNV/FxVFf1Ps1x1D1sW8fxrUP/WYjXS4qOKVJpS/FXs4/5QkNCASFIQBejtm
 1zh4JZNFR3s7ZRxitnNOEm760a5gSf6swc5peheBymeWxcjIEu64DvsdOOToVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=agBSlN1M
Subject: Re: [Buildroot] [PATCH next 1/2] package/lsof: bump to version
 4.98.0
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

On Sat, 11 Mar 2023 13:46:06 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 4.96.5, see:
> - https://github.com/lsof-org/lsof/releases/tag/4.97.0
> - https://github.com/lsof-org/lsof/releases/tag/4.98.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a with commands:

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
