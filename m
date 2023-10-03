Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644EBE7544B
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 11:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E029C41FBD;
	Tue,  3 Oct 2023 11:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E029C41FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aGshm6E_PWS; Tue,  3 Oct 2023 11:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 588DC41FBF;
	Tue,  3 Oct 2023 11:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 588DC41FBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0A31BF3EA
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 11:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 653D060E53
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 11:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 653D060E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgPzQh7J8vzt for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 11:13:13 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2144B60BEE
 for <buildroot@uclibc.org>; Tue,  3 Oct 2023 11:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2144B60BEE
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qndKw-0003xn-50
 for buildroot@uclibc.org; Tue, 03 Oct 2023 13:13:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 03 Oct 2023 13:12:10 +0200
Message-ID: <pan$e4c2e$65ef9aa7$60d9f1ab$55fd2db7@ID-313208.user.individual.net>
References: <20231002195159.3053254-1-bernd@kuhls.net>
 <20231002205144.GD2957__28552.5928296678$1696279934$gmane$org@scaer>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix cross build
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

Am Mon, 2 Oct 2023 22:51:44 +0200 schrieb Yann E. MORIN:

> So your patch looks like it is correct.
> 
> However, I would challenge it on other grounds: ISC decided to stop
> maintaing dhcp starting end of 2022, almost a year ago, when they
> released the last version of dhcp.
> 
> Should we just drop that package now and be done with it?

Hi Yann,

my patch follows Peter's intention:
"If it is dead upstream and hard to fix then that naturally makes it 
harder to do, but the intention is to fix it."
http://lists.busybox.net/pipermail/buildroot/2022-April/640709.html

The ISC dhcp package is also used in current Debian releases:
https://tracker.debian.org/pkg/isc-dhcp

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
