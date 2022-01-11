Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E65C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79D9A408F0;
	Tue, 11 Jan 2022 20:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6lyEQMUtup53; Tue, 11 Jan 2022 20:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 795B5408EB;
	Tue, 11 Jan 2022 20:10:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79D2B1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 676EC41521
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jz0F2pG1Qctn for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:10:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7012241520
 for <buildroot@uclibc.org>; Tue, 11 Jan 2022 20:10:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8EC6AFF804;
 Tue, 11 Jan 2022 20:10:19 +0000 (UTC)
Date: Tue, 11 Jan 2022 21:10:18 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Grant Edwards <grant.b.edwards@gmail.com>
Message-ID: <20220111211018.4d236002@windsurf>
In-Reply-To: <srka7t$pu1$1@ciao.gmane.io>
References: <srka7t$pu1$1@ciao.gmane.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Diagnosing conflicts due to new Python version
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Grant,

On Tue, 11 Jan 2022 16:11:41 -0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> It seems that every time a new Python version is unmasks, it breaks
> things.
> 
> This time it's a python-exec version conflict that prevents emerge
> -u. FAICT, Python 3.10 requires python-exec 2.4.8, and some other
> package requires 2.4.6.
> 
> I've fixed things temporarily with:
> 
> package.use:
> 
>    */* PYTHON_TARGETS: -python3_10
>    */* PYTHON_SINGLE_TARGET -python3_10
> 
> package.mask:
> 
>    =dev-lang/python-3.10
> 
> No, at least I can continue to update the machine.

I am confused by your e-mail. It seems to be a Gentoo question, but you
sent it to the Buildroot mailing list.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
