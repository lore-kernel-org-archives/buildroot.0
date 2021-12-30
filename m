Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0930CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD39409EE;
	Thu, 30 Dec 2021 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NphyXkGgm8av; Thu, 30 Dec 2021 20:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA6F410A9;
	Thu, 30 Dec 2021 20:43:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9571BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29FF840148
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nNB1D-RJZkEE for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03E5B409B1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:43:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id DC5DA200004;
 Thu, 30 Dec 2021 20:43:30 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:43:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211230214330.49b9748e@windsurf>
In-Reply-To: <fea2c015c08dedfcc7414dbaab261bf43c82f40b.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <fea2c015c08dedfcc7414dbaab261bf43c82f40b.1636810092.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 09/16 v2] support/utils: make-comma-list
 does just that, not quoting
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

On Sat, 13 Nov 2021 14:28:20 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Currently, we have two functions that build a comma-separated list
> of items; one is double-quoting the items, while the other is
> single-quoting them. Their naming is not very consistent.
> 
> Besides, in a followup change, we will need to build a comma-separated
> list of items that are already double-quoted.
> 
> Introduce a macro that does just build a comma-separated list, and
> use that in the two other macros; rename the existing macro so the
> naming is consistent.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pkg-utils.mk  | 10 +++++-----
>  support/misc/utils.mk | 12 ++++++++----
>  2 files changed, 13 insertions(+), 9 deletions(-)

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
