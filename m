Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F241C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E52EE60B18;
	Sun, 19 Jun 2022 12:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E52EE60B18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ED0wH97GF0mQ; Sun, 19 Jun 2022 12:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193BC60797;
	Sun, 19 Jun 2022 12:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193BC60797
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF01D1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B334095F
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7B334095F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id liOS8xLKpbIS for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A284094C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79A284094C
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:25:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E795240004;
 Sun, 19 Jun 2022 12:25:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o2u01-006E8d-2O; Sun, 19 Jun 2022 14:25:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220618121456.511183-1-fontaine.fabrice@gmail.com>
Date: Sun, 19 Jun 2022 14:25:53 +0200
In-Reply-To: <20220618121456.511183-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 18 Jun 2022 14:14:56 +0200")
Message-ID: <87y1xsu9f2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libeastl: needs threads
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libeastl needs threads since its addition in commit
 > ed9ddaafb2c4d3ac44e46390248f5c9af08076b1 and
 > https://github.com/electronicarts/EASTL/commit/800bc26659f834354e38ee3de4c7300e739ed255:

 > In file included from /home/autobuild/autobuild/instance-7/output-1/build/libeastl-45469730d641868ce05433fff2e199510c7d45c3/source/thread_support.cpp:7:
 > /home/autobuild/autobuild/instance-7/output-1/build/libeastl-45469730d641868ce05433fff2e199510c7d45c3/include/EASTL/internal/thread_support.h:37:18: fatal error: pthread.h: No such file or directory
 >    37 |         #include <pthread.h>
 >       |                  ^~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/54ff018467d157530bde4d35602fd1820d9eb348

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
