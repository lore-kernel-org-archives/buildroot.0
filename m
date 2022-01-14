Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE448C4321E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9089B60A9D;
	Fri, 14 Jan 2022 16:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROaVIXtHKu6m; Fri, 14 Jan 2022 16:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E6160B1C;
	Fri, 14 Jan 2022 16:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 752251BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6334D84B7F
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSZUKjGSpmCr for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:40:59 +0000 (UTC)
X-Greylist: delayed 00:42:58 by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 460E984B77
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:40:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0A0761C000E;
 Fri, 14 Jan 2022 16:40:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8PdI-0001A0-7P; Fri, 14 Jan 2022 17:40:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20211211204815.0159982964@busybox.osuosl.org>
Date: Fri, 14 Jan 2022 17:40:56 +0100
In-Reply-To: <20211211204815.0159982964@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sat, 11 Dec 2021 21:35:19 +0100")
Message-ID: <874k666zjb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] support/scripts/pkg-stats: Don't print
 directory in 'make' call
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=c988867fd2c72fe5abeb63c4abe92f10eea6499d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > It is possible that some users of buildroot have put it in a repository
 > and call into it from another Makefile such as:
 > .DEFAULT:
 > 	$(MAKE) O=$(abspath $(O)) -C buildroot $(@)

 > This technique works well except that Make tells us that it changes into
 > the buildroot directory:
 > make[1]: Entering directory 'buildroot'

 > Because this line doesn't have an equals within it, python raises a
 > ValueError exception within pkg-stats.

 > This patch has python tell the invoked make not to print directories

 > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
