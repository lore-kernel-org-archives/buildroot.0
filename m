Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31909C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 11:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8392440116;
	Thu,  3 Feb 2022 11:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0LpjFl2kEdd; Thu,  3 Feb 2022 11:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7821F40119;
	Thu,  3 Feb 2022 11:05:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25CE71BF20F
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 11:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2238E82849
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 11:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4rBuGxdDp1x for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 11:05:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A753D827C5
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 11:05:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F12052001A;
 Thu,  3 Feb 2022 11:05:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nFZvK-0001VM-Ax; Thu, 03 Feb 2022 12:05:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220201230845.888962-1-fontaine.fabrice@gmail.com>
Date: Thu, 03 Feb 2022 12:05:10 +0100
In-Reply-To: <20220201230845.888962-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Feb 2022 00:08:45 +0100")
Message-ID: <87sft0xlax.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libblockdev: fix build with
 libglib2 >= 2.69
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

 > Fix the following build failure raised since bump of libglib2 to version
 > 2.70 in commit 079923d5fabf4f887bb140808cb16067ca08b19b:

 > exec.c: In function 'bd_utils_exec_and_report_status_error':
 > exec.c:239:5: error: 'g_spawn_check_exit_status' is deprecated: Use 'g_spawn_check_wait_status' instead [-Werror=deprecated-declarations]
 >   239 |     if (!g_spawn_check_exit_status (exit_status, error)) {
 >       |     ^~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8f9ca895cb07014804130a7ccbcb758b1d519470

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks. Any specific reason to not just bump to the 2.26
version?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
