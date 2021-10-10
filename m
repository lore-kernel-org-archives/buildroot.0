Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBADC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 08:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A96A460F4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 08:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A96A460F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 694BF40282;
	Sun, 10 Oct 2021 08:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWOTWVsnHagg; Sun, 10 Oct 2021 08:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A04E440210;
	Sun, 10 Oct 2021 08:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86C081BF285
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 08:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 839204041C
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 08:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iIJ0GQ_epuDh for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 08:29:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 725B54041A
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 08:29:16 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E80F020003;
 Sun, 10 Oct 2021 08:29:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mZUCl-0000Gy-UE; Sun, 10 Oct 2021 10:29:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <20211009094144.130161-1-troglobit@gmail.com>
Date: Sun, 10 Oct 2021 10:29:11 +0200
In-Reply-To: <20211009094144.130161-1-troglobit@gmail.com> (Joachim Wiberg's
 message of "Sat, 9 Oct 2021 11:41:44 +0200")
Message-ID: <877dels2p4.fsf@dell.be.48ers.dk>
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

 > This update is critical for linking against GLIBC v2.34, due to the
 > changes related to 64-bit time_t on 32-bit systems.  See ChangeLog
 > for details:

 >   https://github.com/troglobit/libuev/releases/tag/v2.4.0

 > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

This presumably also affect musl, which moved to 64 bit time_t back in
1.2.0. I don't see any autobuilder issues related to older libuev
versions (or uredir, as it probably only triggers when a dependency
tries to link with it)?

What about uclibc-ng, which still uses 32bit time_t?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
