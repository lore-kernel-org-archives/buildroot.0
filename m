Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7F2EEB596
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1EB141C62;
	Wed, 13 Sep 2023 07:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1EB141C62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fxr6_Goqfl8o; Wed, 13 Sep 2023 07:00:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD91241B47;
	Wed, 13 Sep 2023 07:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD91241B47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B29C61BF85D
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CEEC40156
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CEEC40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ydan9O78ib80 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 07:00:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E3884011F
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E3884011F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7131A20009;
 Wed, 13 Sep 2023 07:00:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgJqy-004oR5-It; Wed, 13 Sep 2023 09:00:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230820214028.0B1A385EF6@busybox.osuosl.org>
Date: Wed, 13 Sep 2023 09:00:00 +0200
In-Reply-To: <20230820214028.0B1A385EF6@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 20 Aug 2023 23:38:51 +0200")
Message-ID: <87wmwu4ky7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] configs/ci20_defconfig: bump to kernel
 5.4.254
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=486a3ba4c3a78668eee1dd4f4b312a75a1b029c5
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Bump the kernel to the latest release of 5.4 kernel series
 > to fix an issue with gcc 12.

 > arch/mips/jz4740/setup.c: In function 'plat_mem_setup':
 > arch/mips/jz4740/setup.c:64:25: error: comparison between two arrays [-Werror=array-compare]
 >    64 |         if (__dtb_start != __dtb_end)
 >       |                         ^~
 > arch/mips/jz4740/setup.c:64:25: note: use '&__dtb_start[0] != &__dtb_end[0]' to compare the addresses
 >   CC      fs/debugfs/file.o
 > cc1: all warnings being treated as errors

 > Fixed in v5.4.195:
 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a60def7568216684f62b117c199429c4a9a89570

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436573

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
