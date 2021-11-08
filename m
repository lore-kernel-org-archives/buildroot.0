Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96054C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 08:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59EC60E97
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 08:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E59EC60E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14C1B40204;
	Mon,  8 Nov 2021 08:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBkJqwnbikqM; Mon,  8 Nov 2021 08:47:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2903940278;
	Mon,  8 Nov 2021 08:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9D931BF393
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 08:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8D72606D5
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 08:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXs97hQmnCyR for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 08:47:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80179606CB
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 08:47:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id DBEA6100009;
 Mon,  8 Nov 2021 08:47:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mk0Iu-0001ny-Pj; Mon, 08 Nov 2021 09:47:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211106172956.9193-1-peter@korsgaard.com>
 <20211106172956.9193-2-peter@korsgaard.com>
Date: Mon, 08 Nov 2021 09:47:00 +0100
In-Reply-To: <20211106172956.9193-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 6 Nov 2021 18:29:55 +0100")
Message-ID: <87y25z6nln.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/nezha_defconfig: new
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
Cc: samuel@sholland.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add a defconfig for the Allwinner Nezha, a raspberrypi-style board built
 > around the RISC-V 64bit D1 SoC.

 > There is currently no upstream support, so use the git repos from Samuel
 > Holland as explained on the linux-sunxi wiki:

 > https://linux-sunxi.org/Allwinner_Nezha

 > The U-Boot DTB is also used by opensbi, but the two branches are
 > unfortunately not in sync at the moment, so add a patch to fix the
 > compatible for the PLIC so opensbi makes it available to S-Mode (Linux).

 > The use of the sun20i-d1-spl SPL bootloader / TOC1 file format also makes it
 > a bit more complicated to build the boot image.  As this is expected to only
 > be a temporary issue, add a U-Boot patch to build the TOC1 image as part of
 > the build rather than adding explicit support in our U-Boot package to do
 > it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  Changes since v1:
 >  - Use github macro/tarballs for linux/opensbi/u-boot
 >  - Use rootfs overlay for extlinux.conf
 >  - Use kilobytes (K) for offsets in genimage.cfg

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
