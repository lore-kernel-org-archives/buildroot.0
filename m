Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD00C6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:35:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9FD61003
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9FD61003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1E2A60633;
	Wed, 21 Jul 2021 20:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vb77zadK9ytP; Wed, 21 Jul 2021 20:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D761360654;
	Wed, 21 Jul 2021 20:35:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 394D11BF844
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 354974012E
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKiN1LFeaWOP for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3327940117
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:35:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F0BEE20002;
 Wed, 21 Jul 2021 20:35:00 +0000 (UTC)
Date: Wed, 21 Jul 2021 22:34:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20210721223457.1450a1e8@windsurf>
In-Reply-To: <20210622014117.2378875-1-christian@paral.in>
References: <20210622014117.2378875-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go-bootstrap: bump to
 version 1.4-bootstrap-20171003
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Mon, 21 Jun 2021 18:41:17 -0700
Christian Stewart <christian@paral.in> wrote:

> See https://golang.org/doc/install/source#bootstrapFromSource
> 
> All Go compiler versions > 1.4.x (old) are written in Go, and require a existing
> compiled Go version to use to build from source. Buildroot uses a 1.4.x version
> in the "go-bootstrap" package to build a C-based Go compiler, and then uses that
> compiler to build the main "host-go" compiler.
> 
> This commit updates to the latest 1.4.x go-bootstrap branch version recommended
> in the documentation, which includes more compatibility fixes.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go-bootstrap/go-bootstrap.hash | 2 +-
>  package/go-bootstrap/go-bootstrap.mk   | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

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
