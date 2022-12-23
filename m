Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59CDC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 09:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C4848215E;
	Fri, 23 Dec 2022 09:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C4848215E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rusqcEcIg0Yx; Fri, 23 Dec 2022 09:35:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A31418210B;
	Fri, 23 Dec 2022 09:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A31418210B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D4B41BF34C
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC30261135
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC30261135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yukJvkoWY9El for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 09:35:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BBD61132
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72BBD61132
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:35:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70537100002;
 Fri, 23 Dec 2022 09:35:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p8eSd-002qsq-66; Fri, 23 Dec 2022 10:35:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221222225027.277117-1-fontaine.fabrice@gmail.com>
Date: Fri, 23 Dec 2022 10:35:27 +0100
In-Reply-To: <20221222225027.277117-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Dec 2022 23:50:27 +0100")
Message-ID: <87mt7ejwdc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: fix static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following static build failure raised since bump to version 1.15
 > in commit c31087182fa545784d9a0a01f0b32715d78c3955:

 > [ 79%] Linking C shared library libdeflate.so
 > /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/12.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 > /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/12.2.0/crtbeginT.o:
 > relocation R_ARC_32_ME against `__TMC_END__' can not be used when
 > making a shared object; recompile with -fPIC

 > Fixes:
 >  - http://autobuild.buildroot.org/results/25489e5c6f0da642136e099ab35b091624f53a2b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
