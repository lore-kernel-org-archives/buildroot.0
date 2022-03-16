Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74872C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 07:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B6941740;
	Wed, 16 Mar 2022 07:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g6OoeOWgddwc; Wed, 16 Mar 2022 07:14:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D8824171E;
	Wed, 16 Mar 2022 07:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D80C1BF409
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A8C684176
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mAE1TklnGKFZ for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 07:14:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E68A58416B
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 07:14:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B6DF20005;
 Wed, 16 Mar 2022 07:14:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUNro-00C0qh-Ij; Wed, 16 Mar 2022 08:14:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220213220116.144141-1-thomas.petazzoni@bootlin.com>
Date: Wed, 16 Mar 2022 08:14:44 +0100
In-Reply-To: <20220213220116.144141-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 13 Feb 2022 23:01:15
 +0100")
Message-ID: <87y21atlln.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gdb: bump 11.x version to 11.2
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

 > This is a minor corrective release over GDB 11.1, fixing the following issues:
 >   PR sim/28302 (gdb fails to build with glibc 2.34)
 >   PR build/28318 (std::thread support configure check does not use
 >   CXX_DIALECT)
 >   PR gdb/28405 (arm-none-eabi: internal-error: ptid_t
 >   remote_target::select_thread_for_ambiguous_stop_reply(const
 >   target_waitstatus*): Assertion `first_resumed_thread != nullptr'
 >   failed)
 >   PR tui/28483 ([gdb/tui] breakpoint creation not displayed)
 >   PR build/28555 (uclibc compile failure since commit 4655f8509fd44e6efabefa373650d9982ff37fd6)
 >   PR rust/28637 (Rust characters will be encoded using DW_ATE_UTF)
 >   PR gdb/28758 (GDB 11 doesn't work correctly on binaries with a SHT_RELR (.relr.dyn) section)
 >   PR gdb/28785 (Support SHT_RELR (.relr.dyn) section)

 > Drop patch 0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch, which was
 > merged upstream as commit 17d6f2152b583cdc7defafa7813b727a304bac5b.

 > Drop patch 0008-Fix-build-on-rhES5.patch, which was merged upstream as
 > commit df9ebc472a162306dee8ba6e02b99963c2babb7c?

 > Drop patch 0009-gdbserver-aarch64-support.patch, which was merged
 > upstream as commit eb79b2318066cafb75ffdce310e3bbd44f7c79e3.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
