Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61227C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 083F4405CB;
	Thu, 30 Dec 2021 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LrQdLuHBnUOT; Thu, 30 Dec 2021 20:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CB53405C6;
	Thu, 30 Dec 2021 20:43:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 482D71BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45902409B1
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVm_lQB66ZRS for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:43:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3696D403ED
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:43:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5501F1BF208;
 Thu, 30 Dec 2021 20:43:24 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:43:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211230214323.478d539c@windsurf>
In-Reply-To: <661e87dcda8a33ae3aa6416cf37427165982f119.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <661e87dcda8a33ae3aa6416cf37427165982f119.1636810092.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 05/16 v2] package/pkg-python: do not set
 empty variables
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Nov 2021 14:28:16 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Similarly to what we just did for conditionally-set-empty variables,
> unconditionally setting empty variables serves no purpose in Makefiles,
> as unset variables are just expanded as empty...
> 
> Even though we have numerous python packages, the speed gain was not
> measurable, with delta much less than the noise.
> 
> Still, for consistency, we just do not set those variables.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-python.mk | 3 ---
>  1 file changed, 3 deletions(-)

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
