Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B22C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 17:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D55FF61BB3;
	Mon, 25 Jul 2022 17:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D55FF61BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eDjUIsmeMjU; Mon, 25 Jul 2022 17:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1F361B9B;
	Mon, 25 Jul 2022 17:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F1F361B9B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7873C1BF396
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 396A440FBF
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 396A440FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6uOrL28XWpd for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 17:14:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E84F040CE5
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E84F040CE5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 17:14:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6F680240007;
 Mon, 25 Jul 2022 17:14:03 +0000 (UTC)
Date: Mon, 25 Jul 2022 19:14:02 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220725191402.7e3d90eb@windsurf>
In-Reply-To: <20210624125702.22106-1-heiko.thiery@gmail.com>
References: <20210624125702.22106-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658769244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nur41wIizsBYdYWdTM18UPke09NQUPZkwLaMCArhXKY=;
 b=HnJfyhf0xVvQuu+89ux6WClrnefgI9lr33lnOPaPxKOSgWNYIltTV2/ndpmORtutwTHAf9
 tyA/g6ub+0RJB9XEZhPNuOjipGCOlafkBFGycrEdtGCqigL1mPRCeDoFPiP4peMJ0f82y+
 FLae9vHgJWnhRT0610EhlTCvCh4zGEWL6HpgeknK+9ohaVi1RypwXUnyZ0+XiblNFZq47S
 wUJR2lQLk8m8FOPGhxlatK8TzXdjOgaqBPeyZizOQvuJ4ZaHrA09hPp27j1mvO7G1KvQoN
 Fb7AVFlyV253l3g4YfYruylznk0Txdjb9I9wTlploFXvTMsnDRgnqpili5h+nA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HnJfyhf0
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: add
 infra_coinfig to json_output
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
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Thu, 24 Jun 2021 14:57:03 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> When we use the statistics output to generate a CVE/CPE customer report
> showing whether a product is affected by CVEs, we are primarily interested
> in whether they are relevant to the target system. Currently we cannot see
> if the package is configured for the build (infra==host) and/or the
> target system (infra==target).
> 
> Therefore, in case of a given configuration, this information is also
> stored in the JSON output.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  support/scripts/pkg-stats | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

We finally had a look with Arnout. We didn't really like this new
self.infra_config field. So instead, what we decided is to use
the existing self.infras field.

When pkg-stats is run without a configuration (i.e without -c),
self.infras lists all infrastructures supported by the package, as it
is done today.

When pkg-stats is run with a configuration (i.e with -c), self.infras
now only lists the infrastructures that are *used* by the package in
the current configuration.

I reworked your code with this idea, and also changed the
implementation quite a bit. You can see the result at:

  https://git.buildroot.org/buildroot/commit/?id=28973f28acfcee81f2912e7a65dd3704b1d68f6f

When you have the chance, could you give it a test and let us know if
it works for you?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
