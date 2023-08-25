Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61788C3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A93983168;
	Fri, 25 Aug 2023 16:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A93983168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbhCaMzBOjJB; Fri, 25 Aug 2023 16:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D3E83CBC;
	Fri, 25 Aug 2023 16:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D3E83CBC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F39D71BF2CB
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAD7C614B0
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD7C614B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMUpqkWf8EhK for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:25:10 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DB6161495
 for <buildroot@uclibc.org>; Fri, 25 Aug 2023 16:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB6161495
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qZZcR-0005nz-E4
 for buildroot@uclibc.org; Fri, 25 Aug 2023 18:25:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 25 Aug 2023 18:24:41 +0200
Message-ID: <pan$e13d2$de8bbe61$f0a8808c$96f93b15@ID-313208.user.individual.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
 <20230822225949.2b326664__48539.150941518$1692738023$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH/next v9 00/12] Introduce libudev (branch
 yem/libudev-6)
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

Am Tue, 22 Aug 2023 22:59:49 +0200 schrieb Thomas Petazzoni via buildroot:

> I just wanted to question the relevance of this

> The first defconfig generates an output/target/ of 7.4 MB, the second
> defconfig generates an output/target/ of 5.4 MB.

> I don't have a very strong opinion on this so I could be convinced
> either way, but I find the extra complexity quite high compared to
> the usefulness for most typical use-cases.

Hi Thomas,

the reason I am carrying this patch in my personal tree is maintenance of 
a buildroot-based system which uses

BR2_ROOTFS_DEVICE_CREATION_STATIC=y

Without the libudev series I can not use packages like Kodi, and no, I can 
not change the rootfs setting for this system, sorry.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
