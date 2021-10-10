Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646B2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 10:11:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07DA460F92
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 10:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07DA460F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB5C7607AE;
	Sun, 10 Oct 2021 10:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IY4fBgbeiksq; Sun, 10 Oct 2021 10:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E3BA6083C;
	Sun, 10 Oct 2021 10:11:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21ED61BF473
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 10:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10DD6607AE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 10:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVLLlrZ6awFc for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 10:11:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1F2F607A6
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:11:41 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7C015100002;
 Sun, 10 Oct 2021 10:11:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mZVnt-0003EK-Ds; Sun, 10 Oct 2021 12:11:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <20211009094144.130161-1-troglobit@gmail.com>
 <877dels2p4.fsf@dell.be.48ers.dk>
 <43da32e2-6d83-ab1b-4b8e-1aa287e0e699@gmail.com>
Date: Sun, 10 Oct 2021 12:11:37 +0200
In-Reply-To: <43da32e2-6d83-ab1b-4b8e-1aa287e0e699@gmail.com> (Joachim
 Wiberg's message of "Sun, 10 Oct 2021 10:52:49 +0200")
Message-ID: <87o87xqjdy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libuev: bump version to v2.4.0
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

Hi,

 >> This presumably also affect musl, which moved to 64 bit time_t back in
 >> 1.2.0. I don't see any autobuilder issues related to older libuev
 >> versions (or uredir, as it probably only triggers when a dependency
 >> tries to link with it)?

 > The change is only related to GLIBC, which from v2.34 requires an
 > additional build flag to enable 64-bit time_t.  The latest libuev
 > release adds the following to the .pc file (and it's test suite):

 >     -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64

Ahh ok. We already globally set _FILE_OFFSET_BITS in
package/Makefile.in.

 > I don't think musl needs anything other than recompiling from source,
 > which we do already.  At least from what I can see from this page:

 >     https://musl.libc.org/time64.html

Correct.

 >> What about uclibc-ng, which still uses 32bit time_t?

 > Absolute time in a future after 2038 on systems with 32-bit time_t is
 > pretty much undefined.  Fortunately, most common use-cases with libuev
 > involves periodic or oneshot (monotonic) timers that are relative to
 > their individual start, which as far as I know are not affected.

Yes, indeed.

Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
