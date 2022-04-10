Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B09FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 19:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1AA0415D1;
	Sun, 10 Apr 2022 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1SYptJTQ06O; Sun, 10 Apr 2022 19:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFDD4415C7;
	Sun, 10 Apr 2022 19:56:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD42A1BF338
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 19:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA7CE4014A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 19:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvVW0EfKLfBB for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 19:56:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58C4B40106
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 19:56:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E9995240007;
 Sun, 10 Apr 2022 19:56:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nddfK-005DTO-CP; Sun, 10 Apr 2022 21:56:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220404205015.341053-1-fontaine.fabrice@gmail.com>
Date: Sun, 10 Apr 2022 21:56:06 +0200
In-Reply-To: <20220404205015.341053-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Apr 2022 22:50:15 +0200")
Message-ID: <87ilrgogq1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/trace-cmd: needs NPTL
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > trace-cmd needs NPTL since bump to version 2.9.1 in commit
 > 0e1231a3c0719269ab3546defe4b1fb0f1f5d7d2 and
 > https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=08b9d5076455c93c997376c8089ee12b9071785b:

 > /nvmedata/autobuild/instance-24/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/10.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld:
 > /nvmedata/autobuild/instance-24/output-1/build/trace-cmd-2.9.7/lib/trace-cmd/libtracecmd.a(trace-timesync.o):
 > in function `tracecmd_tsync_with_host':
 > trace-timesync.c:(.text+0x12e1): undefined reference to `pthread_setaffinity_np'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9a88aaf92760b34958ef5b1708de83e46ccdb587

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
