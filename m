Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724D6C3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 17:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215E2614A2;
	Fri, 25 Aug 2023 17:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 215E2614A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1b5R8D46YqY; Fri, 25 Aug 2023 17:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58490605B3;
	Fri, 25 Aug 2023 17:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58490605B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB6C1BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F8D83CBD
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F8D83CBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5QS3V7sfOFs for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 17:23:12 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3C6283C9D
 for <buildroot@busybox.net>; Fri, 25 Aug 2023 17:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3C6283C9D
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1qZaWb-0009ZH-Bh
 for buildroot@busybox.net; Fri, 25 Aug 2023 19:23:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 25 Aug 2023 19:22:51 +0200
Message-ID: <pan$f21af$cc5eb5f6$18b75d96$2850ca3c@ID-313208.user.individual.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
 <20230822225949.2b326664__48539.150941518$1692738023$gmane$org@windsurf>
 <pan$e13d2$de8bbe61$f0a8808c$96f93b15@ID-313208.user.individual.net>
 <20230825190532.43dfeb9b@windsurf>
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fri, 25 Aug 2023 19:05:32 +0200 schrieb Thomas Petazzoni via buildroot:

> So you can apply complicated patches/changes, but you cannot adjust the
> configuration of your system to use eudev? 

Hi,

the init scripts of this system were created outside of buildroot and need 
a statically-populated /dev. As I said, changing the configuration is not 
possible, sorry.

Due to upstream now supporting a daemon-less build I thought I try again 
to get this series into buildroot. One of your arguments from 2016 was the 
lack of upstream support for this feature:
https://lists.buildroot.org/pipermail/buildroot/2016-July/470285.html

We do not need to trick-around with the build system anymore, we just add 
an option to build the package in a way which is supported by upstream 
now.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
