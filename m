Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C62C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE89960ACB;
	Sat, 15 Jan 2022 15:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cERtGGHoedAF; Sat, 15 Jan 2022 15:36:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F7960A8D;
	Sat, 15 Jan 2022 15:36:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7001BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48C7E40889
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0yKNAXklQ_3 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:36:04 +0000 (UTC)
X-Greylist: delayed 05:51:22 by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05E71403EC
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:36:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0887A100003;
 Sat, 15 Jan 2022 15:36:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8l60-00069W-2f; Sat, 15 Jan 2022 16:36:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20211216190423.2AEED821EB@busybox.osuosl.org>
Date: Sat, 15 Jan 2022 16:36:00 +0100
In-Reply-To: <20211216190423.2AEED821EB@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Thu, 16 Dec 2021 20:07:37 +0100")
Message-ID: <87ee592eqn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/python3: bump version to 3.9.9
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=ce81a6e6d2ee11b7cc23ad49252f5a696ab20299
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Drop 0030-Fix-cross-compiling-the-uuid-module.patch as the patched code has
 > been reworked upstream and python3 is built with --disable-uuid:

 > https://github.com/python/cpython/commit/91a51c5ffc3bd9da28a0000550530f6f2bcc25a2

 > Rework 0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch as
 > the MULTIARCH code is now conditional on !darwin:

 > https://github.com/python/cpython/commit/9901d153c201d852d27dc9d3074e283c26468f6d

 > Refresh and renumber remaining patches.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
