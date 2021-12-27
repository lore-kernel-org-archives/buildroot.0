Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E807CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C2E819B4;
	Mon, 27 Dec 2021 14:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghIIQLqRLtfO; Mon, 27 Dec 2021 14:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DB8E8193E;
	Mon, 27 Dec 2021 14:44:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95F861BF3ED
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84E6E60E53
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkBAlJl_FM2R for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:43:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 749A560586
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:43:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5531D60002;
 Mon, 27 Dec 2021 14:43:43 +0000 (UTC)
Date: Mon, 27 Dec 2021 15:43:42 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211227154342.2915e168@windsurf>
In-Reply-To: <20211219142035.6220-2-peter@korsgaard.com>
References: <20211219142035.6220-1-peter@korsgaard.com>
 <20211219142035.6220-2-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] board/*/genimage.cfg: use
 partition-table-type = "gpt" for genimage-15
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerome Burlats <gerome.burlats@smile.fr>, Michael Walle <michael@walle.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Dec 2021 15:20:33 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Genimage 15 deprecated the gpt option and now prints a warning when it is
> used:
> 
> INFO: hdimage(sdcard.img): The option 'gpt' is deprecated. Use 'partition-table-type' instead
> 
> So change the genimage configuration files to use that instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/aarch64-efi/genimage-efi.cfg                 | 2 +-
>  board/beaglev/genimage.cfg                         | 2 +-
>  board/friendlyarm/nanopc-t4/genimage.cfg           | 2 +-
>  board/friendlyarm/nanopi-m4/genimage.cfg           | 2 +-
>  board/kontron/smarc-sal28/genimage.cfg             | 2 +-
>  board/minnowboard/genimage.cfg                     | 2 +-
>  board/orangepi/orangepi-pc-plus/genimage.cfg       | 2 +-
>  board/orangepi/orangepi-r1/genimage.cfg            | 2 +-
>  board/orangepi/orangepi-rk3399/genimage.cfg        | 2 +-
>  board/orangepi/orangepi-zero-plus2/genimage.cfg    | 2 +-
>  board/pc/genimage-efi.cfg                          | 2 +-
>  board/pine64/rockpro64/genimage.cfg                | 2 +-
>  board/qemu/aarch64-sbsa/genimage.cfg               | 2 +-
>  board/radxa/rockpi-4/genimage.cfg                  | 2 +-
>  board/radxa/rockpi-n10/genimage.cfg                | 2 +-
>  board/radxa/rockpi-n8/genimage.cfg                 | 2 +-
>  board/sifive/hifive-unleashed/genimage_sdcard.cfg  | 2 +-
>  board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 2 +-
>  18 files changed, 18 insertions(+), 18 deletions(-)

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
