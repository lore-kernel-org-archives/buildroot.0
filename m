Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ED5EE3F31
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB01282020;
	Tue, 12 Sep 2023 21:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB01282020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAOzp4BnsPqP; Tue, 12 Sep 2023 21:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA7CD817A9;
	Tue, 12 Sep 2023 21:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA7CD817A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7DC01BF421
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEFCE404C4
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEFCE404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDkQve92JPQg for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:12:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78F3C4002B
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F3C4002B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26B121BF206;
 Tue, 12 Sep 2023 21:12:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgAgp-001u0C-Aq; Tue, 12 Sep 2023 23:12:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20230820091331.D46B185DAB@busybox.osuosl.org>
Date: Tue, 12 Sep 2023 23:12:55 +0200
In-Reply-To: <20230820091331.D46B185DAB@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 20 Aug 2023 11:05:36 +0200")
Message-ID: <87fs3j5c4o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/connman: security bump version
 to 1.42
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d5162e790d1cc2724caf6b918dbca00971c96ae9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The 1.42 version of connman comes with the following CVEs fixes :
 >  - CVE-2022-32292
 >  - CVE-2022-32293
 >  - CVE-2023-28488

 > The first two CVEs have been fixed wuth upstream patches [0] which we
 > carry since 2f2b4c80f44a (package/connman: fix CVE-2022-3229{2,3}), now
 > included in this version bump; the third CVE [2] is also fixed by this
 > version bump [3].

 > [0] https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d1a5ede5d255bde8ef707f8441b997563b9312bd
 >     https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=72343929836de80727a27d6744c869dff045757c
 >     https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=416bfaff988882c553c672e5bfc2d4f648d29e8a

 > [1] 2f2b4c80f4 package/connman: fix CVE-2022-3229{2,3}

 > [2] https://nvd.nist.gov/vuln/detail/CVE-2023-28488

 > [3] https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=99e2c16ea1cced34a5dc450d76287a1c3e762138

 > Signed-off-by: Clement Ramirez <ramirez.clement3@gmail.com>
 > [yann.morin.1998@free.fr:
 >   - squash CVE-2023-28488 backport with version bump
 >   - reword commit log
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
