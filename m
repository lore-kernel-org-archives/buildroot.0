Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE14C4167B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 13:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA2F81EE3;
	Wed, 21 Dec 2022 13:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA2F81EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wib2DCORbdxI; Wed, 21 Dec 2022 13:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDF1281FEE;
	Wed, 21 Dec 2022 13:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDF1281FEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9E71BF284
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 13:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2838D81FEE
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 13:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2838D81FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HY0SwCSyOMyF for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 13:10:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF88E81EE3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF88E81EE3
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 13:10:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D94BE240011;
 Wed, 21 Dec 2022 13:10:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7yrI-000XAB-PO; Wed, 21 Dec 2022 14:10:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221208202721.5592-1-fontaine.fabrice@gmail.com>
Date: Wed, 21 Dec 2022 14:10:08 +0100
In-Reply-To: <20221208202721.5592-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 8 Dec 2022 21:27:21 +0100")
Message-ID: <87sfh8rjgv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lttng-tools: bump to version
 2.13.8
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure without NPTL thanks to
 > https://github.com/lttng/lttng-tools/commit/27f2b8400c9db484cd195c4240c379e845b1413d
 > which is raised since bump to version 2.13.2 in commit
 > 8e5f2d0f8e8c04e98f8761f3cba683c56bbefc8c and
 > https://github.com/lttng/lttng-tools/commit/014d7d3b5e9d69989bf776cffb6c21ff7e1d36ff:

 > In file included from thread.c:10:
 > ../../src/common/compat/pthread.h: In function 'lttng_pthread_setname_np':
 > ../../src/common/compat/pthread.h:63:27: error: 'LTTNG_UST_ABI_PROCNAME_LEN' undeclared (first use in this function)
 >    63 |         if (strnlen(name, LTTNG_UST_ABI_PROCNAME_LEN) >= LTTNG_UST_ABI_PROCNAME_LEN) {
 >       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~

 > https://github.com/lttng/lttng-tools/blob/v2.13.8/ChangeLog

 > Fixes:
 >  - http://autobuild.buildroot.org/results/bbc8d6621822bb5da7513331e69799ca25a03f66

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
