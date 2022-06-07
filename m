Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861EEC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A7982F19;
	Tue,  7 Jun 2022 15:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGtA07jhaOhT; Tue,  7 Jun 2022 15:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5161682D75;
	Tue,  7 Jun 2022 15:45:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B20401BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0EE740612
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joe6Y332YcSL for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:45:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8715C4060D
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:45:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 102241BF207;
 Tue,  7 Jun 2022 15:45:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nybOT-000Bfu-9S; Tue, 07 Jun 2022 17:45:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220530204716.3054785-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Jun 2022 17:45:21 +0200
In-Reply-To: <20220530204716.3054785-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 30 May 2022 22:47:15 +0200")
Message-ID: <87wnds4gvi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gtest: gmock needs host gcc >=
 4.9
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

 > gtest unconditionally uses is_trivially_copy_constructible since
 > version 1.11.0 and
 > https://github.com/google/googletest/commit/c13c27a513ecd1cbf5700a45fe590e85e8ae6770

 > So add a dependency on host gcc >= 4.9 for gmock to avoid the following
 > build failure since commit 9dfbbbb4105c47602da048c9bb9499fb8862e768:

 > In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/internal/gtest-death-test-internal.h:39:0,
 >                  from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-death-test.h:41,
 >                  from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest.h:64,
 >                  from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/src/gtest-all.cc:38:
 > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-matchers.h: In static member function 'static constexpr bool testing::internal::MatcherBase<T>::IsInlined()':
 > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-matchers.h:414:12: error: 'is_trivially_copy_constructible' is not a member of 'std'
 >             std::is_trivially_copy_constructible<M>::value &&
 >             ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9d19a47deb80824eaa718d80f14b0afd5f9eb054

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
