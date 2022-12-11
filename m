Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE98CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D9C340477;
	Sun, 11 Dec 2022 10:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D9C340477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bc_lcj009nkU; Sun, 11 Dec 2022 10:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAB4C402A8;
	Sun, 11 Dec 2022 10:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAB4C402A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EC911BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57420408F1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57420408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrTuinR-gwbd for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F0B40886
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3F0B40886
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:36:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF218240007;
 Sun, 11 Dec 2022 10:36:09 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:36:09 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211113609.24da98ac@windsurf>
In-Reply-To: <20221208213431.4141288-1-christian@paral.in>
References: <20221208213431.4141288-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670754970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCXPUwOH41l/JLhW06JhzYjz6d0xuWnb6Vg5SZzDGkI=;
 b=pZi5l1oV7Ri4BY/++wGi3PcM0RDy2TjwSghumxAdUBquZNbB5GuHOZ0KfCj4aNAcIRj1pp
 lEeJ7CyATluXgIZFw7+/NmyyydeLp36knvCiRuxfzU/q44wTEHHL3cDSUnv0ldOimdRUJR
 t3fUTjIiFWUatXEd8iLW5V9iuu69KkRi7eCYI+d1LVdfekSLhiqkdQUyV6qZk20wdCHugW
 HPYwGj9Yj71xDWB+r3uRgklLjgk13VrJF3GSP2hQFGoYO3O5Nry6GgsR+Zkqx3mEBhgHP8
 oBBKc4tJbjOHDvX6gRlEakvRr18mDJxUf3d5xj2zI87utrXGmN+o64XOL5PbpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pZi5l1oV
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-compose: bump to version
 2.14.0
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

On Thu,  8 Dec 2022 13:34:31 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/docker/compose/releases/tag/v2.14.0
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-compose/docker-compose.hash | 2 +-
>  package/docker-compose/docker-compose.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
