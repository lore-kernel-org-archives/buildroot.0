Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7C8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:15:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F24FC610F9
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F24FC610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E8C40287;
	Tue, 14 Sep 2021 18:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKdTudLf32qt; Tue, 14 Sep 2021 18:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE20A40225;
	Tue, 14 Sep 2021 18:15:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C45611BF59A
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53AFC80D8E
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkSljc74Y9bL for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 18:09:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F42B80B9A
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:53 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 21F88C0004
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQCsQ-0007S8-Js
 for buildroot@buildroot.org; Tue, 14 Sep 2021 20:09:50 +0200
Resent-To: buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 14 Sep 2021 20:09:50 +0200
Resent-Message-ID: <874kanyqoh.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Sep 13 20:06:57 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210911214035.961528-1-fontaine.fabrice@gmail.com>
Date: Mon, 13 Sep 2021 20:06:57 +0200
In-Reply-To: <20210911214035.961528-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 11 Sep 2021 23:40:35 +0200")
Message-ID: <87bl4wxsce.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk: needs host gcc >= 4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > openjdk needs host gcc >= 4.9 since bump to version 16.0.1+9 in commit
 > 057e27029c9811ba8cc4922e30cc3878bed98807 and
 > https://github.com/openjdk/jdk/commit/2a8f92e7e71f7c1ed4010fa31f4b413758c8752a:

 > configure: Using gcc BuildC compiler version 4.8.5 [cc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)]
 > configure: Using gcc BuildC++ compiler version 4.8.5 [g++ (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)]
 > configure: Using gcc build linker version 2.27 [GNU ld version 2.27-44.base.el7]

 > [...]

 > g++: error: unrecognized command line option '-std=c++14'

 > Add this new dependency to all openjdk versions including version 11 as
 > most of the users will have host gcc >= 4.9

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7072308d148ccb8237180729551df65c87a76f11

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
