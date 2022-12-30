Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC09C4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 07:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB2754035D;
	Fri, 30 Dec 2022 07:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB2754035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrgGCPju6b9v; Fri, 30 Dec 2022 07:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 580DD40103;
	Fri, 30 Dec 2022 07:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580DD40103
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B0DE1BF366
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 07:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1055360AE1
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 07:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1055360AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BETDFZVqhUCQ for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 07:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7117360AC0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7117360AC0
 for <buildroot@uclibc.org>; Fri, 30 Dec 2022 07:23:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pB9jQ-0001eO-Iy
 for buildroot@uclibc.org; Fri, 30 Dec 2022 08:23:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Dec 2022 08:22:28 +0100
Message-ID: <pan$883a1$d4ba5a76$917a1ded$7238d253@ID-313208.user.individual.net>
References: <20221230034540.1073086-1-christian__36217.5899137341$1672372007$gmane$org@paral.in>
 <pan$e2610$5473bbcb$9428bcc9$2fd44237@ID-313208.user.individual.net>
 <CA+h8R2q-AEJCHbdKoD_VBaCp+be3HAg4LsujSkKgLBmQq=uAsQ@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rng-tools: cherry-pick fix
 for jitterentropy build failure
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Thu, 29 Dec 2022 22:59:39 -0800 schrieb Christian Stewart via
buildroot:

> It is not. The build fails without my patch.

Hi Christian,

could you please provide the defconfig which produces the build error? 

When fixing the autobuilder error I added the minimum number of patches 
needed for the fix. Maybe your defconfig is different. At least there 
were no new autobuild errors since my fix was committed: http://
autobuild.buildroot.net/?reason=rng-tools-6.15

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
