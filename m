Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB23C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FD6040A51;
	Wed, 26 Jan 2022 21:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyADZEfDTAdD; Wed, 26 Jan 2022 21:29:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 951A240A61;
	Wed, 26 Jan 2022 21:28:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 360101BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2458E416F5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wjclxw739uwK for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:28:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22518409F3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:28:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A31940005;
 Wed, 26 Jan 2022 21:28:27 +0000 (UTC)
Date: Wed, 26 Jan 2022 22:28:26 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220126222826.09444e06@windsurf>
In-Reply-To: <20220124072527.29954-1-christian@paral.in>
References: <20220124072527.29954-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/delve: support building as host
 package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Jan 2022 23:25:27 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Users may want to debug Go programs using dlv on the host machine.
> 
> Adds package host-delve and BR2_PACKAGE_HOST_DELVE.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in.host       | 1 +
>  package/delve/Config.in.host | 7 +++++++
>  package/delve/delve.mk       | 5 +++++
>  3 files changed, 13 insertions(+)
>  create mode 100644 package/delve/Config.in.host

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
