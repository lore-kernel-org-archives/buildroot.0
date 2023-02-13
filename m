Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E77C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 19:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1EE381D34;
	Mon, 13 Feb 2023 19:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1EE381D34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJ6FMhyVmIQI; Mon, 13 Feb 2023 19:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D7481D0C;
	Mon, 13 Feb 2023 19:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06D7481D0C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87DE61BF284
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 19:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FA8981D0C
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 19:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA8981D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ir8wFDKGYcSv for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 19:32:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63EF381BC6
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63EF381BC6
 for <buildroot@uclibc.org>; Mon, 13 Feb 2023 19:32:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pReYa-0002hj-Dg
 for buildroot@uclibc.org; Mon, 13 Feb 2023 20:32:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Feb 2023 20:31:34 +0100
Message-ID: <pan$f2c9f$45b402ed$8a520a74$eb69f52e@ID-313208.user.individual.net>
References: <20230117200821.2882597-1-bernd.kuhls@t-online.de>
 <87y1p1a9zk.fsf__32646.9581386604$1676300302$gmane$org@dell.be.48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi: fix armv5 build
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

Am Mon, 13 Feb 2023 15:57:51 +0100 schrieb Peter Korsgaard:

> Hi, are these fixed caused by new changes in kodi 19.5, or is 2022.02.x
> / 2022.11.x also affected?

Hi,

afaics Kodi enables NEON for all arm CPUs since version 17.0:

https://github.com/xbmc/xbmc/commit/
262ebc90ee36054e7eac1baeda7ccbae9995f606#diff-17055ed9d2412a650b2178dd19d3a7ba28bf725b7a2babe2a78ef5037a02b6a9R18

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
