Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D008C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0D6B60EA4;
	Mon,  3 Jul 2023 20:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0D6B60EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hx99-XCRDluK; Mon,  3 Jul 2023 20:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 404F660E34;
	Mon,  3 Jul 2023 20:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 404F660E34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 240151BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F156060E34
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F156060E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SejgFkWOik_h for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC3160BC1
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACC3160BC1
 for <buildroot@uclibc.org>; Mon,  3 Jul 2023 20:41:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qGQM7-0006tk-DH
 for buildroot@uclibc.org; Mon, 03 Jul 2023 22:41:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 03 Jul 2023 22:40:52 +0200
Message-ID: <pan$99b05$4b40dd80$a4d6fb63$35dc9f8a@ID-313208.user.individual.net>
References: <20230703202011.1995452-1-bernd@kuhls.net>
 <20230703203026.GL2510__34801.2332267658$1688416254$gmane$org@scaer>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/libnatpmp: fix header install
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

Am Mon, 3 Jul 2023 22:30:26 +0200 schrieb Yann E. MORIN:

> So it means 0e258b6190a5 (package/libnatpmp: bump version to 20230423)
> was not build-tested before being submitted? At least transmission
> unonditionally uses it, so a runtime test of transmission would catch
> it.

Hi Yann,

I build-tested libnatpmp, which showed no errors because the tarball, 
contrary to https://github.com/miniupnp/libnatpmp, contains declspec.h 
which is unused by libnatpmp now so I did not catch the change of the 
header file.

At this stage I did not build-test its dependee package transmission, 
only later when build-testing all my stuff I noticed the problem and sent 
the patch right away.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
