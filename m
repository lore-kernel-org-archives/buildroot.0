Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C538C6FA89
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 14:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3824403B8;
	Thu, 15 Sep 2022 14:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3824403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USV9ykJc2BSs; Thu, 15 Sep 2022 14:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC47E4037A;
	Thu, 15 Sep 2022 14:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC47E4037A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 840C61BF2FB
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA4160FAE
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA4160FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csmxY8l9mPGL for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 14:01:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C11560BC7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C11560BC7
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 14:01:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7CCB06001A;
 Thu, 15 Sep 2022 14:01:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYpQb-008Fdj-BL; Thu, 15 Sep 2022 16:01:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
 <20220811094049.798010-3-niklas.cassel@wdc.com>
 <87leqlm7an.fsf@dell.be.48ers.dk> <YyMKFfqtZDAdUS8O@x1-carbon>
Date: Thu, 15 Sep 2022 16:01:17 +0200
In-Reply-To: <YyMKFfqtZDAdUS8O@x1-carbon> (Niklas Cassel's message of "Thu, 15
 Sep 2022 11:18:47 +0000")
Message-ID: <875yholosy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/elf2flt: fix fatal error
 regression on m68k, xtensa, riscv64
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
Cc: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Niklas" == Niklas Cassel <Niklas.Cassel@wdc.com> writes:

Hi,

 >> Are 2022.02.x and 2022.05.x also affected?

 > Buildroot branches 2022.02.x and 2022.05.x both includes
 > the patch the upgrades elf2flt to 2021.08, so these branches
 > should also be affected.

Thanks for the feedback!

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
