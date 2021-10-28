Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FD4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 06:30:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75CD861056
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 06:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75CD861056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CFC960756;
	Thu, 28 Oct 2021 06:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2Qxn-4mHAl5; Thu, 28 Oct 2021 06:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 787B66070C;
	Thu, 28 Oct 2021 06:30:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCF91BF350
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 06:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48ACA6070C
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 06:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QK7FzEcaZ9_n for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 06:30:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EB9660682
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 06:30:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7C5C924000C;
 Thu, 28 Oct 2021 06:30:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mfyvu-00045I-AG; Thu, 28 Oct 2021 08:30:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-3-damien.lemoal@wdc.com>
 <87pmrqpozj.fsf@dell.be.48ers.dk>
 <DM6PR04MB70817379327091C5013D0517E7869@DM6PR04MB7081.namprd04.prod.outlook.com>
Date: Thu, 28 Oct 2021 08:30:38 +0200
In-Reply-To: <DM6PR04MB70817379327091C5013D0517E7869@DM6PR04MB7081.namprd04.prod.outlook.com>
 (Damien Le Moal's message of "Thu, 28 Oct 2021 00:35:03 +0000")
Message-ID: <874k91psoh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 02/10] package/elf2flt: add RISC-V
 64-bits support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Damien" == Damien Le Moal <Damien.LeMoal@wdc.com> writes:

Hi,

 >> > This patch is based on initial work by Christoph Hellwig <hch@lst.de>.
 >> 
 >> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
 >> 
 >> Committed, thanks.

 > Thanks. However, I may have sent this prematurely: I received additional
 > comments on the elf2flt pull request that I need to address. I can send an
 > incremental fix or you can revert this patch and the following and send an
 > updated series ?

If it is only about this one patch, then just sending an incremental
patch is fine by me.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
