Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7402BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 09:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66EC60B55;
	Mon, 19 Dec 2022 09:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66EC60B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTZvJ8yknfOV; Mon, 19 Dec 2022 09:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB4560681;
	Mon, 19 Dec 2022 09:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB4560681
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 004AD1BF3D5
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 09:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCE7A60681
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 09:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE7A60681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6jk_OEzQ4Yp for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 09:12:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F91605A3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3F91605A3
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 09:12:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 76AF660009;
 Mon, 19 Dec 2022 09:12:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7CC2-006TXI-Bp; Mon, 19 Dec 2022 10:12:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Dugast <francois.dugast.foss@gmail.com>
References: <20221219085710.1163707-1-francois.dugast.foss@gmail.com>
Date: Mon, 19 Dec 2022 10:12:18 +0100
In-Reply-To: <20221219085710.1163707-1-francois.dugast.foss@gmail.com>
 (Francois Dugast's message of "Mon, 19 Dec 2022 09:57:10 +0100")
Message-ID: <87bknziwp9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] configs/visionfive2_defconfig: new
 defconfig
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

>>>>> "Francois" == Francois Dugast <francois.dugast.foss@gmail.com> writes:

 > Add a defconfig for the Starfive VisionFive2 board, a board built around the
 > Starfive JH7110 RISC-V 64bit SoC.

 > This board comes with functional lowlevel and U-Boot bootloaders in SPI
 > flash. The defconfig reuses these and only builds a (5.15 based) kernel and
 > rootfs.

 > The factory shipped U-Boot is hard coded to look at MMC partition 3.

 > Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>

> ---
 >  board/visionfive2/genimage.cfg                | 21 +++++++++++++
 >  .../overlay/boot/extlinux/extlinux.conf       |  4 +++
 >  board/visionfive2/readme.txt                  | 30 +++++++++++++++++++
 >  configs/visionfive2_defconfig                 | 18 +++++++++++
 >  4 files changed, 73 insertions(+)
 >  create mode 100644 board/visionfive2/genimage.cfg
 >  create mode 100644 board/visionfive2/overlay/boot/extlinux/extlinux.conf
 >  create mode 100644 board/visionfive2/readme.txt
 >  create mode 100644 configs/visionfive2_defconfig

Nice! You forgot to add yourself to DEVELOPERS, so I've fixed that and
committed.

Odd that you (or starfive) are using a 5.15 based kernel for the
visionfive2 when we use a 6.0 based on from the same location for
visionfive, but OK.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
