Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7A2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 21:15:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0880761361
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 21:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0880761361
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C60EC407D4;
	Tue, 28 Sep 2021 21:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9wWV0XOyoYu; Tue, 28 Sep 2021 21:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D26841486;
	Tue, 28 Sep 2021 21:15:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 810991BF5DA
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 21:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71636407F5
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 21:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CkHebEk8f6QF for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 21:15:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0D1A407D4
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 21:15:04 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B1FDF60006;
 Tue, 28 Sep 2021 21:15:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mVKRK-0006wi-3X; Tue, 28 Sep 2021 23:15:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210917170031.324231-1-fontaine.fabrice@gmail.com>
Date: Tue, 28 Sep 2021 23:15:02 +0200
In-Reply-To: <20210917170031.324231-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 17 Sep 2021 19:00:31 +0200")
Message-ID: <87o88co10p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump to version
 4.4.26
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump contains a single change to fix the following build failure
 > with Microblaze raised since bump to version 4.4.25 in commit
 > a071bec0a0cd928443223132d47564c90bc64713:

 > lib/crypt-gensalt-static.c:33:1: error: symver is only supported on ELF platforms
 >    33 | SYMVER_crypt_gensalt;
 >       | ^~~~~~~~~~~~~~~~~~~~

 > Update hash of LICENSING due to new file being added with
 > https://github.com/besser82/libxcrypt/commit/4ab5f672eb6fb43c9bd83060ef48f90decd4989c

 > https://github.com/besser82/libxcrypt/blob/v4.4.26/NEWS

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4766bfce9813b7f321369ec45298d16cd6dc251a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
