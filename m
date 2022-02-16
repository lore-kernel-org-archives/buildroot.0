Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED25C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A4641773;
	Wed, 16 Feb 2022 20:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J12xTvF5JIH0; Wed, 16 Feb 2022 20:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE09741629;
	Wed, 16 Feb 2022 20:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47A691BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35C3D8142C
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqtabR7CCMwU for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:40:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3ECFE81425
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:40:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6BBCC0002;
 Wed, 16 Feb 2022 20:40:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nKR5y-0005BQ-21; Wed, 16 Feb 2022 21:40:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <20220128084244.2258811-1-troglobit@gmail.com>
Date: Wed, 16 Feb 2022 21:40:14 +0100
In-Reply-To: <20220128084244.2258811-1-troglobit@gmail.com> (Joachim Wiberg's
 message of "Fri, 28 Jan 2022 09:42:44 +0100")
Message-ID: <87y22ah7f5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: backport fix for gdbserver
 11.1 on aarch64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

 > Backported from upstream GDB geb79b23, with ChangeLogs stripped so the
 > patch applies properly on Buildroot.

 >     https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=eb79b23

 > Fixes the following issue:

 >     # gdbserver /dev/hvc1 inadyn -n -l debug
 >     Process inadyn created; pid = 675
 >     Remote debugging using /dev/hvc1
 >     ../../gdbserver/regcache.cc:257: A problem internal to GDBserver has been detected.
 >     Unknown register tag_ctl requested

 > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
