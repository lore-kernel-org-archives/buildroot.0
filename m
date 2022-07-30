Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B5EC04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4755540B86;
	Sat, 30 Jul 2022 16:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4755540B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZvyUPRn90Co; Sat, 30 Jul 2022 16:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB534408B7;
	Sat, 30 Jul 2022 16:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB534408B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED071BF84C
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29EAC60E38
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29EAC60E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LE9EjUBHCMF7 for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CE0D60BA8
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CE0D60BA8
 for <buildroot@uclibc.org>; Sat, 30 Jul 2022 16:41:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oHpWV-0008RH-8q
 for buildroot@uclibc.org; Sat, 30 Jul 2022 18:41:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jul 2022 18:41:00 +0200
Message-ID: <pan$ececc$42d5a99c$43b7bc8f$13a84de7@ID-313208.user.individual.net>
References: <20220730105534.645046-1-bernd.kuhls@t-online.de>
 <20220730174036.48ca64aa__27858.7368129351$1659195663$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error with
 c++ disabled
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

Am Sat, 30 Jul 2022 17:40:36 +0200 schrieb Thomas Petazzoni via buildroot:

> It is apparently an optional dependency, so why do we select it in
> Config.in?

Hi Thomas,

from the perspective of the build system, yes, libvpx is an optional 
dependency. When it comes to the user perspective of the transcoding 
feature, tvheadend by default includes codec-specific profiles, which 
include vp8:
https://github.com/tvheadend/tvheadend/blob/master/data/conf/transcoder/
profiles

So users who enable the transcoding option are expecting vp8 support, 
therefore I enabled it in Config.in:
https://git.busybox.net/buildroot/commit/package/tvheadend?
id=a9a14dc4357d32f705a52a5da73c782576ce6bc8

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
