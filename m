Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB78C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1512581BC0;
	Sat, 22 Jul 2023 21:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1512581BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMzN9gRK10ix; Sat, 22 Jul 2023 21:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08A1481DF5;
	Sat, 22 Jul 2023 21:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A1481DF5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 839301BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AFEA414CC
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AFEA414CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agkIwN8lrWrl for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:08:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8850E414A1
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8850E414A1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 252E01BF204;
 Sat, 22 Jul 2023 21:08:45 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:08:44 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230722230844.7c0aebb8@windsurf>
In-Reply-To: <20230711220849.1702358-1-christian@aperture.us>
References: <20230711220849.1702358-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6j4PGxGw5vati1R7oEYDUiK96QS/6hnlh5F5klRMtQs=;
 b=k+fuSOdVsr0mU2rivhPZcM65HEvUD7FeBjn7WsUcuY0lQwTvI0k6uw5FeX8FFxSbma15Iu
 KJpB7laR1HdaMDhDqtCqrq+0U2nKKnwHIpLEqHyGwv6f9WuhyMvHbOVHgjb8VX+XfKK/SU
 Dp/Enhomu8rT9fRaw3dTa4ENhu36ZWtZ5SfMcijMFMHWLQFJ6RlsP3Gg/kNB6MDFyxlIr5
 JwxV1thXngdJIj7XZyr6tuqA2Ea+6Yx0YPvj7BZJhQcaeZFLi3pC1VsxXEv0WZ9zGrU/XY
 FtndUmOKGP8dd6YlQcKLIpYsrhXUhxITbgZNzx4vNHTKl9xe1l1tTTZVEdBEbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k+fuSOdV
Subject: Re: [Buildroot] [PATCH v7 1/4] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.10
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Tue, 11 Jul 2023 15:08:46 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> +# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE.

                                ^^^^^^^^^^ compatible

also, line was too long, so I rewrapped.

> +# The go build system is not compatible with ccache, so use HOSTCC_NOCCACHE.

Here as well.

Applied with those minor fixes.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
