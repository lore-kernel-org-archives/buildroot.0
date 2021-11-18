Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33080C433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 12:22:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7643961548
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 12:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7643961548
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276BE403C6;
	Thu, 18 Nov 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVyLjWzGP6SC; Thu, 18 Nov 2021 12:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F656403C4;
	Thu, 18 Nov 2021 12:22:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2061BF383
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 12:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49DFA80E79
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 12:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2qG4ZijoRPR for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 12:22:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F137580C9B
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 12:22:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 62FB7240007;
 Thu, 18 Nov 2021 12:22:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mngQj-0004Kg-F9; Thu, 18 Nov 2021 13:22:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211117213348.231529-1-romain.naour@gmail.com>
 <87ee7drf65.fsf@dell.be.48ers.dk>
 <9880ded2-bde8-8321-9a61-d281be2db2ff@gmail.com>
Date: Thu, 18 Nov 2021 13:22:17 +0100
In-Reply-To: <9880ded2-bde8-8321-9a61-d281be2db2ff@gmail.com> (Romain Naour's
 message of "Thu, 18 Nov 2021 12:51:28 +0100")
Message-ID: <87a6i1r6va.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for-2021.08.x] support/docker: remove
 expired mozilla/DST_Root_CA_X3.crt
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 >> > https://stackoverflow.com/questions/69408776/how-to-force-older-debian-to-forget-about-dst-root-ca-x3-expiration-and-use-isrg
 >> 
 >> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 >> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 >> > ---
 >> > Backport this patch for 2021.08.x and 2021.02.x using buildroot/base:20200814.2228
 >> 
 >> How does this actually work? Who builds that container? Do we not need
 >> a corresponding update of .gitlab-ci.yml then?

 > Well, usually it's Arnout or Yann that build and push containers to dockerhub.
 > On master we recently switched to gitlab registry, so maintainers and developers
 > of Buildroot gitlab project can update containers.

 > The .gitlab-ci.yml is changed as soon as the container is rebuild using the
 > updated Dockerfile (after the commit of Dockerfile change).

Ok, so all manually.

 >> 2021-11-18 09:20:10 (16.5 MB/s) - 'aarch64--glibc--bleeding-edge-2020.08-1.tar.bz2' saved [127456563/127456563]
 >> 
 > Indeed but we may introduce some (unlikely) regression in the testsuite.

If there are regressions, then it would be better to handle them as
people might run into the same issues. Debian 9 is old, no matter if we
look at the 2017 snapshot or the last bugfix (2020), so I testing
against that might be the best solution?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
