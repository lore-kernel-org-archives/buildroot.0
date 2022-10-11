Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59267C433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 19:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED55F61053;
	Tue, 11 Oct 2022 19:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED55F61053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNOTshN9ttwi; Tue, 11 Oct 2022 19:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EEEF61023;
	Tue, 11 Oct 2022 19:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EEEF61023
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F07191BF855
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 19:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC44961023
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 19:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC44961023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMW9ICGLjLkB for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 19:19:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBBB560F91
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBBB560F91
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 19:19:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49D59240005;
 Tue, 11 Oct 2022 19:19:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oiKnB-00CAlS-8C; Tue, 11 Oct 2022 21:19:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
 <20220925171932.1630739-2-thomas.petazzoni@bootlin.com>
Date: Tue, 11 Oct 2022 21:19:53 +0200
In-Reply-To: <20220925171932.1630739-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 25 Sep 2022 19:19:30
 +0200")
Message-ID: <8735bup3qe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4] package/nodejs: bump to v16.17.1
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > This is currently the latest version in the v16.x branch.
 > Patch 0001-add-qemu-wrapper-support.patch needs some minor adaptations
 > to resolve conflicts with other unrelated upstream changes. The other
 > patches are simply refreshed.

 > The license file is updates due to:

 >  - Reformatting changes

 >  - Addition of the mention of some files being under GPLv3, but it's
 >    only the autoconf machinery: aclocal.m4 and config.guess, so it's
 >    not relevant to add in our LICENSE variable.

 >  - Addition of the mention of another file being under the MIT
 >    license (install-sh), and MIT is already listed, and this file is
 >    anyway only part of the autoconf machinery.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
