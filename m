Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E573C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCD34136C;
	Mon,  7 Nov 2022 22:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCD34136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLlf5h4rebeT; Mon,  7 Nov 2022 22:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC9FB410E5;
	Mon,  7 Nov 2022 22:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC9FB410E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7F01BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66E1460BF2
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E1460BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TWPSMHaAJ_Au for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:11:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69ED460B30
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69ED460B30
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:11:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AE4E1BF205;
 Mon,  7 Nov 2022 22:11:29 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:11:28 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221107231128.372e32ca@windsurf>
In-Reply-To: <20221105224127.4026011-1-james.hilliard1@gmail.com>
References: <20221105224127.4026011-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jE8+g3WLcqee5mOg3MZaYhgwunDDZOTSkyZYJBbSPUc=;
 b=Z3lRsXr5l0AvenmlYmuwX3rDLiSdmQA0Wb/32ISFkTYADclBIgC84As6Hc0XUH1QVlWB5H
 Wnx7zKkwQG6HgL+jTjlo4aVZkr3wXHuIz3rqDDVHe7arQ385NgSA20LRYwkK6SP6BVD0+7
 DkQWcaQbSBda4nIRiRo0igVksYt2C3oj1FCzb1t0XMN6Ul9i9Oca/GHRnnfpux6Ud7Dp/p
 zbo59WjJ9fyBI7m8gpcO71wDa0wddBYcycmdFaKBmHQVarhSrI2GA/6kVyF0+ScoYWsK7u
 9hhD9wn8sU86JqL4eIIrrEa0ICRxXVKJtjEfPdSS5uj6nN2T7YMI4sQSaGV2kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z3lRsXr5
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to
 version 1.28
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

On Sat,  5 Nov 2022 16:41:27 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/wayland-protocols/wayland-protocols.hash | 6 +++---
>  package/wayland-protocols/wayland-protocols.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
