Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971DDC43334
	for <buildroot@archiver.kernel.org>; Thu,  7 Jul 2022 13:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB6141A6B;
	Thu,  7 Jul 2022 13:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB6141A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4imiKsI5pUv; Thu,  7 Jul 2022 13:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1707F41B48;
	Thu,  7 Jul 2022 13:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1707F41B48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8F741BF40E
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 13:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A31CA41B3D
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 13:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31CA41B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EON0ZDQR4ioK for <buildroot@lists.busybox.net>;
 Thu,  7 Jul 2022 13:14:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 496FA41A24
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 496FA41A24
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 13:14:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC4EF1BF20A;
 Thu,  7 Jul 2022 13:14:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o9RKR-0008Xq-Qn; Thu, 07 Jul 2022 15:13:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220703093952.1300768-1-fontaine.fabrice@gmail.com>
Date: Thu, 07 Jul 2022 15:13:59 +0200
In-Reply-To: <20220703093952.1300768-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Jul 2022 11:39:52 +0200")
Message-ID: <87sfndoyjs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/erofs-utils: bump to version 1.5
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
Cc: Gao Xiang <hsiangkao@aol.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patches (already in version)
 > - liberofs is now released under GPL-2.0+ OR Apache-2.0 license:
 >   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=49b344c5531a7819f282b0b1b6eb01682c0e41ae
 > - This bump will fix the following build failure on or1k thanks to
 >   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=100cae2b98a70ac69ae7a09ed94f86ddf8c89fe2

 >   In file included from ../include/erofs/cache.h:11,
 >                    from cache.c:9:
 >   ../include/erofs/internal.h:34:2: error: #error incompatible PAGE_SIZE is already defined
 >      34 | #error incompatible PAGE_SIZE is already defined
 >         |  ^~~~~

 > https://lists.ozlabs.org/pipermail/linux-erofs/2022-June/006462.html

 > Fixes:
 >  - http://autobuild.buildroot.org/results/755f8d736b8ad96b213bb3975b26f1143e60e5b5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
