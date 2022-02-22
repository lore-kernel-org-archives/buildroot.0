Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB31C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 16:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 671E760EEF;
	Tue, 22 Feb 2022 16:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wA91YQoVJxFI; Tue, 22 Feb 2022 16:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE7C60EC4;
	Tue, 22 Feb 2022 16:46:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C43F1BF3CB
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76C3160EC4
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cq5XJEOHhWfk for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 16:46:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6588D60C2C
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 16:46:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D63E3C000A;
 Tue, 22 Feb 2022 16:46:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nMYIt-006EQ1-QY; Tue, 22 Feb 2022 17:46:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20220208202150.3CF6A82B8F@busybox.osuosl.org>
Date: Tue, 22 Feb 2022 17:46:19 +0100
In-Reply-To: <20220208202150.3CF6A82B8F@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Tue, 8 Feb 2022 21:24:41 +0100")
Message-ID: <87czje7stg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] linux/linux.mk: correct
 LINUX_ARCH_PATH for sparc64
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0ecfdc093227c37ed1083e43404b748e8ee8a323
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Buildroot uses variable LINUX_ARCH_PATH to refer to the arch-specific
 > directory in the Linux tree, which may not necessarily be arch/$(KERNEL_ARCH).

 > Buildroot already accounts for the case of KERNEL_ARCH=i386 and
 > KERNEL_ARCH=x86_64, but does not for KERNEL_ARCH=sparc64, in which case the
 > correct directory is arch/sparc.

 > Reported-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
