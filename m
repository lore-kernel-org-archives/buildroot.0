Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4F6C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 11:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B64408D3;
	Tue, 13 Sep 2022 11:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B64408D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2H-uytTf0f0g; Tue, 13 Sep 2022 11:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FA5408BE;
	Tue, 13 Sep 2022 11:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FA5408BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 406C01BF316
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 11:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27756408BB
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 11:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27756408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9xNkyI6r4Zk for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 11:48:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD72408A0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CD72408A0
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 11:48:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D2F9E0006;
 Tue, 13 Sep 2022 11:48:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oY4PF-003K9H-Tt; Tue, 13 Sep 2022 13:48:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220728205852.BF1CD8681C@busybox.osuosl.org>
Date: Tue, 13 Sep 2022 13:48:45 +0200
In-Reply-To: <20220728205852.BF1CD8681C@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Thu, 28 Jul 2022 23:05:23 +0200")
Message-ID: <87y1unv6jm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] boot, package, support,
 toolchain: switch to 2 spaces for the hash file
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

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=ebe5d9edfe8d07eafd7b61c4f77ce509bb98a0ad
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > It's time to finally switch over globally to the new spacing format
 > that we have agreed on for the hash file, with 2 spaces as a separator
 > between fields.

 > This commit was mechanically generated using:

 > find . -type f -name '*.hash' | xargs sed -i 's%^md5[ \t]*\([^ \t]*\)[
 > \t]*\(.*\)$%md5 \1 \2%'
 > find . -type f -name '*.hash' | xargs sed -i 's%^sha1[ \t]*\([^
 > \t]*\)[ \t]*\(.*\)$%sha1 \1 \2%'
 > find . -type f -name '*.hash' | xargs sed -i 's%^sha256[ \t]*\([^
 > \t]*\)[ \t]*\(.*\)$%sha256 \1 \2%'
 > find . -type f -name '*.hash' | xargs sed -i 's%^sha512[ \t]*\([^
 > \t]*\)[ \t]*\(.*\)$%sha512 \1 \2%'

 > This commit can easily be backported on the LTS branch by re-running
 > the same commands, if needed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed (regenerated) to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
