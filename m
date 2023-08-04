Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862ACC001DF
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 15:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD7E560B55;
	Fri,  4 Aug 2023 15:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD7E560B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wj4a3YvII69o; Fri,  4 Aug 2023 15:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B42B60B4E;
	Fri,  4 Aug 2023 15:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B42B60B4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA4B1BF271
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 15:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B7B940503
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 15:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B7B940503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVQA_xBP6q8M for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 15:33:10 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EE5240603
 for <buildroot@uclibc.org>; Fri,  4 Aug 2023 15:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EE5240603
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qRwnb-0004NG-It
 for buildroot@uclibc.org; Fri, 04 Aug 2023 17:33:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 04 Aug 2023 17:32:02 +0200
Message-ID: <pan$106c1$18469599$69744288$a02c39bc@ID-313208.user.individual.net>
References: <20230722073533.3072853-1-bernd@kuhls.net>
 <20230722232314.683b6431@windsurf>
 <6f65d64b-61e4-c574-1c6d-075beec80025__2330.9377183736$1691097798$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.2.0
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

Am Thu, 3 Aug 2023 23:22:13 +0200 schrieb Romain Naour:

> This meson version bump introduce a regression while building host-qemu
> on some host:
> 
> host/lib/libgio-2.0.so: undefined reference to `g_module_open_full'
> collect2: error: ld returned 1 exit status

Hi Romain,

my machine, running Debian Bookworm, does not belong to "some host" since 
I can not reproduce the build error with this defconfig:

BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_HOST_QEMU=y

Can you provide more informations?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
