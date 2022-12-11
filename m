Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771ABC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA90408F8;
	Sun, 11 Dec 2022 10:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA90408F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cb2NoOtAujXn; Sun, 11 Dec 2022 10:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD76400B0;
	Sun, 11 Dec 2022 10:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD76400B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63BE41BF865
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 322B2402A8
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 322B2402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_Q5b0aVNEll for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:38:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06D940128
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E06D940128
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:38:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F343D100005;
 Sun, 11 Dec 2022 10:38:38 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:38:38 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211113838.11015811@windsurf>
In-Reply-To: <20221208222906.4183331-1-christian@paral.in>
References: <20221208222906.4183331-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670755119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGM7GZEv8z/zX9GGMrQz4FLkt+pzPzgqi/iGDJs6z6I=;
 b=PdgIt5IV0OW/quyS1wFbb0bCJLQ1/ORaC06ZIdx3YAp63fR3wPppFVZc7y6XVphF5EdqPV
 8V6ij0npPsDPzZgGwVhPvMmw6XJ+BmWKFodActF2CjKKDM0OYnqv/uj7hTKuSQIJiGxcMG
 YJtoJZ6FXETdRiVpQvoyXc043qMGl8++u3fJBerCMByGLSX5H42VqWJ04KKajuhPGMTJkN
 p6bd9HRrLvO5mINUG3+PX1QDng0jNhHYdh0nvUjHYPsbm3drTFvngE7kBOun/suWPJKsUB
 KVDx+j1IDbsJg06eOJPaPCLxal/Z0HGaC2VsvAU+GjtFmVS7GPqeo5F/lU3gcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PdgIt5IV
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: bump to version 2.3
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

On Thu,  8 Dec 2022 14:29:06 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Rebase the patch for riscv compatibility as well.
> 
> "go mod tidy" insists on updating x/sys so pin it to the version from upstream
> release v2.3 using a replace statement.
> 
> https://github.com/rfjakob/gocryptfs/releases/tag/v2.3
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...-fix-jacobsa-crypto-build-on-riscv64.patch | 84 +++++++++++++------
>  package/gocryptfs/gocryptfs.hash              |  2 +-
>  package/gocryptfs/gocryptfs.mk                |  2 +-
>  3 files changed, 61 insertions(+), 27 deletions(-)

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
