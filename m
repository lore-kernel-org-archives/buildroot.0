Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D722ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A597740C20;
	Fri, 16 Sep 2022 21:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A597740C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g__D90fYSt2D; Fri, 16 Sep 2022 21:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDD2C408EC;
	Fri, 16 Sep 2022 21:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDD2C408EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD3F21BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B596740516
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B596740516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVJqv2fjzUqS for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:55:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C148640137
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C148640137
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:55:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61A52E0004;
 Fri, 16 Sep 2022 21:55:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZJJ6-008lzt-3W; Fri, 16 Sep 2022 23:55:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Markus Mayer via buildroot <buildroot@buildroot.org>
References: <20220809203505.3620840-1-mmayer@broadcom.com>
Date: Fri, 16 Sep 2022 23:55:32 +0200
In-Reply-To: <20220809203505.3620840-1-mmayer@broadcom.com> (Markus Mayer via
 buildroot's message of "Tue, 9 Aug 2022 13:35:05 -0700")
Message-ID: <87illn56i3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/linux-tools/linux-tool-perf.mk.in:
 Fix disabling of documentation
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Markus" == Markus Mayer via buildroot <buildroot@buildroot.org> writes:

 > We are trying to not build the perf documentation. However, the hook
 > being used to do so was named incorrectly. As a result, the build steps
 > to disable the documentation were never executed.

 > Rename the hook from
 >     LINUX_POST_PATCH_HOOKS
 > to
 >     LINUX_TOOLS_POST_PATCH_HOOKS
 > to fix the issue.

 > Fixes: 20b144666909 ("linux/tools: make it a real, separate package")
 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
