Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A795C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 16:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14B0E41009;
	Fri,  9 Dec 2022 16:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14B0E41009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2djwZq3f4DN; Fri,  9 Dec 2022 16:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56B6240FFC;
	Fri,  9 Dec 2022 16:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B6240FFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F6EA1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ADA740FFC
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ADA740FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFAX87v4K_w4 for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 16:19:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37D8D40002
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37D8D40002
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 16:19:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12D90240003;
 Fri,  9 Dec 2022 16:19:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p3g5k-002flE-VO; Fri, 09 Dec 2022 17:19:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221204221145.9093-1-fontaine.fabrice@gmail.com>
Date: Fri, 09 Dec 2022 17:19:16 +0100
In-Reply-To: <20221204221145.9093-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Dec 2022 23:11:45 +0100")
Message-ID: <87h6y41rej.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add mxs-bootlets
 board handling
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add a custom case to make sure that a random configuration with an empty
 > board for mxs-bootlets doesn't fail. It reverts to
 > BR2_TARGET_MXS_BOOTLETS_STMP37xx in that case.

 >>>> mxs-bootlets 10.12.01 Building
 > BOARD=
 > CROSS_COMPILE="/home/thomas/autobuild/instance-1/output-1/per-package/mxs-bootlets/host/bin/arm-buildroot-linux-uclibcgnueabi-"
 > /usr/bin/make -j1 -C
 > /home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01
 > power_prep
 > /home/thomas/autobuild/instance-1/output-1/per-package/xinetd/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2
 > -g0 -static -DNO_RPC -I../../include -c -o inet_aton.o inet_aton.c
 > make[1]: Entering directory '/home/thomas/autobuild/instance-1/buildroot'
 > make[1]: warning: -j1 forced in submake: resetting jobserver mode.
 > build power_prep
 > /usr/bin/make -C power_prep ARCH= BOARD=
 > make[2]: Entering directory
 > '/home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01/power_prep'
 > /usr/bin/make -C ./../mach-/hw
 > make[3]: Entering directory
 > '/home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01/power_prep'
 > make[3]: *** ../mach-/hw: No such file or directory.  Stop.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/44a2efc64b9b8ff4541430d6b649e7a11a4e4873

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
