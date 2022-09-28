Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74945C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A9E760E60;
	Wed, 28 Sep 2022 21:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A9E760E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMJ-yWlyUNdG; Wed, 28 Sep 2022 21:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EB060E50;
	Wed, 28 Sep 2022 21:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22EB060E50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFBF1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57ECB41751
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57ECB41751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37QhryIlNpUQ for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:39:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5384170B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF5384170B
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:39:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B224EE0007;
 Wed, 28 Sep 2022 21:39:51 +0000 (UTC)
Date: Wed, 28 Sep 2022 23:39:50 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20220928233950.5e7f6a7a@windsurf>
In-Reply-To: <20220928065935.506128-1-buildroot@heine.tech>
References: <20220928065935.506128-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664401192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N4ZbIeyy1YlGy4FVbSy73bMhvRzC3WO7e8dqYLHRmko=;
 b=RUYY9XZzw3POFNWs2bKN2nz9XW5ZQPYVBrM9mcmtwNkjPsuZbvCKVot39PfY5Zhl8sTi2w
 Udbwqs+RbvJ+o7P63qq/jQOu1uou/I6KSKMfeZUlregjtS5yi/5Bak81zpwcmLgeZmMviQ
 ReC5K+xdMd3duIaDxCLQf4h2b3Zn7oBuRG9s6Tf7JSqUBtmnh335N/6fPXMUbdIlL+72Oi
 vVB+emCNvH5aRbT6O4lJdc5l2s1W5jH2YZtzqbjRxRT5Fxggm9CTg0r6HM3G+ro56OCUn6
 puS3NdXF6lLPu9rgTofxMXE593/33bU43PXHDbiuN7Z7fP0ZBhMlMYH6rRNYlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RUYY9XZz
Subject: Re: [Buildroot] [PATCH] package/grpc: bump to version 1.49.1
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Sep 2022 08:59:34 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/grpc/grpc.hash | 2 +-
>  package/grpc/grpc.mk   | 2 +-
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
