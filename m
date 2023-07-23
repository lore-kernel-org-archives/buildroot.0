Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E8DC001DF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 16:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6523960BB3;
	Sun, 23 Jul 2023 16:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6523960BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9-rIMQaA0Ea; Sun, 23 Jul 2023 16:25:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82CE60BA1;
	Sun, 23 Jul 2023 16:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82CE60BA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A97A1BF345
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 16:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233CE409A5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 16:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233CE409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuY4KOm5D9XD for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 16:25:11 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FF8040997
 for <buildroot@uclibc.org>; Sun, 23 Jul 2023 16:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF8040997
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qNbtN-0008O1-6f
 for buildroot@uclibc.org; Sun, 23 Jul 2023 18:25:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 23 Jul 2023 18:24:58 +0200
Message-ID: <pan$58f88$61abb096$1792a0c5$f6b1dd6d@ID-313208.user.individual.net>
References: <20230723074303.603364-1-bernd@kuhls.net>
 <20230723152533.GH2503916__38229.4022989058$1690125967$gmane$org@scaer>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/piglit: bump version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Am Sun, 23 Jul 2023 17:25:33 +0200 schrieb Yann E. MORIN:

> It is not unknown. A bit of searhing around turns up:

at least it was unknown for me ;) Thanks for the insight.

> Yet...
> 
>> as it seems unrelated to the piglit version which was last bumped in
>> 2020 with commit 9061fd7bf6855431939bdace7e3091d4e1c48e53.
>> 
>> Fixes:
>> http://autobuild.buildroot.net/results/ed3/
ed3c5806458efdb9db78732d3709e1d6ec441bcb/
> 
> This build failure is from 2022-10-04, almost a year ago now. Since
> then, we haven't had such a failure again...
> 
[...]
> Do you have a defconfig that still exhibit the issue?

Yes, the one from the autobuilder error mentioned above. A couple of 
minutes ago I could reproduce the build error with that defconfig.

> Do you know why the autobuilders no longer report that issue?

Just guessing: The dependencies of piglit are so complicated (waffle + glx 
& co.) that random defconfigs seldomly produce a defconfig with piglit 
enabled, especially since https://git.busybox.net/buildroot/commit/utils/
genrandconfig?id=0e64537917a5b27565b8c479fda83508a6da7b86

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
