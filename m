Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF51C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 21:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F29840823;
	Fri, 24 May 2024 21:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id la4xhcTGwfH6; Fri, 24 May 2024 21:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 251814082B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 251814082B;
	Fri, 24 May 2024 21:12:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92F551BF46A
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CC2F60620
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2G5opVR1iTu7 for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 21:12:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D83760646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D83760646
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D83760646
 for <buildroot@buildroot.org>; Fri, 24 May 2024 21:12:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C46760002;
 Fri, 24 May 2024 21:12:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAcCp-00GhyT-27;
 Fri, 24 May 2024 23:12:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240524190137.10761-1-ju.o@free.fr>
Date: Fri, 24 May 2024 23:12:03 +0200
In-Reply-To: <20240524190137.10761-1-ju.o@free.fr> (Julien Olivain's message
 of "Fri, 24 May 2024 21:01:37 +0200")
Message-ID: <87bk4ukj8c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/mx51evk: bump bsp components to
 fix build
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Since commit dc0f721 "package/gcc: switch to 13.x as default",
 > mx51evk_defconfig is failing to build in Kernel (see [1]),
 > with output:

 >     drivers/ata/libahci.c: In function 'ahci_led_store':
 >     ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_328' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
 >       315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
 >           |                                             ^

 > This commit fixes the issue by bumping the bsp components:
 > - u-boot to v2024.04
 > - kernel to v6.6.31

 > The Kernel DTS name is updated to reflect upstream reorganization.

 > The kernel commit fixing the build failure is [2], first included in
 > v6.2. There is many other gcc-13 fixes.

 > While bumping components, this commit also enables
 > BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, add the relevant archive hash files,
 > and removes the defconfig entry in ".checkpackageignore".

 > Fixes: [1]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688967
 > [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f07788079f515ca4a681c5f595bdad19cfbd7b1d

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Note: I did not tested the generated image on an actual board
 > (I don't have access to it).

Then maybe it would be safer to just bump to 5.10.217 (the gcc13 issue
has been backported as of 5.10.184)?

You don't mention why you are bumping U-Boot, maybe it is to fix the
compatibility issue with python-setuptools v69 (E.G. see commit
2e349be94a87db05d07d37bd44a923581bca43f3)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
