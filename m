Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E81AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106DA40B15;
	Tue,  7 Jun 2022 14:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcR-ljLCVi9r; Tue,  7 Jun 2022 14:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3271A40AFE;
	Tue,  7 Jun 2022 14:03:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 294FD1BF360
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18E884157C
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSwIiFAwlarB for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:03:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E91B14095F
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:03:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4BA4860007;
 Tue,  7 Jun 2022 14:03:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyZno-0007nv-FX; Tue, 07 Jun 2022 16:03:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kory Maincent via buildroot <buildroot@buildroot.org>
References: <20220531084428.100082-1-kory.maincent@bootlin.com>
Date: Tue, 07 Jun 2022 16:03:24 +0200
In-Reply-To: <20220531084428.100082-1-kory.maincent@bootlin.com> (Kory
 Maincent via buildroot's message of "Tue, 31 May 2022 10:44:28 +0200")
Message-ID: <87v8tc605v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add -fno-PIE to
 CFLAGS
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
Cc: kory.maincent@bootlin.com, thomas.petazzoni@bootlin.com, geomatsi@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kory" == Kory Maincent via buildroot <buildroot@buildroot.org> writes:

 > From: Kory Maincent <kory.maincent@bootlin.com>
 > By default the toolchain-wrapper enable -fPIE to the build of all packages.
 > TF-A support Position Independent Executable(PIE) only in few build cases,
 > therefore it should be disable by default.
 > If you still want to enable PIE, TF-A provide a "ENABLE_PIE" build options
 > that will override the cflags for the supported cases.

 > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
