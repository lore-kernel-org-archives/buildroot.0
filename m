Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E93AC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 07:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDEE8144B;
	Mon,  5 Dec 2022 07:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EDEE8144B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXqaLGi_rHW1; Mon,  5 Dec 2022 07:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409C28142E;
	Mon,  5 Dec 2022 07:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 409C28142E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 950BA1BF336
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 07:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C09940493
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 07:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C09940493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ld9LVjTU2iQ0 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 07:15:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09DD40346
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F09DD40346
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 07:15:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 941F140006;
 Mon,  5 Dec 2022 07:15:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p25gx-00CX5t-GX; Mon, 05 Dec 2022 08:15:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221204221145.9093-1-fontaine.fabrice@gmail.com>
Date: Mon, 05 Dec 2022 08:15:07 +0100
In-Reply-To: <20221204221145.9093-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Dec 2022 23:11:45 +0100")
Message-ID: <87v8mq724k.fsf@dell.be.48ers.dk>
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
 > make[2]: Entering directory '/home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01/power_prep'
 > /usr/bin/make -C ./../mach-/hw
 > make[3]: Entering directory '/home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01/power_prep'
 > make[3]: *** ../mach-/hw: No such file or directory.  Stop.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/44a2efc64b9b8ff4541430d6b649e7a11a4e4873

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
