Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC4C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 12:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBF0540BD5;
	Wed, 10 Aug 2022 12:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBF0540BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gprDvDOCJPvq; Wed, 10 Aug 2022 12:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7FB940A6A;
	Wed, 10 Aug 2022 12:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7FB940A6A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D56941BF312
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B055382560
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B055382560
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6qTmWVToSxH for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 12:20:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A19E3823CF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A19E3823CF
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:20:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19C262000F;
 Wed, 10 Aug 2022 12:20:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oLkhU-002U70-Vu; Wed, 10 Aug 2022 14:20:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220712203151.1891202-1-fontaine.fabrice@gmail.com>
Date: Wed, 10 Aug 2022 14:20:40 +0200
In-Reply-To: <20220712203151.1891202-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 12 Jul 2022 22:31:51 +0200")
Message-ID: <87o7wsp9wn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gtest: drop host-gtest
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop host-gtest to avoid the following build failure raised since bump
 > to version 1.12.0 in commit a336b731af5979a25213b33c5840de6d1ed88bdc and
 > https://github.com/google/googletest/commit/6202251f0963187a7781f181365cf8c19bf343d5:

 > /usr/bin/install -D -m 0755
 > /home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py
 > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/gmock_gen
 > /usr/bin/install: cannot stat
 > '/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py':
 > No such file or directory

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6a8fb259760f84c67a3482cc5964c6610f9b70a4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Hmm, does this mean that host-gmock isn't built anymore or does the
target package now build it?


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
