Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F25C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 12:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 104E4415C6;
	Tue,  7 Jun 2022 12:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPbNyrM23PNt; Tue,  7 Jun 2022 12:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 040C0409E9;
	Tue,  7 Jun 2022 12:23:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6463C1BF33A
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 538B560F30
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pPcrl3BUJDj for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 12:23:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9020B60BE8
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 12:23:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5462540002;
 Tue,  7 Jun 2022 12:23:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyYEp-0002Dl-JO; Tue, 07 Jun 2022 14:23:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220531194615.468956-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Jun 2022 14:23:11 +0200
In-Reply-To: <20220531194615.468956-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 31 May 2022 21:46:15 +0200")
Message-ID: <87tu8wwtlc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc: fix build
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump to version 1.5 in
 > commit 41bbe8df540e2c630ad04f8db7383a7e7705f368 and
 > https://github.com/rauc/rauc/commit/be55282d71d967dcc0cf48303f8245cbc8fff053:

 > In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
 >                  from src/verity_hash.c:26:
 > src/verity_hash.c: In function 'verify_zero':
 > src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
 >    69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
 >       |                                                       ^~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
