Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659BFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 21:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B0680DE2;
	Sun, 21 Nov 2021 21:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZ8hpgsL7BLs; Sun, 21 Nov 2021 21:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADF380D6F;
	Sun, 21 Nov 2021 21:29:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FAFC1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FB4D80BCB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUE05lOx-wwp for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 21:28:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E14D580BC2
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 21:28:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 041EF40004;
 Sun, 21 Nov 2021 21:28:45 +0000 (UTC)
Date: Sun, 21 Nov 2021 22:28:45 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211121222845.6f93983e@windsurf>
In-Reply-To: <20211116180041.1047747-1-yann.morin.1998@free.fr>
References: <20211116180041.1047747-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/uboot: kconfig needs the toolchain
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

On Tue, 16 Nov 2021 19:00:41 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Starting with uboot 2021.10, with upstream commit 473fc279c89 (kconfig /
> kbuild: Re-sync with Linux 4.20), the kconfig in uboot now needs the
> compiler to detect its features.
> 
> Like was done for linux in 3fc990a7983 (linux: kconfig needs the
> toolchain) and barebox in 1c1a629d814 (boot/barebox: kconfig needs the
> toolchain), add the toolchain to the kconfig dependencies of uboot.
> 
> Reported-by: Davian on IRC
> Reported-by: Xogium on IRC
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  boot/uboot/uboot.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
