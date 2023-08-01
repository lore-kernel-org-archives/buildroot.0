Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA6C0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 22:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E03860E38;
	Tue,  1 Aug 2023 22:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E03860E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DM85kaXCgu2n; Tue,  1 Aug 2023 22:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAFEE60E2E;
	Tue,  1 Aug 2023 22:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAFEE60E2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0551BF476
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 22:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 566D880DC3
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 22:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566D880DC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7dnv0c-LsGM for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 22:02:12 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68D8880BF3
 for <buildroot@busybox.net>; Tue,  1 Aug 2023 22:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D8880BF3
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1qQxRR-000AB4-3Y
 for buildroot@busybox.net; Wed, 02 Aug 2023 00:02:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 02 Aug 2023 00:01:40 +0200
Message-ID: <pan$1dd5e$814e23a8$a2c81d3f$f6526f74@ID-313208.user.individual.net>
References: <20230730054316.D9D0E400FE__49774.3708708853$1690695823$gmane$org@smtp2.osuosl.org>
 <pan$23df6$8f2c97e9$80972a17$d2124f06@ID-313208.user.individual.net>
 <20230730225814.108f5fcf@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2023-07-29
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 30 Jul 2023 22:58:14 +0200 schrieb Thomas Petazzoni via buildroot:

> Problem is that commit 396a4e76afec30d2461638f569cae18955eb4ad2 is part
> the 12.3.0 tag, and there is no gcc release that contains this commit,
> which is probably why Fedora didn't pick it up.

Hi Thomas,

ccache added a fix for the problem, please test:
https://patchwork.ozlabs.org/project/buildroot/patch/
20230801215958.1751367-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
