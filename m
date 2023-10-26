Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B83C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5896A42E03;
	Thu, 26 Oct 2023 16:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5896A42E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oz3nWiQTCXdT; Thu, 26 Oct 2023 16:52:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9955C42E00;
	Thu, 26 Oct 2023 16:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9955C42E00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96C451BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FC5D42E00
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FC5D42E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vel5PH431Kwe for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:52:09 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72E6C42DF7
 for <buildroot@uclibc.org>; Thu, 26 Oct 2023 16:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E6C42DF7
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qw3aY-0007RX-KO
 for buildroot@uclibc.org; Thu, 26 Oct 2023 18:52:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 26 Oct 2023 18:51:16 +0200
Message-ID: <pan$e41fd$697d2a98$1eeca1a$1202b144@ID-313208.user.individual.net>
References: <20231026092701.12345-1-adam.duskett__11152.3364832223$1698312455$gmane$org@amarulasolutions.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 00/30] package/python3: bump version to
 3.12.0
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

Am Thu, 26 Oct 2023 11:26:31 +0200 schrieb Adam Duskett:

>   package/python3: bump version to 3.12.0

Hi,

building this defconfig is broken with python 3.12:

BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_KMOD=y

libkmod/python/kmod/kmod.c:6022:34: error: 'PyThreadState' {aka 'struct 
_ts'} has no member named 'curexc_traceback'

libkmod/python/kmod/kmod.c:6782:53: error: 'PyLongObject' {aka 'struct 
_longobject'} has no member named 'ob_digit'

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
