Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB7CC636D3
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C7F140C00;
	Mon, 30 Jan 2023 21:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C7F140C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8lLqBNvjt2uK; Mon, 30 Jan 2023 21:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84ACB40BE6;
	Mon, 30 Jan 2023 21:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84ACB40BE6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 304171BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 055F6418AE
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 055F6418AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jyXxVVAcXpL9 for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:49:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B16A9404E8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B16A9404E8
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:49:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DDDE3C0007;
 Mon, 30 Jan 2023 21:49:42 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:49:41 +0100
To: Ramon Crichlow <rcrichlow9000@gmail.com>
Message-ID: <20230130224941.476a2854@windsurf>
In-Reply-To: <20230123155659.4207-1-rcrichlow9000@gmail.com>
References: <20230123155659.4207-1-rcrichlow9000@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675115383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqA1tLf+ubufq/aQESKDv+y10S74vw8VROCDT7RIPBQ=;
 b=F8K3N0AS/uxdIV8sSJzU/1YgeIjGvqf7kcvdkJfOXE5JR3MbBbpdnl4DUdt5qJwz/8h/Up
 6YmnT8YGgvqYxyWVcIMe9Rl/cFkgS9MAGuHPka/cUEtoL4lU/jpdkla8AwGQl3Gg+rPcVT
 q5l+y/JTWyr9cGBmadyB5SSf8pv0d6GNnvdDeTOvLBrj2DVYEhPlExBL+eEXWUZwQz2ake
 o0qXXhOhMOnhrztZgV8xSkBgSYB4dMKMkLC8K5Ozpwfj8exEDLSZTLt0vRAuCHZKx0eyo7
 OkmCDB5Z1K06AsjJMqRgO4U3BwYEwyHw1TODgH+K2J+E06/1VFRdylPvwEabYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F8K3N0AS
Subject: Re: [Buildroot] [PATCH 1/1] Added beaglebone-green-wireless device
 tree to beaglebone_defconfig and genimage.cfg
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
Cc: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 23 Jan 2023 09:56:59 -0600
Ramon Crichlow <rcrichlow9000@gmail.com> wrote:

> Signed-off-by: Ramon Crichlow <rcrichlow9000@gmail.com>
> ---
>  board/beaglebone/genimage.cfg | 1 +
>  configs/beaglebone_defconfig  | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Thanks, I have applied this patch to master, after reworking the commit
title/log:

  https://gitlab.com/buildroot.org/buildroot/-/commit/fd1d0a9cbf6de2c30fcfcc181b466a5f2b44dc54

I also pushed a followup commit that updates
board/beaglebone/readme.txt:

  https://gitlab.com/buildroot.org/buildroot/-/commit/faa299ff8c94bea11345071a3d1d05c2681c2cdd

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
