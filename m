Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD92AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 22:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A441409D0;
	Wed, 29 Dec 2021 22:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LQYUTPukRjF; Wed, 29 Dec 2021 22:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB78409D3;
	Wed, 29 Dec 2021 22:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2093D1BF30B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DCF281B01
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4n1kh_Ul6uN for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 22:54:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE195813C5
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 22:54:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 83931240005;
 Wed, 29 Dec 2021 22:54:29 +0000 (UTC)
Date: Wed, 29 Dec 2021 23:54:28 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20211229235428.6e3c525f@windsurf>
In-Reply-To: <20211229204036.705008-1-festevam@gmail.com>
References: <20211229204036.705008-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/imx6ulpico: Bump U-Boot and kernel
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

On Wed, 29 Dec 2021 17:40:36 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Current U-Boot is an old version and fails to build:
> 
> /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
> 
> Bump U-Boot to fix the problem.
> 
> Latest U-Boot has switched to distro boot and SPL, so make the necessary
> changes to support it. Other advantage of bumping U-Boot is that
> it also supports the other imx6ul-pico variants.
> 
> While at it, also bump U-Boot to the 5.15 LTS.
> 
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006192
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../rootfs_overlay/boot/extlinux/extlinux.conf   |  4 ++++
>  configs/imx6ulpico_defconfig                     | 16 ++++++++++------
>  2 files changed, 14 insertions(+), 6 deletions(-)
>  create mode 100644 board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf

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
