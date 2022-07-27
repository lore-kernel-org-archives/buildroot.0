Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E8CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F60E409FB;
	Wed, 27 Jul 2022 10:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F60E409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJ2JiUh0yXTf; Wed, 27 Jul 2022 10:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE9E409F8;
	Wed, 27 Jul 2022 10:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE9E409F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C29E1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB97540105
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB97540105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQS3hkVGrzz2 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5D304028D
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5D304028D
 for <buildroot@uclibc.org>; Wed, 27 Jul 2022 10:17:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oGe6I-000AYs-62
 for buildroot@uclibc.org; Wed, 27 Jul 2022 12:17:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Jul 2022 12:16:22 +0200
Message-ID: <pan$74f48$42282b93$fd100b6e$bd156916@ID-313208.user.individual.net>
References: <20220213130306.3002130-1-bernd.kuhls@t-online.de>
 <20220727115113.0d06fb96__9944.83321426145$1658915496$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/e3: new package
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

Am Wed, 27 Jul 2022 11:51:13 +0200 schrieb Thomas Petazzoni via buildroot:

> This doesn't seem like a very useful addition to Buildroot to be honest.
> Do you have some convincing arguments? :-)

Hi Thomas,

the filesize should be unbeatable small:

# ls -la /usr/bin/e3
-r-xr-xr-x    1 root     root         16880 Jul 17 20:02 /usr/bin/e3

Hm, regarding platforms I found https://docs.huihoo.com/embedded-linux/
embedded-Linux-system-development-training-slides/text113.html which 
states it should also work on arm, so I will have a look at it.

Gentoo also provides it for riscv: https://packages.gentoo.org/packages/
app-editors/e3

Gentoo's description might also be convincing for you:
"It's heavily optimized for size and independent of libc or any other 
libraries, making it useful for mini-Linux distributions and rescue 
disks."

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
