Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CF4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6513961548
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6513961548
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22FD740554;
	Fri, 19 Nov 2021 17:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qLa0-38omv5; Fri, 19 Nov 2021 17:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4589B400F3;
	Fri, 19 Nov 2021 17:00:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 616A71BF232
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 509A481990
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvGFpAsz_sj8 for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 17:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FA988194A
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:00:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C3B78E0006
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:00:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mo7FM-0007YT-3t
 for buildroot@buildroot.org; Fri, 19 Nov 2021 18:00:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 18:00:20 +0100
Message-ID: <87v90oozbv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.11-rc2 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot 2021.11-rc2 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2021.11-rc2.tar.gz

or

http://buildroot.net/downloads/buildroot-2021.11-rc2.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Another 2 weeks, another release candidate.

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2021.11-rc1..

   104  Giulio Benetti
    42  Fabrice Fontaine
    13  Peter Korsgaard
     6  Romain Naour
     5  Bernd Kuhls
     3  James Hilliard
     3  Peter Seiderer
     3  Yann E. MORIN
     2  Baruch Siach
     2  Carlos Santos
     2  Pierre-Jean Texier
     1  Fabio Estevam
     1  Francois Perrad
     1  Joachim Wiberg
     1  John Keeping
     1  Thomas Petazzoni
     1  Titouan Christophe

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.11-rc2

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
