Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C294BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1648131C;
	Sun, 26 Dec 2021 22:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddCrAnvnkSir; Sun, 26 Dec 2021 22:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB7981301;
	Sun, 26 Dec 2021 22:42:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FFDF1BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D07281301
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8CVWgWEnEJ4 for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:42:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44DF9812EE
 for <buildroot@busybox.net>; Sun, 26 Dec 2021 22:42:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A7B4040006;
 Sun, 26 Dec 2021 22:42:30 +0000 (UTC)
Date: Sun, 26 Dec 2021 23:42:29 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211226234229.52fbd54e@windsurf>
In-Reply-To: <20211218090420.311210-1-francois.perrad@gadz.org>
References: <20211218090420.311210-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] board/olimex/stmp1_olinuxino: add
 STMP157-OLinuXino-LIME2 board support
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 18 Dec 2021 10:04:20 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> kernel & uboot come from Olimex forks
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/stmp1_olinuxino/genimage.cfg     |  25 ++++
>  board/olimex/stmp1_olinuxino/linux.config     | 125 ++++++++++++++++++
>  board/olimex/stmp1_olinuxino/readme.txt       |  53 ++++++++
>  .../boot/extlinux/extlinux.conf               |   4 +
>  .../olimex_stmp157_olinuxino_lime_defconfig   |  47 +++++++
>  5 files changed, 254 insertions(+)
>  create mode 100644 board/olimex/stmp1_olinuxino/genimage.cfg
>  create mode 100644 board/olimex/stmp1_olinuxino/linux.config
>  create mode 100644 board/olimex/stmp1_olinuxino/readme.txt
>  create mode 100644 board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
>  create mode 100644 configs/olimex_stmp157_olinuxino_lime_defconfig

You had forgotten to add entries in the DEVELOPERS, so I've done that
and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
