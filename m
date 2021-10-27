Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFD0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:38:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB9960C51
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EB9960C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00C20402D5;
	Wed, 27 Oct 2021 13:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqhvTT__5CRA; Wed, 27 Oct 2021 13:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D54A40236;
	Wed, 27 Oct 2021 13:38:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C78FD1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7A1040515
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gwwJBfjN8Ml for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 13:38:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D466D40511
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:38:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 74AD7100004;
 Wed, 27 Oct 2021 13:38:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mfj8F-0000wr-KU; Wed, 27 Oct 2021 15:38:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-4-damien.lemoal@wdc.com>
Date: Wed, 27 Oct 2021 15:38:19 +0200
In-Reply-To: <20211026071728.954356-4-damien.lemoal@wdc.com> (Damien Le Moal's
 message of "Tue, 26 Oct 2021 16:17:21 +0900")
Message-ID: <87lf2epoz8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 03/10] package/Makefile.in: Fix NOMMU
 RISC-V 64-bits toolchain base name
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

>>>>> "Damien" == Damien Le Moal <damien.lemoal@wdc.com> writes:

 > From: Christoph Hellwig <hch@lst.de>
 > Using *-uclinux-* seems like an only partially followed convention.
 > And at least RISC-V 64-bits gcc does not know about uclinux tuples.
 > So switch back to the normal "linux" one for now.

 > Signed-off-by: Christoph Hellwig <hch@lst.de>

 > [Damien]
 > * Make the change conditional on BR2_RISCV_64 being "y".

 > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
