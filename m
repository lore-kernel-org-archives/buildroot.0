Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URI_NOVOWEL,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D990C6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:07:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64666613E4
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64666613E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3906240217;
	Wed, 21 Jul 2021 21:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DvZhP8r5FuS; Wed, 21 Jul 2021 21:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AA4B4020A;
	Wed, 21 Jul 2021 21:07:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3EE11BF5A9
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D01C0400F0
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 950L7-H9hzV5 for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:07:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4962400E1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 21:07:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9FCD2240002;
 Wed, 21 Jul 2021 21:07:07 +0000 (UTC)
Date: Wed, 21 Jul 2021 23:07:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210721230704.62b92bcd@windsurf>
In-Reply-To: <20210614204749.10693-1-ps.report@gmx.net>
References: <20210614204749.10693-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/4] package/libxmlrpc: bump version to
 1.51.07
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Mon, 14 Jun 2021 22:47:46 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Changelog ([1]):
> 
>   - Abyss: fix bug: wild memory reference when server times out waiting for
>     request header. Introduced with Release 1.44 (December 2015).
> 
> [1] http://xmlrpc-c.sourceforge.net/change_super_stable.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libxmlrpc/libxmlrpc.hash | 2 +-
>  package/libxmlrpc/libxmlrpc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I have applied the entire series, thanks. I must say the release model
of xmlrpc is extremely strange, with those ultra stable, stable and
advanced branches, the lack of tarballs, of tags, etc.

Obviously https://release-monitoring.org/project/9024/ cannot keep
track of that...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
