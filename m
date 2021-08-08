Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879AFC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:47:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC5BE60F25
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC5BE60F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DACE4016E;
	Sun,  8 Aug 2021 21:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K13xJI6Jim4E; Sun,  8 Aug 2021 21:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A76E4010F;
	Sun,  8 Aug 2021 21:47:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 374F51BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2789282C2E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szqlASvwCzmR for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:47:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D33782B24
 for <buildroot@busybox.net>; Sun,  8 Aug 2021 21:47:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AFC8920004;
 Sun,  8 Aug 2021 21:47:09 +0000 (UTC)
Date: Sun, 8 Aug 2021 23:47:08 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20210808234708.4a90f3b8@windsurf>
In-Reply-To: <20210807162202.154898-1-francois.perrad@gadz.org>
References: <20210807162202.154898-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Partial revert
 "configs/olimex_a20_olinuxino: switch to extlinux.conf"
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat,  7 Aug 2021 18:22:02 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Old scripts are still used by a10_olinuxino & a20_olinuxino_micro
> 
> Fixes olimex_a20_olinuxino_micro
> see https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738568
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a10_olinuxino/boot.cmd      | 6 +-----
>  board/olimex/a10_olinuxino/post-build.sh | 4 +---
>  board/olimex/a20_olinuxino/boot.cmd      | 5 +++++
>  board/olimex/a20_olinuxino/post-build.sh | 3 +++
>  4 files changed, 10 insertions(+), 8 deletions(-)
>  mode change 100644 => 120000 board/olimex/a10_olinuxino/boot.cmd
>  mode change 100755 => 120000 board/olimex/a10_olinuxino/post-build.sh
>  create mode 100644 board/olimex/a20_olinuxino/boot.cmd
>  create mode 100755 board/olimex/a20_olinuxino/post-build.sh

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
