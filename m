Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6BEC4320A
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A80D60F5A
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A80D60F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2357C83265;
	Mon, 26 Jul 2021 21:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWKP8PXIeuA1; Mon, 26 Jul 2021 21:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72EC6830AB;
	Mon, 26 Jul 2021 21:09:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F83D1BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 394068356E
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXmyRMkzqwnG for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:08:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 494CA8299D
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:08:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6395D200004;
 Mon, 26 Jul 2021 21:08:41 +0000 (UTC)
Date: Mon, 26 Jul 2021 23:08:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20210726230840.4062626b@windsurf>
In-Reply-To: <20210726091635.86606-2-titouanchristophe@gmail.com>
References: <20210726091635.86606-1-titouanchristophe@gmail.com>
 <20210726091635.86606-2-titouanchristophe@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Mon, 26 Jul 2021 11:16:35 +0200
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> From the release notes:
> ================================================================================
> Redis 6.2.5 Released Wed Jul 21 16:32:19 IDT 2021
> ================================================================================
> 
> Upgrade urgency: SECURITY, contains fixes to security issues that affect
> authenticated client connections on 32-bit versions. MODERATE otherwise.
> 
> Fix integer overflow in BITFIELD on 32-bit versions (CVE-2021-32761).
> An integer overflow bug in Redis version 2.2 or newer can be exploited using the
> BITFIELD command to corrupt the heap and potentially result with remote code
> execution.
> 
> See https://github.com/redis/redis/blob/6.2.5/00-RELEASENOTES
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
