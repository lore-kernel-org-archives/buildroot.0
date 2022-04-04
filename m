Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F450C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E675240327;
	Mon,  4 Apr 2022 19:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PITuuhudFmY; Mon,  4 Apr 2022 19:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EFBD401B7;
	Mon,  4 Apr 2022 19:30:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD58C1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B2A1401B7
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3SjzaHBdaKOh for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:30:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 814ED401A3
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:30:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5FEA40007;
 Mon,  4 Apr 2022 19:30:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nbSPI-006cRO-Qv; Mon, 04 Apr 2022 21:30:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220403183503.736373-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Apr 2022 21:30:32 +0200
In-Reply-To: <20220403183503.736373-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Apr 2022 20:35:03 +0200")
Message-ID: <87ee2cy7c7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.5
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure with zlib-ng thanks to
 > https://github.com/zlib-ng/minizip-ng/commit/9184ba1216589077803b3e4e85f2b226f861ab2d:

 > /home/autobuild/autobuild/instance-10/output-1/build/minizip-3.0.4/mz_crypt.c:19:14: fatal error: zlib-ng.h: No such file or directory
 >    19 | #    include "zlib-ng.h"
 >       |              ^~~~~~~~~~~

 > https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.5

 > Fixes:
 >  - http://autobuild.buildroot.org/results/530fee780557941356dcd6aabb8cc9eb048574f3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
